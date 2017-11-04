//
//  ViewController.swift
//  TestMapReduceEtc
//
//  Created by SONGYEE SHIN on 2017. 11. 1..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         // 1 ~ 10 짤수를더한다
        let number = 1...10
        
        let totalEvenNum = number.filter { (num) -> Bool in
            return num % 2 == 0
            }.reduce(0) { (r, num) -> Int in
                return r + num
        }
        
//        let totalFunNum = totalEvenNum(numbers:)
    }
    func totalEvenNum (numbers: [Int]) -> Int
    {
        var totalNum = 0
        for n in numbers
        {
            if n % 2 == 0
            {
                totalNum += n
            }
        }
        return totalNum
    }
 
    
}

