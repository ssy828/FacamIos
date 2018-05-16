//
//  UIScrollViewTEST.swift
//  UIScrollViewTest
//
//  Created by SONGYEE SHIN on 2017. 9. 28..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class UIScrollViewTEST: UIViewController {
    
    // scrollView 프로퍼티 만듦
    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // var v1 = UIView()
        viewAdd(color: #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
        
    }
    // 뷰를 만들 함수
    func viewAdd(color: CGColor){
        let rect: CGRect = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        scrollView = UIScrollView(frame: rect) // 스크롤뷰 프로퍼티에 스크롤뷰크래스에 있는 프레임 프로퍼티에 상수 rect를 할당한 것을 스크롤뷰에 저장
        scrollView.contentSize = CGSize(width: 1100, height: view.frame.size.height)// 스크롤뷰의 사이즈는 컨텐츠뷰보다 작아야함
        view.addSubview(scrollView) // 뷰에 스크롤뷰 추가함
    }

}
