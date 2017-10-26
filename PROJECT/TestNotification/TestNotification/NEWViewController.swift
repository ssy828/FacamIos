//
//  NEWViewController.swift
//  TestNotification
//
//  Created by SONGYEE SHIN on 2017. 10. 24..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class NEWViewController: UIViewController {


    @IBOutlet weak var newLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
