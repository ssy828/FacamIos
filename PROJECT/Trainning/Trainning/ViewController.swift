//
//  ViewController.swift
//  Trainning
//
//  Created by SONGYEE SHIN on 2017. 9. 21..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

//    var compareNumber: String = "" // 비교할 대상을 저장할 변수
//    var resultValue: String = "" // 결과를 저장할 변수
   
    @IBOutlet var firstLB: UILabel!
    @IBOutlet var secondLB: UILabel!
    @IBOutlet var thirdLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
        // TimeInSeconds의 인스턴스 생성
        let toolBoxInstance: ToolBox = ToolBox( )
        // 결과를 저장
        var resultValue: Int = toolBoxInstance.timeToSeconds(number: 11320)
        // 시간을 -> 초단위로
        firstLB.text = "\(resultValue)"
       
        // 초단위 -> 시간으로
        resultValue = toolBoxInstance.secondsToTime(number:4400)
        secondLB.text = "\(resultValue)"
        
        

    }
    

    
    

}

