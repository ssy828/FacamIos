//
//  main.swift
//  sepFourteenMor
//
//  Created by SONGYEE SHIN on 2017. 9. 14..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import Foundation

let account1: Account = Account(bankName: "신한은행", price: 5000)

let account2: Account = Account(bankName: "카카오뱅크", price: 3000)
// 이름이 바뀌지 않으니 상수로 지정한 것!

let customer1:Customer = Customer(name: "라이언", address: "신사")
customer1.accounts = [account1,account2]
print(customer1.totalAmount())
