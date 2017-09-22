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
    var resultValue: String = "" // 사칙함수 결과 값을 저장할 변수
    var resultV : String = "" // 도형함수 결과 저장
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        displayLb?.text = divInt(num: 3, number: 6)
        
//        displayLb?.text = circleArea(radius:4)
        
        
        // 원의 넓이
        displayLb?.text = circleArea(radiusValue: 2)
        
        // 구의 부피
        secondLB?.text = volumeOfSphere(radiusValue: 4)
    }

 
    // Mark: - Function
    
    // 사칙연산 함수
    func addInt(num: Int, number: Int) -> String{
        resultValue =  String(num + number)
        return resultValue
    }
    func subInt(num: Int, number: Int) -> String {
        resultValue = String(num - number)
        return resultValue
        
    }
    func mulInt(num: Int, number: Int) -> String {
        resultValue = String(num * number)
        return resultValue
    }
    
    func divInt(num: Int, number: Int) -> String { // 레이블에 보여줄라면
        
        resultValue = String(num/number)
        return resultValue
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
    
    // 원의 넓이 함수
    func circleArea(radiusValue: Double) -> String{ // 파라미터: radius를 받아서
        resultV = String( pi*squareCal(radius: radiusValue))
        // 원의 넓이 함수의 파라미터를 제곱함수 매개변수에 넣어주면
        // 파이와 제곱을 곱해서 결과 값에 저장
        return resultV
    }
    
    // 구의 부피 함수
    func volumeOfSphere(radiusValue: Double) -> String {
        // 결과 값을 보여줄려면 문자열로해야하므로
        resultV = String(3/4*pi*radiusValue*squareCal(radius: radiusValue))
        return resultV
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
