//
//  ViewController.swift
//  TestDELEGATE
//
//  Created by SONGYEE SHIN on 2017. 10. 12..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CustomViewDelegate {
    // 커스텀뷰델리게이트 프로토콜을 상속받음 -> 그래야 프로토콜에 있는 함수 사용함

    // UIView를 상속받은 것을 View를 만든 것!
    @IBOutlet var newView: CustomView! // 현재로는 아무 쓸모가 없음 -> 쓸모있는 것으로 바꿈
                                        // 
    // 애플에서 만들어준 것을 우리가 재정의해서 사용함
    // 애플에서 제공한 것을 다시 우리가 만들어준 것. 
    
    // 위의 것을 누르면 밑의 레이블을 바꿔야함
    @IBOutlet var newLB: UILabel!
    // 지금 현재로는 addTarget/ Delegate가 없으므로
    // 뷰컨트롤러는 버튼 액션이 실행한 것을 모름
    // 뷰컨트롤러에게 커스텀뷰가 어떻게 실행했다는 것을 알려줄려면 Delegate 필요!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newView.changeText(newText: "뷰컨트롤러에서 바꿈")
        newView.delegate = self // self: 뷰컨트롤러
    }

    // 프로토콜 커스텀뷰델리게이트 상속받아서 무조건 만들어야함
    func didSelectedCustomView(_ customView: CustomView) {
        // customView가 클릭됨
        newLB.text = "컴스텀뷰 클릭!"
        
        newView.titleLb.text = "델리게이트에서 바뀜"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

