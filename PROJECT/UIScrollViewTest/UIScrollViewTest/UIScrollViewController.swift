//
//  UIScrollViewController.swift
//  UIViewTest
//
//  Created by SONGYEE SHIN on 2017. 9. 28..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class UIScrollViewController: UIViewController {

    var scrollView: UIScrollView!
    override func viewDidLoad() { // 메모리에 들어가는 부분
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let rect: CGRect = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/2)
        scrollView = UIScrollView(frame:rect)
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
    
    }
    
    // 애니메이션을 보여주기 위해서 이쪽으로 뺌
    // 뷰가 나타난 후에 보여주라
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.setContentOffset(CGPoint(x:500,y:0), animated: true)
        
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
