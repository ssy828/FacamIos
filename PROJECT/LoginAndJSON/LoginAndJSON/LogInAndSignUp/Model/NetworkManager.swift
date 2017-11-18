//
//  NetworkManager.swift
//  LoginAndJSON
//


import Foundation
import UIKit

// enum -> url 정리 : 로그인 / 회원가입  등등

//typealias Completion = ( _ isSucced: Bool, _ resultvalue: Any, _ error: Error ) -> Void

// 클로저 안에서  let code = (response as! HTTPURLResponse).statusCode


let base = "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api"
//let logInURL = "/member/login/"
//let signUpURL = "/member/signup/"

class NetworkManager
{
    
    enum APIType: String {
        case login
        case signup
        
        var baseURL: String {
            return "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api/"
        }
        var getURL: String {
            switch self {
            case .login:
                return baseURL + "member/login/"
            case .signup:
                return baseURL + "member/signup/"
            }
        }
    }
    // 싱글턴 패턴
    static let one: NetworkManager = NetworkManager()
    // 토큰값
    private let tokenKey = "key"
    // 토큰을 연산 프로퍼티 사용해 바로 값을 가져오고 넣어줄 것임
    private(set) var token: String? {
        get {
            return UserDefaults.standard.string(forKey: tokenKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: tokenKey)
        }
    }
    // 로그인 상태
    var isLogin: Bool {
        return token != nil ? true : false
    }
    // MARK: 로그인 메소드
    func fetchLogin(userId: String, userPwd: String, completion: @escaping (Bool) -> Void )
    { //@escaping: 클로저가 끝나고도 실행가능하다는 의미!
        
        // 전송할 값 준비
        let param = "username=\(userId)&password=\(userPwd)"
        guard let dataParams = param.data(using: .utf8) else { return }
        
        fetch(page: APIType.login.getURL,
              statusCode: 200,
              httpsMethod: "POST",
              httpbody: dataParams,
              completion: completion)
    }
    
    // MARK: 회원가입
    func fetchSignup(userId: String, userPwd: String, completion: @escaping (Bool) -> Void)
    {
        // 전송할 값 준비
        let param = "username=\(userId)&password1=\(userPwd)&password2=\(userPwd)"
        guard let paramData = param.data(using: .utf8) else { return }
        
        fetch(page: APIType.signup.getURL,
              statusCode: 201,
              httpsMethod: "POST",
              httpbody: paramData,
              completion: completion)
    }
    
    // MARK: Alamofire 사용 코드
//    func fechLoginWithAF(userID: ) -> <#return type#> {
//        <#function body#>
//    }
//    
    
    // MARK: 사진 받아오기
    func requestGet(completion: @escaping (Bool, [PostDataprams]?)-> Void)
    {
        guard let tokenKey = token else { return }
        let url = URL(string: base + "/post/")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("Token \(tokenKey)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) {  (data, reponse, error) in
            if let data = data {
                do{
//                    guard let json = JSONSerialization.jsonObject(with: data, options: []) as? [[String: String]]
//                    // let data : [Dataprams] = []
                    let decoder = JSONDecoder()
                    let model = try decoder.decode([PostDataprams].self, from: data)
                    completion(true, model) // 데이터를 클로저를 통해서 보낼 것이므로
                }catch {
                    completion(false, nil)
                }
            }
        }
        task.resume()
    }
    // MARK: 사진 보내기(업로드) : 사진,텍스트 등등 따로 보낼 필요가 없음
    private func requestPost(post: PostDataprams, img: UIImage, completion: @escaping (Bool)->Void)
    {
        guard let tokenKey = token else { return }
        let url = URL(string: base + "/post/")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("Token \(tokenKey)", forHTTPHeaderField: "Authorization")
        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; Boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
         let filename = String(Date().timeIntervalSince1970) + ".jpeg"
        // multipart로 이미지 전환
        let body = createBody(parameters: post.param, boundary: boundary, data: UIImageJPEGRepresentation(img, 0.5)!, dataType: "img_cover", mineType: "image/jpeg", fileName: filename)
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data
            {
                do{
                    // 데이터를 어떻게 넘겨야 하나...
                    // 데이터를 받는 곳이 아니라... 그냥 이쪽만 하면 됨
                   completion(true)
                }catch{
                    completion(false)
                }
            }
        }
        task.resume()
    }
    // MARK: API 목록 : Member
    private func fetch(page: String, statusCode: Int, httpsMethod: String, httpbody: Data, completion:  @escaping (Bool)-> Void)
    {
        // url 객체 정의
        guard let url = URL(string: page) else { return }
        // 요청
        var request = URLRequest(url: url)
        request.httpMethod = httpsMethod
        request.httpBody = httpbody
        // 관련된 네트워크 데이터 전송 태스크 그룹을 조정하는 개체
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let `self` = self else {return}
            // 데이터를 옵셔널바인딩
            if let data = data {
                // statusCode 확인 부분
                if (response as! HTTPURLResponse).statusCode == statusCode
                {
                    do{
                        // json형태로 데이터 값을 읽어옴
                        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String], let token = json["key"] else { return }
                        self.token = token
                        completion(true)
                    } catch (let error) {
                        print("\(error.localizedDescription)")
                        completion(false)
                    }
                    
                }
            }
        }
        task.resume()// 대기 상태
    }
    // ????
    // MARK: multipart : data 만들기
    // : 여러곳에서 사용할 경우 대비해 메소드로 만들어 놓음
    // 이미지를 보내기 위해서
    // 서로 다른 데이터 타입을 합쳐서 보내는 것: multipart Form 
    private func createBody(parameters: [String: String],
                            boundary: String,
                            data: Data,
                            dataType: String,
                            mineType: String,
                            fileName: String ) -> Data {
        var body = Data()
        let boundaryPrefix = "--\(boundary)\r\n"
        for (key, value) in parameters{
            body.appendString(boundaryPrefix)
            body.appendString("Content-Disposition: form-data; name=\"\(key)\"")
            body.appendString("\r\n")
            body.appendString("\r\n")
            body.appendString("\(value)")
            body.appendString("\r\n")
        }
        body.appendString(boundaryPrefix)
        body.appendString("Content-Disposition: form-data; name=\"\(dataType)\"; filename=\"\(fileName)\"")
        body.appendString("\r\n")
        body.appendString("Content-Type: \(mineType)")
        body.appendString("\r\n")
        body.appendString("\r\n")
        body.append(data)
        body.appendString("\r\n")
        
        body.appendString("--\(boundary)--")
        
        return body
    }
}

extension Data
{
    mutating func appendString(_ string: String)
    {
        guard let data = string.data(using: .utf8, allowLossyConversion: false) else { return }
        append(data)
    }
}

