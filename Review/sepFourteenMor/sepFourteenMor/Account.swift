//
//  Account.swift
//  sepFourteenMor
//
//  Created by SONGYEE SHIN on 2017. 9. 14..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

class Account {
    
    let bankName: String
    var price: Int
    
    init(bankName: String, price: Int) {
        self.bankName = bankName
        self.price = price
    }
    // 두 개의 변수를 따로 따로 받을 경우 
    // 속성을 따로 따로 쓰고 싶은 경우
    // 예를 들면 계좌만 만들고 금액을 넣고싶지 않은 경우
    // 2개의 변수에 초기화하거나 옵셔널을 해줘야함
    // var price: Int = 0 이런식으로
    
//    init(price: Int) {
//        self.price = price
//    }
    
}

