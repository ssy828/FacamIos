//
//  ViewController.swift
//  MyCalculator
//
//  Created by SONGYEE SHIN on 2017. 9. 11..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var inputString: String = ""
    
    @IBOutlet var displayA:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numberKeyClick(btn: UIButton){
        // btn.titleLabel?.text
        // inputString += btn.titleLabel!.text!
        if isOpPressed{ // 연산을 눌렀을때 화면에 저장
            displayA.text = btn.titleLabel?.text
            isOpPressed = false
        } else if displayA.text == "0"{
            displayA.text = btn.titleLabel?.text // 0이 화면에 출력안되게 하는 것
        }else {
            displayA.text! += btn.titleLabel!.text! // 계속 버튼을 누르면 연달아 나오는
         
        }
    }
    
    @IBAction func zeroKeyClick(btn: UIButton){
        
        if displayA.text != "0" {
            inputString += btn.titleLabel!.text!
            displayA.text = inputString
        }
    }
    
    @IBAction func resetKey(btn: UIButton){
        displayA.text = "0"
        //displayA.text = btn.titleLabel?.text
        // 현재 누른 버튼위에 있는 문자가 나오게 한다.
        // AC 버튼만 사용할 함수이므로 "0"을 쓰면 됨.
        inputString = ""
        // 리셋되는 방법
        
    }
    
    var resultValue: Double = 0 // 계산결과를 저장할 변수
    var currentValue: String = "" // 레이블에 현재 입력돼 있는 문자열값
    var op: String = ""
    var isOpPressed: Bool = false // 연산자를 연속해서 누르는 것 방지
    
    // 함수는 하나의 기능만 할 수 있다!!!!
    // operation 함수 : 입력한 수를 저장하는 것
    // 연산자 버튼을 눌렀을 때 값을 저장하는 경우
    @IBAction func opertation(btn: UIButton){
        
        currentValue = displayA.text!
        op = (btn.titleLabel?.text)!
        resultValue = Double(currentValue)!     // 현재 레이블에 입력돼 있는 문자열을 더블로 바꿔서 초기화
        isOpPressed = true // 연산자를 누름 표시
        
        //        inputString = displayA.text! // 처음 넣은 숫자 라벨에 표시를 변수에 저장
        //        op = (btn.titleLabel?.text!)! // 내가 누른 연산자 버튼 변수에 저장
        //        temp = Double(inputString)!
        //        if op == "+" {
        //            sum = sum + temp
        //        }
        //        inputString = ""
        //        print(sum)
    }
    
    // 연산 기능!!!
    // 출력은 버튼을 누르면 결과 출력
    @IBAction func equals(btn: UIButton){
        currentValue = displayA.text! //
//        if op == "+" {
//            resultValue = resultValue + Double(currentValue)!
//        }else if op == "−"{
//            resultValue = resultValue - Double(currentValue)!
//        }else if op == "×" {
//            resultValue = resultValue * Double(currentValue)!
//        } else{
//            resultValue = resultValue / Double(currentValue)!
//        }
        switch op {
            case "+":
                resultValue += Double(currentValue)!
            case "−":
                resultValue -= Double(currentValue)!
            case "×":
                resultValue *= Double(currentValue)!
            case "÷":
                resultValue /= Double(currentValue)!
            default:
                break
        }
        
        isOpPressed = true // 연산자 누름 표시
        displayA.text = String(Int(resultValue))
        
        //        inputString = displayA.text!
        //        if op == "=" {
        //            // inputString = displayA.text!
        //            sum = sum + Double(inputString)!
        //            displayA.text = String(sum)
        //            sum = 0
        //            
        //        
        //        }
    }
    
    // 
    //        if btn.titleLabel?.text! == "="{
    //            if op == "+"{
    //                sum += Double(temp)
    //            }else{
    //                
    //            }
    //        }else{
    //            op = (btn.titleLabel?.text!)!
    //        }
    //        
    
    
}
