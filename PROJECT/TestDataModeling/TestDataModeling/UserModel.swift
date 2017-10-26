import Foundation

enum Gender: Int
{
    case man = 1
    case woman = 2
}

//유저 모델
struct UserModel
{
    var userID:String
    var pw:String
    var email:String
    var birthday:String?
    var gender:Gender?
    
    init?(dataDic:[String:Any])
    {
        //필수 항목 모델화
        guard let userID = dataDic["UserID"] as? String else {return nil}
        self.userID = userID
        
        guard let pw = dataDic["userPw"] as? String else {return nil}
        self.pw = pw
        
        guard let email = dataDic["email"] as? String else {return nil}
        self.email = email
        
        //옵셔널 항목 모델화
        self.birthday = dataDic["birthDay"] as? String
        
        if let rawData = dataDic["gender"] as? Int, (rawData == 1 || rawData == 2)
        {
            self.gender = Gender(rawValue:rawData)
        }
    }
}

