//
//  SecondViewController.swift
//  OctUINavigationCon
//
import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let back: UILabel = UILabel()
        back.text = "<<<<<" // 라벨은 액션이 없다.
    
        // 버튼에 액션을 넣음
        let backTitleBtn: UIButton = UIButton()
        backTitleBtn.setTitle("BACK", for: UIControlState.normal)
        // NEXT 버튼 색 바꾸기
        backTitleBtn.setTitleColor(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), for: .normal)
        // 액션을 넣음
        backTitleBtn.addTarget(self, action: #selector(backHandler(_:)), for: UIControlEvents.touchUpInside)
        
        // 배열로 해서
        // 배열순서대로 나타남
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: backTitleBtn),UIBarButtonItem(customView: back)]
    }
    
    @objc func backHandler(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
