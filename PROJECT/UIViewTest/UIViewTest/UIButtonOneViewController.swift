//
//  UIButtonOneViewController.swift
//  UIViewTest
//
//  Created by SONGYEE SHIN on 2017. 9. 26..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class UIButtonOneViewController: UIViewController {
     // 버튼 한개씩 눌리는 UI
    
    // 버튼
    var one: UIButton!
    var two: UIButton!
    var three: UIButton!
    // var four: UIButton
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 모든 프레임 값 같게 하기
//        let allFrame = CGRect(x: 10, y: 10, width: view.frame.size.width/3, height: (view.frame.size.height/2)/3)

        // 버튼의 사이즈 값을 정하기 (길이, 높이 별로)
        let allWidth = (view.frame.size.width-20)/3
        let allHeight = ((view.frame.size.height-20)/2)/3

        // 색깔 지정
        let color = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)

        // 버튼1
//        let btnOne: UIButton = UIButton(type:.system)
//        // .sytem은 내가 원하는 모양으로 만들 수 있다.
//        btnOne.frame = allFrame
//        btnOne.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
//        view.addSubview(btnOne)
        var buttonFrame = CGRect(x: 10, y: 10, width: allWidth, height: allHeight)
        createButton(frame: buttonFrame, color: UIColor.blue, tag: 1)
//        let btnOne: UIButton = UIButton(type:.system)
//        btnOne.frame = CGRect(x: 10, y: 10, width: allWidth, height: allHeight)
//        view.addSubview(btnOne)
//        btnOne.backgroundColor = color
//        btnOne.tag = 1

        // 버튼2
//        let btnTwo: UIButton = UIButton(type: .system)
////        btnTwo.frame =
////        btnTwo.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
//        view.addSubview(btnTwo)
//        let btnTwo: UIButton = UIButton(type:.system)
//        btnTwo.frame = CGRect(x: 10+allWidth, y: 10, width: allWidth, height: allHeight)
//        view.addSubview(btnTwo)
//        btnTwo.backgroundColor = color
//        btnTwo.tag = 2
        
        buttonFrame = CGRect(x: 10+allWidth, y: 10, width: allWidth, height: allHeight)
        createButton(frame: buttonFrame, color: UIColor.orange, tag: 2)
        
        // 버튼3
        let btnThird: UIButton = UIButton(type:.system)
        btnThird.frame = CGRect(x:(2*allWidth)+10, y: 10, width: allWidth, height: allHeight )
        btnThird.backgroundColor = color
        view.addSubview(btnThird)
        btnThird.tag = 3
        // 버튼4
        let btnForth: UIButton = UIButton(type:.system)
        btnForth.frame = CGRect(x: 10, y: 10+allHeight, width: allWidth, height: allHeight)
        btnForth.backgroundColor = color
        view.addSubview(btnForth)
        btnForth.tag = 4
        // 버튼5
        let btnFifth: UIButton = UIButton(type:.system)
        btnFifth.frame = CGRect(x: 10+allWidth, y: 10+allHeight, width: allWidth, height: allHeight)
        btnFifth.backgroundColor = color
        view.addSubview(btnFifth)
        btnFifth.tag = 5
        // 버튼6
        let btnSixth: UIButton = UIButton(type:.system)
        btnSixth.frame = CGRect(x: 10+(allWidth*2), y: 10+allHeight, width: allWidth, height: allHeight)
        btnSixth.backgroundColor = color
        view.addSubview(btnSixth)
        btnSixth.tag = 6
        // 버튼7
        let btnSeven: UIButton = UIButton(type:.system)
        btnSeven.frame = CGRect(x: 10, y: 10+(allHeight*2), width: allWidth, height: allHeight)
        btnSeven.backgroundColor = color
        view.addSubview(btnSeven)
        btnSeven.tag = 7
        // 버튼8
        let btnEight: UIButton = UIButton(type:.system)
        btnEight.frame = CGRect(x: 10+allWidth, y: 10+(allHeight*2), width: allWidth, height: allHeight)
        btnEight.backgroundColor = color
        view.addSubview(btnEight)
        btnEight.tag = 8
        // 버튼9
        let btnNine: UIButton = UIButton(type:.system)
        btnNine.frame = CGRect(x: 10+(allWidth*2), y: 10+(allHeight*2), width: allWidth, height: allHeight)
        btnNine.backgroundColor = color
        view.addSubview(btnNine)
        btnNine.tag = 9

//
//        for element in 1...3 {
//
//        }
        
        
    }
    
    func createButton(frame: CGRect, color: UIColor, tag: Int) {
        
        let button: UIButton = UIButton(frame: frame)
        button.backgroundColor = color
        view.addSubview(button)
        button.tag = tag
        button.addTarget(self, action: #selector(didTapButton), for: UIControlEvents.touchUpInside)
    }
    
    @objc func didTapButton(_ sender: UIButton) {
        
    }

//    func btnAddSubView(tagNumber: Int) -> Int
//    {
//
//        var result: Int = 0
//        let allWidth = (view.frame.size.width-20)/3
//        let allHegiht = ((view.frame.size.height-20)/2)/3
//        let secondHoriZontal: Int = Int(10+allWidth) // 2번째 가로줄
//        let twoLineVertical: Int = Int(10+allHegiht) // 2번째 세로줄
////        let thirdHorZontal: Int = Int(10+(allWidth*2)) // 3번째 가로줄
////        let threeVertical: Int = Int(10+(allHegiht*2)) // 3번째 세로줄
//
//        //
//        
//
//        return result
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
