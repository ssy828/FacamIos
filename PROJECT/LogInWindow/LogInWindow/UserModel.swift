//
//  UserModel.swift
//  LogInWindow
//
//  Created by SONGYEE SHIN on 2017. 9. 27..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

final class UserModel {  //final: 상속을 못 받으니 컴파일이 빨라짐
    
    // 여러개의 유저를 가진 구조체
    var model:[User] = [
        User(username: "a1" ,pwd:"1004"),  // 자동완성 안될경우: .init( )활용 지워도 됨
        User(username: "a2", pwd: "45678"),
        User(username: "ssy", pwd: "00890")
    ]
    struct User {
        var username:String
        var pwd:String
    }
    
    // 불타입으로 반환 일치여부
    // 배열안에 있는 값과 파라미터2개의 값과 같은지 확인하는것! 
    func findUser(name:String,pwd:String) -> Bool
    {
        for user in model {
            if user.username == name && user.pwd == pwd{
                return true
            }
        }
        return false
    }
    
    func addUser(name: String, pwd:String)  {
     let newUser = User(username: name, pwd: pwd)
        model.append(newUser)
    }
    
    
    
}
