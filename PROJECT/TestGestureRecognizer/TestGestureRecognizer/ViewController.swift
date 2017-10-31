//
//  ViewController.swift
//  TestGestureRecognizer
//
//  Created by SONGYEE SHIN on 2017. 10. 30..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var testView: UIView!
    
    @IBOutlet var testGesture: UITapGestureRecognizer!
    
    
    @IBOutlet weak var countLb: UILabel!
    
    
    @IBOutlet weak var locationLb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("xpositon", touch.location(in: touch.view).x)
        
        print("touch time stamp", touch.timestamp)
        
        print("touch tapCount",touch.tapCount)
        var touchCount = 0
        let temp = touch.tapCount
        touchCount += temp
     
        self.locationLb.text = "\(touch.location(in: touch.view).x)"
        self.countLb.text = "\(touchCount)"
        
        return true
    }
    
    
}

