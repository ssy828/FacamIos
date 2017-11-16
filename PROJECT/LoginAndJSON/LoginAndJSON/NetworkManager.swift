//
//  NetworkManager.swift
//  LoginAndJSON
//


import Foundation


// enum -> url 정리 : 로그인 / 회원가입  등등
//enum urlAddress: String
//{
//
//    case logIn =
//    case signUp
//    case logOut
//    case userDetail
//
//
//}
//typealias Completion = ( _ isSucced: Bool, _ resultvalue: Any, _ error: Error ) -> Void

//func requestSignup(userId : String, userPwd: String, completion: Completion)
//{
//    
//}

// 클로저 안에서  let code = (response as! HTTPURLResponse).statusCode


let base = "http://api-ios-dev.ap-northeast-2.elasticbeanstalk.com/api"
let logInURL = "/member/login/"
let signUpURL = "/member/signup/"
class NetworkManager
{
    // 싱글턴 패턴
    static let one: NetworkManager = NetworkManager()
    
    // 토큰값
    private let tokenKey = "key"
    
    // 토큰을 연산 프로퍼티 사용해 바로 값을 가져오고 넣어줄 것임
    private var token: String? {
        get {
            return UserDefaults.standard.string(forKey: tokenKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: tokenKey)
        }
    }
    
    // MARK: 로그인 메소드
    func fetchLogin(userId: String, userPwd: String, completion: @escaping (Bool) -> Void )
    { //@escaping: 클로저가 끝나고도 실행가능하다는 의미!
        
        // 전송할 값 준비
        let param = "username=\(userId)&password=\(userPwd)"
        guard let dataParams = param.data(using: .utf8) else { return }
        
        fetch(page: logInURL,
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
        
        fetch(page: signUpURL,
              statusCode: 201,
              httpsMethod: "POST",
              httpbody: paramData,
              completion: completion)
    }
    
    // MARK: 반복적인 기능
    private func fetch(page: String, statusCode: Int, httpsMethod: String, httpbody: Data, completion:  @escaping (Bool)-> Void)
    {
        
        // url 객체 정의
        guard let url = URL(string: base + page) else { return }
        
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
                        guard let json = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: String] , let token = json["key"] else { return }
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


