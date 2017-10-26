//
//  ViewController.swift
//  UIViewTest
//
//  Created by SONGYEE SHIN on 2017. 9. 26..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
//        // 뷰 인스턴스 만들어서 v1변수에 할당
//        let v1: UIView = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
//
//        // 뷰 추가
//        view.addSubview(v1)
//
//        // v1의 속성 변경
//        v1.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
//
////        let v2: UIView = UIView(frame: CGRect(x: v1.frame.size.width+20, y: 60, width: 100, height: 100))
////
//        let v2 = UIView()
//        view.addSubview(v2)
//        v2.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
//
//        v2.frame = CGRect(x:200,y:200,width:100,height:100)
//
//        let v3: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        v3.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
//        v1.addSubview(v3)
//
        let v1: UIView = UIView(frame:CGRect(x: 100, y: 100, width: 100, height: 100))
        view.addSubview(v1)
        v1.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        
        let v2: UIView = UIView(frame:CGRect(x: v1.frame.size.width-20, y: v1.frame.size.height-60, width: 100, height: 100))
        v1.addSubview(v2)
        v2.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        
        let v3Frame = CGRect(x: -70, y: +40, width: 100, height: 100)
        let v3:UIView = UIView(frame: v3Frame)
//        v3.convert(CGPoint.init(x: 10, y: 10), from: v2)
        v2.addSubview(v3)
        v3.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    
        let btn: UIButton = UIButton()
        btn.frame = CGRect(x: 10, y: 400, width: 100, height: 100)
        btn.setTitle("안녕?", for: UIControlState.normal)
        btn.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: UIControlState.highlighted)
        btn.addTarget(self, action: #selector(btnAction), for: UIControlEvents.touchUpInside) //self: viewController임
        view.addSubview(btn)
        
        
        let lb: UILabel = UILabel(frame: CGRect(x: v3.center.x, y: v3.center.y, width: 100, height: 100)) // v3에 라벨을 추가하므로 시작점은 v3에 맞춰짐
        lb.text = "안녕?"
        lb.font = UIFont.systemFont(ofSize: 14.0)
        lb.numberOfLines = 0 // 0으로 설정시 줄수가 무제한으로 나옴
        v3.addSubview(lb)
        
    }
    
   @objc func btnAction(_ sender:UIButton)  {
        print("버튼클릭")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

