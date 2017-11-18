//
//  SignUpViewController.swift
//  LoginAndJSON
import UIKit
//  회원 가입창실행
class SignUpViewController: UIViewController {

    var network = NetworkManager.one
    
    @IBOutlet weak var idTF: UITextField!
    @IBOutlet weak var pwdTF: UITextField!
    @IBOutlet weak var rePwdTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signUp(_ sender: Any)
    {
        guard let userId = idTF.text, !userId.isEmpty else { return }
        // isEmpty가 거짓이면 다음 가드문 실행
        guard let userPwd = pwdTF.text, !userPwd.isEmpty else { return }
        guard let userRePwd = rePwdTF.text, !userRePwd.isEmpty else { return }
        
        network.fetchSignup(userId: userId, userPwd: userPwd) { [weak self] isSuccess in
             // 클로저를 통해서 성공했을 경우
            guard let `self` = self else { return }
            if isSuccess
            {
                let alertController = Alert.showAlert(title: "회원가입 성공!", msg: "회원가입을 축하합니다!", cancelAction: true, completion: { _ in
    
                    // 네비게이션 컨트롤러일 경우
//                    if let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "Login") { self.navigationController?.pushViewController(nextVC, animated: true)}
                self.dismiss(animated: true, completion: nil)
                })
                DispatchQueue.main.async {
                    self.present(alertController, animated: true, completion: nil)
                }
            }else{
                
                if userPwd != userRePwd
                {
                    let alertController = Alert.showAlert(title: "실패", msg: "비밀번호가 다릅니다", cancelAction: true, completion: nil)
                    DispatchQueue.main.async {
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
  
    }

}
