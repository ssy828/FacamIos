
//  NetworkManager.swift
//  LoginAndJSON
//
import Foundation
import UIKit
import Alamofire

// enum -> url 정리 : 로그인 / 회원가입  등등
//typealias Completion = ( _ isSucced: Bool, _ resultvalue: Any, _ error: Error ) -> Void

class NetworkManager
{
    
    enum APIType: String {
        case login
        case signup
        case feed
        case post
        
        var baseURL: String {
            return "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api/"
        }
        var getURL: String {
            switch self {
            case .login:
                return baseURL + "member/login/"
            case .signup:
                return baseURL + "member/signup/"
            case .feed:
                return baseURL + "post/"
            case .post:
                return baseURL + "post/"
            }
        }
    }
    // 싱글턴 패턴
  
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
    
    
    // MARK: With Alamofire
    func requestPostFromAlamofire(completion: @escaping ([PostDataprams]?) -> Void) {
        
        let postURL = URL(string: APIType.feed.getURL)!
        
        let header: HTTPHeaders = [
            "Authorization": "token \(token!)"
        ]
        
        Alamofire
            .request(
                postURL,
                headers: header
            )
            .responseData { response in
                switch response.result {
                case .success(let value):
                    let model = try! JSONDecoder().decode([PostDataprams].self, from: value)
                    completion(model)
                case .failure(let error):
                    print(error)
                    completion(nil)
                }
        }
        
    }
    // MARK: Post With Alamofire
    func post(title: String, content: String?, image: UIImage?, completion: @escaping (Bool) -> Void) {
        
        let url = URL(string: APIType.post.getURL)!
        let header: HTTPHeaders = [
            "Authorization": "token \(token!)"
        ]
        
        
        Alamofire.upload(
            multipartFormData: { multipart in
                if let titleData = title.data(using: .utf8) {
                    multipart.append(titleData, withName: "title")
                }
                if let contentData = content?.data(using: .utf8) {
                    multipart.append(contentData, withName: "content")
                }
                
                let imageData = UIImageJPEGRepresentation(image!, 0.5)!
                multipart.append(imageData, withName: "img_cover", fileName: "\(title).jpeg", mimeType: "image/jpeg")
        },
            to: url,
            method: .post,
            headers: header,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let request, _, _):
                    request
                        .response(completionHandler: { _ in
                            print("success")
                            completion(true)
                        })
                    
                case .failure(let error):
                    print(error)
                    completion(false)
                }
        })
        
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
}
