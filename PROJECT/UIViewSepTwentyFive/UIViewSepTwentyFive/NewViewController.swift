//
//  NewViewController.swift
//  UIViewSepTwentyFive
//
//  Created by SONGYEE SHIN on 2017. 9. 25..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newView: UIView = UIView(frame:CGRect(x:20,y:20,width:345,height:100)) // frame 프로퍼티를 파라미터(매개변수)로 쓰고 CGRect구조체(메소드) 사용
        newView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        view.addSubview(newView)
        
        // 밑에 나오게 하는 법
        let subView: UIView = UIView(frame:CGRect(x: 20, y: view.bounds.height-115, width: 345, height: 100))
        subView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        view.addSubview(subView)
        // view(슈퍼클래스 프로퍼티)가 addSubview메소드에 (subView) 인스턴스를 전체 뷰에 넣겠다는 것!
        
        // view.bounds.height-115 -> bounds프로퍼티의 전체 높이에서 115를 빼는 것은
        // 뷰 크기 + y좌표를 더한 값을 빼는 것!// 수첩에 씀
        
        
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
