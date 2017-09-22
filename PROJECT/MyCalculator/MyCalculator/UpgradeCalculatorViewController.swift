//
//  UpgradeCalculatorViewController.swift
//  MyCalculator
//
//  Created by SONGYEE SHIN on 2017. 9. 20..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class UpgradeCalculatorViewController: UIViewController {

    // MARK: - UI Property
    @IBOutlet var displayA: UILabel!
    
    // MARK: - ProPerty
//    var operation: (Double,Double) -> Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var waitingNumber: Double? {
        didSet{
            displayNumber = nil
        }
    }
    var displayNumber: Double?
    var digit: Double = 10
    
    // MARK: - IBAciton
    @IBAction func numberKeyClick(btn: UIButton){
      // 화면 정리 필요시
        let inputNum = Double(btn.tag) // tag: Int형만 가능
        
        if let newNumber = displayNumber
        {
            displayNumber = (newNumber * digit) + inputNum
        }else
        {
            // 처음 계산을 시작할때는 값이 없으므로
           displayNumber = inputNum
        }
    }
    
 
    // clear
    @IBAction func resetKey(btn: UIButton){
      
        
    }
    
    // 예전: 연산기능 저장 + 값을 다른 변수에 저장했음
    // 현재: 클로저를 이용해서 할 것
    
    @IBAction func opertation(btn: UIButton){
        
    
    }
   
    @IBAction func equals(btn: UIButton){
       
    
        
    }

    //MARK: - Secret Method
    //let add = {(num1,num2) -> Double in num1 + num2}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
