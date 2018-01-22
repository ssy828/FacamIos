//
//  ViewController.swift
//  TestNotification
//
//  Created by SONGYEE SHIN on 2017. 10. 24..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Lb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        NotificationCenter.default.addObserver(forName: Notification.Name.init("TestNoti"), object: nil, queue: nil) {
            (noti) in
            if let text = noti.object as? String {
                self.Lb.text = text
            }
        }
    }

}

