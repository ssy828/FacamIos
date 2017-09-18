//
//  File.swift
//  sepFourteenMor
//
//  Created by SONGYEE SHIN on 2017. 9. 14..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation


class Customer {
    
    let name: String  // let으로 인스턴스설정:  초기화하면 다시는 바뀌지 못하게 한다.
    var address: String
    // var accounts: [Account] : 어카운트클래스에서 만든 인스턴스를 배열에 넣는 것
    var accounts: [Account] = [ ]

    init(name: String,address: String){
        self.name = name
        self.address = address
        
    }
        
     func totalAmount() -> Int 
     {
            // 위의 값을 저장한 accounts를 가져오면 되므로
        var total: Int = 0
        
         // accounts 배열에 있는 1개씩 계좌로 만드는 것.
        for account in accounts {
            total += account.price
     
        }
        return total
     }
 
}
