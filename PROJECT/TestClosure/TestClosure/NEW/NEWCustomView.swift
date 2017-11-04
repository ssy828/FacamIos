//
//  NEWCustomView.swift
//  TestClosure


import UIKit

class NEWCustomView: UIView {
    // 1
    @IBOutlet weak var btn: UIButton!
    
    // 3. 클로저 타입이 들어가는 변수
//    var didTapClosure: String -> Void? // 실수 하지마!
//    // 클로저의 타입이 옵셔널이여야하므로
//    // 전체 타입이 옵셔널이어야함
    var didTapClosure: ((String) -> Void)?
    
    // 2 뷰컨트롤러의 텍스트를 바꾸는 법
    // 뷰컨트롤러는 지금 모름
    @IBAction func didTapBtn()
    {
        // 이곳에서 클로저 사용
        didTapClosure?("가나다라마바사") // didTapClosure 안에 아무것도 없을 경우 이부분 실행 안됨!
        
    }
    
    // 순환참조로 서로를 가지고 있으므로 이건 쓰지 말것
//    var viewController: ViewController!
    
}
