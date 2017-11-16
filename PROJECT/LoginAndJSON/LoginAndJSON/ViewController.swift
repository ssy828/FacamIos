//
//  ViewController.swift
//  LoginAndJSON
//
//  Created by SONGYEE SHIN on 2017. 11. 16..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var network = NetworkManager.one
    
    @IBOutlet weak var userPwdTF: UITextField!
    @IBOutlet weak var userIdTF: UITextField!
    
    @IBAction func Login(_ sender: Any) {
        guard let userID = userIdTF.text else { return }
        guard let userPWD = userPwdTF.text else { return }
        network.fetchLogin(userId: userID, userPwd: userPWD) { [weak self] isSuccess in
            if isSuccess {
                guard let `self` = self else { return }
                // 로그인 처리
                let alert = UIAlertController(title: "로그인", message:"로그인 성공했습니다", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default, handler: nil) // 이쪽에서 handler에서 어떻게 넘어갈지 선택
                alert.addAction(okAction)
                DispatchQueue.main.async { // 비동기 이므로 이쪽에서 실행
                    self.present(alert, animated: true, completion: nil)
                }
                
            } else {
                
                //에러처리
            }
        }
        
    }
    
    @IBAction func signup(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  
    
    // 아이디 비밀번호 확인하는 메소드
    
    

}

