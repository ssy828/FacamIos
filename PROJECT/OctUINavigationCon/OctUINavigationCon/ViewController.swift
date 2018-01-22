//
//  ViewController.swift
//  OctUINavigationCon
//
//  Created by SONGYEE SHIN on 2017. 10. 11..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit
// 현시점에는 네비게이션 뷰컨트롤러 맞음
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 네비게이션아이템 center에 이미지 넣기
        let imageView: UIImageView = UIImageView()
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        let image: UIImage? = UIImage(named: "카카오톡.jpg")
        imageView.image = image
        
        let nextBtn: UIButton = UIButton(type:.custom)
//        nextBtn.setImage("카카오톡.jpg", for: UIControlState.normal)
        nextBtn.setTitle("NEXT", for: UIControlState.normal)
        // NEXT 버튼 색 바꾸기
        nextBtn.setTitleColor(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), for: .normal)
        // self: 현재 뷰컨트롤러 인스턴스
        nextBtn.addTarget(self, action: #selector(nextBtn(_:)), for: UIControlEvents.touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: nextBtn)
        // BACK버튼 색 바꾸기
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        self.navigationItem.titleView = imageView
       
        
        
        
    }
    // 버튼의 핸들러
    @objc func nextBtn(_ sender: UIButton) {
        goToNextVC()
    }

    private func goToNextVC() {
        // 다음 뷰컨트롤러로 push!
        let nextVC: UIViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        // self: 내 뷰컨트롤러임
        // 스토리보드 안에 있는 그 뷰컨트롤러에 세컨드뷰컨트롤러가 같은 스토리 보드 안에 있는지 확인 후
        // SecondViewController 클래스 인스턴스가 nextVC로 다운캐스팅되어서 할당
        // UIViewController인데
        
        // 현재는 navigationCotroller가 nil임
        self.navigationController?.pushViewController(nextVC, animated: true)
        // 위의 코드: 스토리보드상 segue가 show역할을 함
        // push: navigationController가 됨
        // push가 되는 동시에 navigationController에 nextVC가 들어감
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

