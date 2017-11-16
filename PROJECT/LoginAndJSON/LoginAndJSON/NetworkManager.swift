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
    let tokenKey = "key"
    
    
    
    // 토큰을 연산 프로퍼티 사용해 바로 값을 가져오고 넣어줄 것임
    var token: String? {
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
        
//         URL 객체 정의
        guard let url = URL(string: base + logInURL) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = dataParams  // 이곳에  데이터를 넣어서 보내줘야한다!

        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            // self가 옵셔널을 받으므로!
            guard let `self` = self else{ return }
            if let data = data {

                // 이곳은 데이터가 맞는지 확인
                if (response as! HTTPURLResponse).statusCode == 200 {

                    // 데이터에서 토큰을 가져와야하므로 -> 어떤 곳에 저장해야함
                    // 데이터는 보통 문자열로 받음
                    //                        String.init(data: data, encoding: .utf8)

                    do {

                        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: String],
                            let token = json["key"] else { return }

                        self.token  = token
                        completion(true) // 어떤 클로저 실행

                    } catch (let error) {
                        print("\(error.localizedDescription)")
                        completion(false) // 클로저 실행안함
                        return
                    }
                }
            }
        }
        task.resume() // 대기 상태
    }
    

    
    
}


