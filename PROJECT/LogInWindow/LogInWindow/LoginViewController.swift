
import UIKit

class LoginViewController: UIViewController {
    
    // 수정후:
    var userModel = UserModel()
    
    //    var userModel: [[String: String]] = [ ["username":"FAST","pwd":"1234"],["username":"ssy","pwd":"4321"],["username":"song","pwd":"1000"] ] // String 타입의 배열을 갖는 배열 : 아이디와 비밀번호는 문자열이므로
    // 하나의 배열 =  사용자의 정보를 가져와야함
    // 수정: 배열인데 딕셔너리를 가지고있는 모습으로 만들어줌
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var pwdTF: UITextField!
    @IBOutlet weak var loginBtn: RoundButton!
    // 속성을 넣기 위해서 만든 것
    // loginBtn 프로퍼티를 가지고 isSelected같은 것을 사용하기 위해
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        userNameTF.addTarget(self, action: #selector(didEndOnExit(_:)), for: .editingDidEndOnExit)
        pwdTF.addTarget(self, action: #selector(didEndOnExit(_:)), for: .editingDidEndOnExit)
        
    }
    // 화면과 화면을 연결하는 segue가 호출 되기 직전에 호출 되는 것
    // 실행되기 직전에 호출되는 함수 안에서 데이터를 간직하기위해?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 밑에 다운 캐스팅 시켜준 것!
        if let nextViewController = segue.destination as? SignUpViewController {
            nextViewController.didTaskClosure = { ( name: String, pwd: String) -> Void in self.userModel.addUser(name: name, pwd: pwd)
                //( name: String, pwd: String) -> Void in self.userModel.addUser(name: name, pwd: pwd)
                // 이 부분이 캡쳐를 해서 두개의 파라미터를 이용해 이 안에서 실행시키면 그때 이 부분이 실행
            }
        }
    }
    
    @objc func didEndOnExit(_ sender: UITextField){
        if sender === userNameTF{
            pwdTF.becomeFirstResponder()
        }
    }
    
    @IBAction func didTapLoginBtn(_ sender: RoundButton) {
        // 메소드: 행동을 표현하는 것
        guard let username = userNameTF.text, !username.isEmpty
            // nill이 아니고 실제 값이 있으면 유저네임에 할당한다.
            else{return} // 아무런 값이 없는 경우 그냥 종료하겠다.
        guard let pwd = pwdTF.text, !pwd.isEmpty else{return}
        // 가드문은 바인딩해준 상수가 살아남음
        //        for dict in userModel {
        //            if dict["username"] == username && dict["pwd"] == pwd {
        //                // 키값으로 유저네임을 가져오고
        //                print("**로그인 성공**")
        //                return
        //            }
        //
        let isLoginSuccess: Bool = findUser(name: username, password: pwd)
        if isLoginSuccess {
            // 화면 전환
            
            //            let main = MainViewController()
            //            present(main,animated: true, completion: nil)
        }else{
            
            // 틀렸다고 알려주는 애니메이트
            UIView.animate(withDuration: 0.2, animations: {
                self.userNameTF.frame.origin.x -= 10
                self.pwdTF.frame.origin.x -= 10
            } , completion: { _ in
                UIView.animate(withDuration: 0.2, animations: {
                    self.userNameTF.frame.origin.x += 20
                    self.pwdTF.frame.origin.x += 20
                } , completion:{ _ in
                    UIView.animate(withDuration: 0.2, animations: {
                        self.userNameTF.frame.origin.x -= 10
                        self.pwdTF.frame.origin.x -= 10
                    })
                    
                })
                
            })
            
            //
            //            // 비번 아이디가 다를 경우 텍스트필드 배경이 다르게 만든 것!
            //            userNameTF.backgroundColor = UIColor.red.withAlphaComponent(0.5)
            //            pwdTF.backgroundColor = UIColor.red.withAlphaComponent(0.5)
        }
        
        //        if let username = userNameTF.text{
        //            if let pwd = pwdTF.text{
        //          // 이프 렛은 pwd상수가 여기 이프문안에서만 사용가능함
        //            } else{
        //
        //            }
        //        }else{
        //
        //        }
        
        
    }
    
    
    
    func findUser(name: String, password: String) -> Bool {
        // 여러사람 가입하는 방식
        guard let userList:[[String:String]] = UserDefaults.standard.array(forKey: "UserList") as? [[String:String]] else{return false}  // 애니타입에서 문자열딕셔너리 타입으로 다운 캐스팅
        // userList 딕셔너리 타입의 배열임
        // 배열에서 가져오는 것임
        for userData in userList // 딕셔너리 
        {
            let memberID: String = userData["ID"]!
            if memberID == name {
               let memberPW: String = userData["PWD"]!
                if memberPW == password {
                    return true
                }
            }
          
        }
        
        
//        guard let memberID = UserDefaults.standard.string(forKey: "ID")
//            else { return false }
//        guard let memberPW = UserDefaults.standard.string(forKey: "PW")else{
//            return false }
//        // 옵셔널 이므로 가드문 추가
//
//        // 아이디가 유호한지
//        if name == memberID {
//
//            // 비번 확인
//            if password == memberPW {
//                return true
//            }
//        }
        
        return false
        
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

