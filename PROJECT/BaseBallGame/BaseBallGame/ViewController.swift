//
//  ViewController.swift
//  BaseBallGame
//
//  Created by SONGYEE SHIN on 2017. 9. 21..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - Property : 선언만 할 것
    var numChoiceArr: [UILabel]? // 누른 숫자를 저장할 배열 준비 
    // 아직 값을 어떻게 줄지 모르니 -> 물음표
    var lbArray: [Int] = []
    
    // MARK: - Label
    @IBOutlet var resultLb: UILabel!
    @IBOutlet var firstLb: UILabel!
    @IBOutlet var secondLb: UILabel!
    @IBOutlet var thirdLb: UILabel!
    @IBOutlet var textView: UITextView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() { 
        super.viewDidLoad()
        numChoiceArr = [firstLb,secondLb,thirdLb] // 제일 먼저 실행 그래서 초기화를 여기서
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - number button
    @IBAction func numberBtn(btn: UIButton) {
        // if (numChoiceArr?.count)! < lbArray.count { // 중복 & 배열 제한
        let numChoice: Int = btn.tag // 선택 된 버튼 태그 저장
       // let index = lbArray.endIndex // 먼저실행하면 문제 없음
        lbArray.append(numChoice) // 버튼태그가 배열에 추가됨
        let index = lbArray.endIndex-1// -1을 안하면 두번째부터 시작됨.
        numChoiceArr![index].text = "\(numChoice)"
        
        
        // 0번째 인덱스를 만들고 다시 초기화하고
        // [0,1]이 만들어 지지 않음
        
//        firstLb.text = String(lbArray[0]) // 보여주기만 함. 저장은??
//        secondLb.text = String(lbArray[1]) // 이렇게 하면 하나씩 또 저장기능 만들어야함
//        thirdLb.text = String(lbArray[2])
    
    }
    
    // MARK: - check button
    @IBAction func checkBtn(btn: UIButton) {
        
    }
    
    
    // MARK: - start button
    @IBAction func startBtn(btn: UIButton){
        
    }
    // MARK: - backspace button
    @IBAction func backBtn(btn: UIButton){
        
    }
}



//// 중복 값
//// 위의 변수 선언 private var secretnumberList:[Int]?
//private func makeRandomNumber( ) -> [Int]
//{
//    
//    var randomNumberList: [Int] = []
//    
//    // arc4random_uniform(10) // 1~9 -> 100을 원하면 +1하기
//    
//    
//    while randomNumberList.count < 3{
//        // 타입추론이 아직 모르니 타입을 꼭 써줄 것!
//        let randomNum: Int = Int(arc4random_uniform(10))
//        if !randomNumberList.contains(randomNum)
//        {
//            randomNumberList.append(randomNum)
//        }
//    }
//    
//    // 중복 없는 3자리 숫자 반환 
//    // set 중복없지만 순서는 보장 못함
//    return randomNumberList
//}




