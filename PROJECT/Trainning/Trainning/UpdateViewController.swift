//
//  UpdateViewController.swift
//  Trainning
//
//  Created by SONGYEE SHIN on 2017. 9. 22..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {

    // MARK: - Label
    @IBOutlet var displayLb: UILabel?
    @IBOutlet var secondLB: UILabel?
    @IBOutlet var thirdLB: UILabel?
    @IBOutlet var fourthLB: UILabel?
    
    // MARK: - property
//    var resultValue: String = "" // 사칙함수 결과 값을 저장할 변수
//    var resultV: String = "" // 도형함수 결과 저장
//    // 위의 프로퍼티는 굳이 쓰지 않아도 됨
    
    
    override func viewDidLoad() { // 함수가 부르기 전에 시작지점
        super.viewDidLoad()
        
//        displayLb?.text = divInt(num: 3, number: 6)
        
//        displayLb?.text = circleArea(radius:4)
        
        // 강사님이 고쳐준것!
        // displayLb?.text = String(addInt(num: 4, number: 5))
         let resultValue: String = String(addInt(num:4, number: 5))
         thirdLB?.text = resultValue
        // 다른 사람꺼를 참고
        
        // 원의 넓이
//        displayLb?.text = circleArea(radiusValue: 2)
        displayLb?.text = "\(circleArea(radiusValue: 2))"
        
        // 구의 부피
        secondLB?.text = String(volumeOfSphere(radiusValue: 4))
    
    }

 
    // Mark: - Function
    // 사칙연산 함수
    // String으로 쓰면 여러개 할텐데 컴퓨터는 안되서
//    func addInt(num: Int, number: Int) -> String{
//        resultValue =  String(num + number)
//        return resultValue
//    }
        // 강사님
    // Int끼리 더할 것을 알기때문에 아예 결과를 Int로 나오게 하는 법 
    // 어디선가 또 사칙을 할 것이므로
    func addInt(num: Int, number: Int) -> Int {
        return num + number
    }
    
//    func subInt(num: Int, number: Int) -> String {
//        resultValue = String(num - number)
//        return resultValue
//        
//    }
//    func mulInt(num: Int, number: Int) -> String {
//        resultValue = String(num * number)
//        return resultValue
//    }
//    
//    func divInt(num: Int, number: Int) -> String { // 레이블에 보여줄라면
//        
//        resultValue = String(num/number)
//        return resultValue
//    }
//    divInt(num: 8, number: 3) : 시작점이 여기가 아니므로 여기에 쓰면 안됨!
    // 함수: 시작점이 어디인지 알아야한다!
    
    // 강사림 리뷰로 새로 고침
    
    func subInt(num: Int, number: Int) -> Int {
        return num - number // 값을 반환 값을 집어넣으라고 저장한 문장이 아니므로 가능!
        // return result = "a" 명령은 절대 안됨
    }
    
    func mulInt(num: Int, number: Int) -> Int {
       // 이 안에 resultValue: String = 0 을 여기에 넣어야함
        return num * number
    }
    
    func divInt(num: Int, number: Int) -> Int { // 레이블에 보여줄라면
        return num / number
    }
    
    // MARK: - 도형함수에 쓰일 변수
    let pi: Double = 3.14
    //var square: Double = 0.0 // 제곱 값을 저장할 변수
    //var radius: Double = 0.0 // 밑변/ 반지름 값을 저장할 변수
    // var piRadiusValue: Double = 0.0 // 원주율과 반지름 곱한 것을 담을 변수
    
    
    // MARK: - 도형함수
    // 제곱이 되는 함수
    func squareCal(radius: Double) -> Double {
        return radius*radius
    }
    
    // 원의 넓이 함수 // Double 타입으로 받을 것! 이유: 어차피 어디선가 또 써야할 수 도 있어서
    // String으로 쓰면 String에 쓰일 때만 하나만 써야함.
    func circleArea(radiusValue: Double) -> Double { // 파라미터: radius를 받아서
       // var resultV: String = "" 어차피 여기서 쓰고 끝내야함 쓸 필요가 사실 없음
        return pi*squareCal(radius: radiusValue)
        // 원의 넓이 함수의 파라미터를 제곱함수 매개변수에 넣어주면
        // 파이와 제곱을 곱해서 결과 값에 저장

    }
    
    // 구의 부피 함수
    func volumeOfSphere(radiusValue: Double) -> Double {
        // 결과 값을 보여줄려면 문자열로해야하므로
//        resultV = String(3/4*pi*radiusValue*squareCal(radius: radiusValue))
//        return resultV
        return 3/4*pi*radiusValue*squareCal(radius: radiusValue)
        // 파라미터 radiusValue 값을 가지고 squareCal( )함수 파라미터에 넣어서 
        // 파라미터로 연결해서 사용하는 것임
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
