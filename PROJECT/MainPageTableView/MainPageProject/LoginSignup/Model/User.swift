

import Foundation

// 유저 한명의 정보
struct User {
    let username: String
    var email: String
    var pwd: String
    // 실패할 경우 init?을 써줌 값이 없을 경우 nil 반환
    init?(dictionary: [String:Any]) {
        guard let username = dictionary["username"] as? String else { return nil }
        self.username = username
        guard let email = dictionary["email"] as? String else { return nil }
        self.email = email
        guard let pwd = dictionary["pwd"] as? String else { return nil }
        self.pwd = pwd
    }
}

struct Users {
    var users: [User] // user구조체의 묶음(배열)
    // [String:Any]으로 하면 -> 타입캐스팅 [String:Any] 또 해야함!
//    init(dic: [String: [[String:Any]]])
    init(dic: [String:Any]) {
        self.users = []
        guard let users = dic["item"] as? [[String:Any]] else { return }
        for user in users{
            self.users.append(User(dictionary: user)!)
        }
    }
    
}


