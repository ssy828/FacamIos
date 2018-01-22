//
//  NEWViewController.swift
//  TestNotification


import UIKit

class NEWViewController: UIViewController {

    @IBOutlet weak var newLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(forName: Notification.Name.init("TestNoti"), object: nil, queue: nil) {
            (noti) in // 클로저 사용함
            if let text = noti.object as? String { // 클로저 안에서 만듦
                self.newLb.text = text
            }
            
        }
    }
    
    // 이것을 꼭 헤야한다!!! -> 중간부분에서는 꼭 해야함!
    deinit{
        NotificationCenter.default.removeObserver(self)
    }

}
