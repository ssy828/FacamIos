//
//  NEWViewController.swift
//  TestClosure

import UIKit
// 버튼을 눌러서 레이블 텍스트를 바꾸는 것!
// 여러번 반복될 경우
class NEWViewController: UIViewController {
    // 커스텀뷰와 연결된 인스턴스 생성!
    @IBOutlet weak var customView: NEWCustomView!
    
    @IBOutlet weak var testLb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 여기서 완성시켜서 클로저를 사용
        // 항상 델리게이트랑 클로저를 항상 같이 구현해서 연습!!!
        // 한가지 액션만 할 경우 : 클로저 사용
        // 반복적인 액션을 할 경우 : 델리게이트 사용!
//        customView.didTapClosure = {
//            // 실제 클로저 넣어줄 것!
//            (string: String) -> Void in
//            self.testLb.text = string //파라미터 넣어줌
//        }
        
        // 클로저 축약문법
        customView.didTapClosure = { self.testLb.text = $0 }
        
        // MARK: filter 사용
        (0...10).filter { $0 % 2 == 0 } // 클로저가 한줄이면 가능!
        // 클로저 두줄인 경우 -> 아규먼트를 이용함
      
        
    }


}
