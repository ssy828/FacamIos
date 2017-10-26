//
//  UIScrollViewConTrainning.swift
//  UIViewTest
//
//  Created by SONGYEE SHIN on 2017. 9. 28..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class UIScrollViewConTrainning: UIViewController {

    var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 전체 화면에 스크롤뷰 넣기
        // 스크롤뷰 사이즈를 변수에 저장
        let rect: CGRect = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        
        scrollView = UIScrollView(frame: rect)
        // 스크롤 뷰의 사이즈를 frame 프로퍼티에 할당
        
        // 스크롤뷰가 컨텐츠 뷰에서 보일 사이즈 정하기
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        
        // 전체 뷰에 스크롤뷰 추가
        
        view.addSubview(scrollView)
    
        // 뷰 추가
        let view1: UIView = UIView(frame:CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
        view1.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        scrollView.addSubview(view1)
        
        
        
        
        
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
