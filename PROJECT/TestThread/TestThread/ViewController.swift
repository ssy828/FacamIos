//
//  ViewController.swift
//  TestThread
//
//  Created by SONGYEE SHIN on 2017. 11. 6..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    //    @IBOutlet weak var testLB: UILabel!
//    @IBAction func testButton(_ sender: Any) {
//        longTimeAction()
//        testLB.text = "change"
//    }
    
    // 오랫동안 할 일이 있으면 thread를 돌려야함!
//    func longTimeAction()
//    {
//
//        var count = 0
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t) in
////            for n in 1...1000000
////            {
////                total += n
////                print(n)
////            }
//            self.testLB.text = "\(count)"
//            count += 1
//            if count == 100
//            {
//                t.invalidate()
//                // 언제든지 멈췄다가 시작했다가 가능!
//            }
//        }
//
    
//    }
    
    var URLList: [URL] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        longTimeAction()
        
        
        loadImage()
        
    }

    func loadImage()
    {
        
        self.imageView.imageForURL(URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS00Ff_B9eNwmeuOhInpWI-wzJt4EQ_c0deo5HCXEytlUDzEqSlHQ")!)
        // URL을 불러오고
//        DispatchQueue.global().async {
//           guard let baseURL = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS00Ff_B9eNwmeuOhInpWI-wzJt4EQ_c0deo5HCXEytlUDzEqSlHQ") else { return }
//            self.URLList.append(baseURL)
//            for url in self.URLList
//            {
//                if let data = try? Data(contentsOf: url)
//                {
//                    // MAIN에 쌓는다
//                    DispatchQueue.main.async {
//                        self.imageView.image = UIImage(data: data)
//                        self.imageView2.image = UIImage(data: data)
//                        self.imageView3.image = UIImage(data: data)
//                        self.imageView4.image = UIImage(data: data)
//                    }
//
//                }
//            }
//
//
//        }
       
    }

}
extension UIImageView
{
    func imageForURL(_ url: URL)
    {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
    }
}
