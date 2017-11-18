
//  ViewController.swift
//  LoginAndJSON
//

import UIKit

// MARK : 로그인
class LoginViewController: UIViewController {
    
    var network = NetworkManager.one
    
    @IBOutlet weak var userPwdTF: UITextField!
    @IBOutlet weak var userIdTF: UITextField!
    
    // MARK: 로그인 버튼눌렀을 때
    @IBAction func login(_ sender: Any) {
        guard let userID = userIdTF.text, !userID.isEmpty else { return } // 텍스트필드에 아무것도 안 썼을 경우 return
        guard let userPWD = userPwdTF.text, !userPWD.isEmpty else { return }
        network.fetchLogin(userId: userID, userPwd: userPWD) { [weak self] isSuccess in
            guard let `self` = self else { return }
            if isSuccess {
                // 로그인 처리
                // 클로저를 통해서 어떻게 넘길지 선택
                let alertController = Alert.showAlert(title: "로그인 성공", msg: "로그인 성공했습니다^^", actionStyle: .default, cancelAction: false, completion: { _ in
                    self.performSegue(withIdentifier: "Login", sender: nil)
                })
                DispatchQueue.main.async { // 서버와 앱은 비동기이므로
                    self.present(alertController, animated: true, completion: nil)
                }
            } else {
                let alertController = Alert.showAlert(title: "로그인 실패", msg: "로그인 실패했습니다", actionStyle: .destructive, cancelAction: false, completion: nil)
                DispatchQueue.main.async { // 서버와 앱은 비동기이므로
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
    }
 
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

