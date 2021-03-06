//
//  UIScrollViewController.swift
//  UIViewTest
//
//  Created by SONGYEE SHIN on 2017. 9. 28..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    override func viewDidLoad() { // 메모리에 들어가는 부분
        super.viewDidLoad()
        let rect: CGRect = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/2)
        scrollView = UIScrollView(frame:rect)
        scrollView.delegate = self
        // 추가함
        scrollView.contentSize = CGSize(width: 1100, height: scrollView.frame.size.height)
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        // 컨텐츠뷰 x좌표와 스크롤뷰 x좌표 이동할때 셋팅하겠다는 것
        //       scrollView.setContentOffset(CGPoint(x:400,y:0), animated: true)
        // 이미 메모리에 저장되어있으므로 애니메이션이 보이지 않음
        view.addSubview(scrollView) // 이것만 쓸 경우 컨텐츠뷰 사이즈조정을 안해서 안움직임
        
        // n이 여기선 스크롤뷰의 x좌표가 내가 스크롤넘길때마다 x좌표가 이동하는 것.
        for n in 0...10
        {
            // 10칸을 만들 것이므로 100을 곱함.
            let view: UIView = UIView(frame:CGRect(x: n*100, y: 0, width: 100, height: 100))
            view.backgroundColor = UIColor(red:CGFloat(n)*25.0/255.0,green:CGFloat(n)*25.0/255.0,blue:0,alpha:1) // alpa: 1에 가까울수록 불투명도가 높아짐
            
            scrollView.addSubview(view)
            
            // Int(view.frame.size.height)+10 간격을 줌
            let view2: UIView = UIView(frame:CGRect(x: n*100, y:Int(view.frame.size.height)+10, width: 100, height: 100))
            view2.backgroundColor = UIColor(red: CGFloat(n)*25.0/255.0, green: 0, blue: CGFloat(n)*25.0/255.0, alpha: 1)
       
            scrollView.addSubview(view2)
            
        }
        
        
        // 예제3
        let switcher:UISwitch = UISwitch(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
        switcher.addTarget(self,action: #selector(valueChangeSwitcher(_sender:)),for:.valueChanged)
        scrollView.addSubview(switcher)
        
    }
   
   @objc func valueChangeSwitcher(_sender:UISwitch) {  }
    // 애니메이션을 보여주기 위해서 이쪽으로 뺌
    // 뷰가 나타난 후에 보여주라
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.setContentOffset(CGPoint(x:500,y:0), animated: true)
        
    }
    // 스크롤을 내릴때마다 실행
    func scrollViewDidScroll(_ scrollview:UIScrollView)  {
        let offsetX:CGFloat = scrollview.contentOffset.x
        _ = 1 - (offsetX - (scrollView.contentSize.width - scrollView.frame.size.width))
        
        scrollView.backgroundColor = UIColor(red: offsetX/scrollView.contentSize.width, green: offsetX/scrollView.contentSize.width, blue: offsetX/scrollView.contentSize.width, alpha: 1 )
    }
    
}
