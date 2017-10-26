//
//  SignUpViewController.swift
//  LogInWindow
//
//  Created by SONGYEE SHIN on 2017. 9. 27..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var pwdTF: UITextField!
    @IBOutlet weak var rePwdTF: UITextField!
    
    var didTaskClosure: ((String,String) -> Void)? = nil // 클로저가 들어감 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        userTF.addTarget(self, action: #selector(didEndOnExit), for: UIControlEvents.editingDidEndOnExit)
        pwdTF.addTarget(self, action: #selector(didEndOnExit), for: UIControlEvents.editingDidEndOnExit)
        rePwdTF.addTarget(self, action: #selector(didEndOnExit), for: UIControlEvents.editingDidEndOnExit)
    }
    
    
    // MARK: - Actions
    @objc func didEndOnExit(_ sender: UITextField) {
//       userTF.becomeFirstResponder() // 위의 텍스트 필드가 첫번째 리스폰더가 되겠다는 뜻
//        // 텍스트필드 다음으로 커서를 넘기는 반응
//        pwdTF.becomeFirstResponder()

        if sender === userTF { // === 메모리 주소가 같은지 확인 
              pwdTF.becomeFirstResponder()
        } else if sender === pwdTF {
            rePwdTF.becomeFirstResponder()
        }
    
    
    }
    
    // MARK: - 백스페이스
    @IBAction func didTapExitBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil) // 전 화면으로 돌아가는 것
        // (( ) -> Void)? 클로저 표시
        
    }
  
    // MARK: - 버튼 눌렀을때 받은 텍스트필드를 가지고
    @IBAction func didTapSignUpBtn(_ sender: RoundButton) {
        guard let userName = userTF.text else{ return }
        guard let pwd = pwdTF.text else { return }
        guard let rePwd = rePwdTF.text else { return }
        
        
        // 입력받은 패스워드 두개의 문자열이 같은지 비교!
        if pwd == rePwd {
            //같다면 회원가입 성공
//            print(userName,pwd,rePwd)
           // didTaskClosure?(userName,pwd)
            
            var list:[[String:String]]
            if let tempList = UserDefaults.standard.array(forKey: "UserList") as?  [[String:String]]
            {
                list = tempList
            }else{
                list = []
            }
            let userData:[String:String] = ["ID": userName, "PWD": pwd]
            // 딕셔너리에 넣고
            list.append(userData)
            // let list:[[String:String]] = [userData] // 딕셔너리를 담은 변수를
            // 다시 배열에 넣는 인덱스 하나에 한사람의 정보를 넣는 것!
            
            UserDefaults.standard.set(list, forKey: "UserList")
            // 영구적인 데이터를 list에 넣은 것을 키값으로 가져오는 것
            // 배열에서 데이터를 끄집어 내고 넣고 하는 것
           
//            UserDefaults.standard.set(userName, forKey: "ID")
//            UserDefaults.standard.set(pwd, forKey: "PWD")
            
            dismiss(animated: true, completion: nil)
        }else{
            // 다르다면 회원가입 실패
            print("로그인 실패!!")
        }
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
