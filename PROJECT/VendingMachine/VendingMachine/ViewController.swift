//
//  ViewController.swift
//  VendingMachine
//
//  Created by SONGYEE SHIN on 2017. 9. 15..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet var displayLb: UILabel!
    var resultValue: Int = 0 // 총액
    var balance: Int = 0 // 잔액
    let caramel: Int = 5600  // 카라멜 음료 금액
    // var label: String = displayLb.text// 라벨에 표현 될 변수
    let chaiLatte: Int = 5100 // 차이 음료 금액
    let vanillaCream: Int = 4800    // 바닐라크림 금액
    let javaChip: Int = 6100 // 자바칩 금액
    let greeTeanLatte: Int = 5900 // 그린티라떼 금액
    let strawberryCeram: Int = 5600 // 딸기크림 금액
    var funcStr: String = "" // 계산하는 함수를 String으로 리턴값으로 하므로 그것을 저장할 변수
    var topUp : String = "" // 충전금액
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        
//        self.displayLb.layer.cornerRadius = 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func caramel(btn: UIButton) {
//      displayLb.text = String(resultValue - caramel)
//      balance = resultValue - caramel
         // balance = calculation(beverage: caramel)
        funcStr = calculation(beverage: caramel)
       // displayLb.text = String(balance)
        //displayLb.text = "₩\(funcStr)"
        // ₩₩ 이중으로 나옴!
        displayLb.text = funcStr
    }
    @IBAction func chaiLatte(btn: UIButton) {
       funcStr = calculation(beverage: chaiLatte)
        // print(balance)
        // displayLb.text = String(balance)
        // displayLb.text = "₩\(balance)"
        displayLb.text = funcStr
    }
    @IBAction func vanillaCream(btn: UIButton) {
//        balance = calculation(beverage: vanillaCream)
        funcStr = calculation(beverage: vanillaCream)
        // displayLb.text = String(balance)
         displayLb.text = funcStr
    }
    @IBAction func javaChip(btn: UIButton) {
      funcStr = calculation(beverage: javaChip)
        // displayLb.text = String(balance)
         displayLb.text = funcStr
    }
    @IBAction func greenTeaLatte(btn: UIButton){
       funcStr = calculation(beverage: greeTeanLatte)
        // displayLb.text = String(balance)
         displayLb.text = funcStr
    }
    @IBAction func strawberryCream(btn: UIButton) {
        funcStr = calculation(beverage: strawberryCeram)
        // displayLb.text = String(balance)
//         displayLb.text = "₩\(funcStr)"
         displayLb.text = funcStr
    }
    
    @IBAction func chargeAmount(btn: UIButton) {
        topUp = btn.titleLabel!.text!
//      resultValue = balance + Int(topUp)!
//      이부분은 잔액을 바꿔줘야하는데 잔액이 바뀌지는 않으므로
        balance += Int(topUp)!
        // 잔액이 계속 바껴야하고 보여줘야하므로
        displayLb.text = "₩\(balance)"
        // 라벨에 총액을 문자열로 바꿔서 출력
        }
    
    // 음료 계산하는 함수
    func calculation(beverage: Int) -> String {
        // 잔액부족인 경우
        if balance < beverage  {
            // resultValue = resultValue - beverage
            return "잔액부족"
       
        }else if balance > beverage {
        // 잔액이 음료값보다 큰 경우
        // balance = resultValue - beverage
            balance -= beverage
        }
        return "₩\(balance)"
    }

}

