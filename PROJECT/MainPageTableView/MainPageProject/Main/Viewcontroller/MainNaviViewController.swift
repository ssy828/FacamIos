//
//  MainNaviViewController.swift
//  MainPageProject
//
//  Created by SONGYEE SHIN on 2017. 10. 23..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class MainNaviViewController: UINavigationController {

    override func viewDidLoad() { //전체 뷰도 만들어지지 않았으므로
        // 이곳에서 실행 불가
        // 최초로: 윈도우 -> 뷰가 생성되어야 그 위에 뷰를 추가할 수 있으므로
        // 화면전환시 가능
        super.viewDidLoad()
        
        // 로그인 되지 않았으면 로그인창에서 네비게이션컨트롤러 부분을 실행시키기 위해서
        // 스토리보트 -> 로그인창 -> StoryboardID: LoginNavi
//        if !UserDefaults.standard.bool(forKey: "isLogined")
//        {
//           if let presentVC =   self.storyboard?.instantiateViewController(withIdentifier: "LoginNavi")
//           {
//            self.present(presentVC, animated: true, completion: nil)
//            }
//        }
        
    }
    
    // MARK: -
    // 화면이 나오고 난 후에 나타남
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !UserDefaults.standard.bool(forKey: "isLogined")
        {
//            if let presentVC =   self.storyboard?.instantiateViewController(withIdentifier: "LoginNavi") as? UINavigationController
//            {
//                self.present(presentVC, animated: false, completion: nil)
//            }
            
            //            showLoginPage() // : 이방식은 버튼이런걸로 액션을 하는 것으로
            
            // 수동적 세그 방식: 버튼/ 스위치 / 제스처를 selector를 사용하지 않고 뷰컨트롤러에서 만든 세그웨이 동작
            performSegue(withIdentifier: "goToLogin", sender: nil)
        }
    }

    func showLoginPage()
    {
        
        
        if let presentVC =   self.storyboard?.instantiateViewController(withIdentifier: "LoginNavi") as? UINavigationController
        {
            self.present(presentVC, animated: false, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
