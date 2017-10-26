//
//  SignUpViewController.swift
//  MyLogin
//
//  Created by SONGYEE SHIN on 2017. 10. 18..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var cellphoneEmailTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var userPwd: UITextField!
    @IBOutlet weak var userIdTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        NotificationCenter.default.addObserver(self, selector: <#T##Selector#>, name: .UIKeyboardWillChangeFrame, object: nil)
    }

    @objc func willChageKeyboardFrame(notification: Notification)
    {
        guard let userInfo = notification.userInfo else{return}
        guard let keyboardFrame = userInfo[UIKeyboardFrameBeginUserInfoKey]as?
            CGRect else {return}
//        let visibleHeight = UIScreen.main.bounds.
    
    }
    
    // MARK: -SignUp
    
    
    
}
