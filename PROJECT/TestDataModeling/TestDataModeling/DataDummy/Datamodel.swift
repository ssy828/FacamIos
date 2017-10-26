//
//  Datamodel.swift
//  MyLogin
//
//  Created by SONGYEE SHIN on 2017. 10. 16..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation
//
//struct UserModel
//{
//    var userID: String
//    var userPwd: String
//    var userEmail: String
//    var userBDay: String?
//    var userGender: Int? // 성별을 작성할수도 있고 안할수도 있으므로
//
//    // dataDic: 딕셔너리타입
//    init?(dataDic: [String: Any])
//    {
//        // 키값을 통해서 가져온 값이 있으면 String타입으로 바꿔주고 id에 할당함
//        guard let id = dataDic["userID"] as? String else {return nil}
//        // dataDic["userID"] -> "userID" 꼭 서버데이터 이름과 같아야한다!!!!
//        self.userID = id // self: struct인 유저모델 인스턴스
//        // userID에 id에 할당된 값을 할당함
//        guard let pwd = dataDic["userPwd"] as? String else {return nil}
//        self.userPwd = pwd
//        guard let email = dataDic["userEmail"] as? String else {return nil}
//        self.userEmail = email
//        guard let birthday = dataDic["userBDay"] as? String else{return nil}
//        self.userBDay = birthday
//        if let gender = dataDic["userGender"] as? Int,
//            (gender == 1 || gender == 2)
//        {
//            self.userGender = gender
//        }
//    }
//}


// Gender(열거형)
//enum Gender: Int
//{
 //   case man = 1
   // case woman = 2
//}
