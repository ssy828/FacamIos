//
//  LoginViewController.swift
//  MyLogin
//
//  Created by SONGYEE SHIN on 2017. 10. 18..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

//    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var userNameTF: CustomTextField!
    
    @IBOutlet weak var pwdTF: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

 
        // 글자 3개만 하겠다! 색깔주는것!
        // 다하고 싶으면 length: string.length
        userNameTF.configureAttributedString("아이디 입력", range: NSRange(location:0,length:3), stringColor: UIColor.red.withAlphaComponent(0.5))
        pwdTF.configureAttributedString("비밀번호 입력", range: NSRange(location:0,length:4), stringColor: UIColor.red.withAlphaComponent(0.4
        ))
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        // 키보드가 보여지기 직전에
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // 버튼을 이용해 로그인창 사라지게 하는 법
    @IBAction func didTapLoginButton(_ sender: RoundButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
         // 키보드가 보여질때를 대비하는 곳!!
        
        guard let userInfo = notification.userInfo else {return}
        // 지금은 높이가 고정되서 상관없다 begin end건
        guard let keyboardFrame = userInfo[UIKeyboardFrameBeginUserInfoKey] as? CGRect else {return}
        
//        scrollView.contentInset = UIEdgeInsetsMake(0, 0, keyboardFrame.size.height, 0)
        // 스크롤뷰가 contentInset 역할을 함
        // 키보드의 높이만큼 움지익는 것!
    }
    
    @objc func keyboardWillHide(notification: Notification)
    {
//        guard let userInfo = notification.userInfo else {
//            return
//        }
//        guard let keyboardFrame = userInfo[UIKeyboardFrameBeginUserInfoKey] as? CGRect else {return}
//        scrollView.contentInset = UIEdgeInsets.zero
        // scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
    }
    @IBAction func didTapSignInBtn(_ sender: RoundButton)
    {
        guard let username = userNameTF.text, !username.isEmpty else { return }
        guard let pwd = pwdTF.text, !pwd.isEmpty else { return }
        
        if  UserService.sharedInstance.validateUserInfo(username: username, pwd: pwd) {
            
            // 이부분이 있어야 필요함
            // 현재 false로 해둔 것을 true로 바꿔주고 로그인을 누르면
            // 로그인 성공하면 사라지게 하는 코드 
            UserDefaults.standard.set(true, forKey: "isLogined")
            dismiss(animated: true, completion: nil)
            print("성공")
        }else {
            print("실패")
        }
    }
    
    
    

}
