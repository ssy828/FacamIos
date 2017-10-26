//
//  NewViewController.swift
//  UIViewTest
//
//  Created by SONGYEE SHIN on 2017. 9. 26..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    var lb:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
// 뷰 인스턴스 만들어 변수에 할당
        lb = UILabel(frame:CGRect(x: 100, y: 100, width: 100, height: 100))
        lb.numberOfLines = 0 // 글 라인 무제한
        lb.text = "????"
        view.addSubview(lb)
        
        let btn: UIButton = UIButton(type: UIButtonType.system) // .sytem만 써도 됨
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100
        )
        btn.setTitle("OH!!!", for: .normal)
        btn.setTitle("**Highlight**", for: .highlighted)
        btn.setTitle("SELECTED", for: .selected)
        btn.setTitleColor(.gray, for: .normal)
        btn.setTitleColor(.blue, for: .highlighted)
        btn.setTitleColor(.yellow, for: .selected)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        //self: ViewController
        btn.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1) //.purple
        view.addSubview(btn)
        // isUserInteractionEnabled : 사용자 버튼 누르는 것을 막음
    }

    @objc func btnAction(_ sender: UIButton) {
        // sender: btn 인스턴스
        if sender.isSelected {
            sender.isSelected = false
        }else {
            sender.isSelected = true
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
