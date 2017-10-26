//
//  ViewController.swift
//  UIViewSepTwentyFive
//
//  Created by SONGYEE SHIN on 2017. 9. 25..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let origin: CGPoint = CGPoint(x: 100, y: 100)
//        let size: CGSize = CGSize(width:200, height:200)
//        let rect: CGRect = CGRect(origin: origin,size:size)
        
//        let subView:UIView = UIView(frame:CGRect(x:100 , y:100, width: 100, height: 200))
     //   let subView: UIView = UIView(frame: rect) // subView에 UIView( ) 인스턴스를 넣는다.
//        subView.tag = 3 // subView인스턴스가 프로퍼티 tag에 3을 저장하는 것.
//        self.view.addSubview(subView)
//        // view 인스턴스가 addSubview 프로퍼티에 아규먼트로 subview를 넣는다
         let subView:UILabel = UILabel(frame:CGRect(x:100 , y:100, width: 100, height: 200))
        subView.backgroundColor = UIColor.darkGray
        subView.text = "NO"
        view.addSubview(subView)
        // view 인스턴스가 addSubview 프로퍼티에 아규먼트로 subview를 넣는다
        
        let halfView:UIView = UIView(frame: CGRect(x:0,y:0,width: view.bounds.size.width, height:view.bounds
        .size.height/2))
        halfView.backgroundColor = UIColor.black
        view.addSubview(halfView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

