//
//  ViewController.swift
//  TestClosure
//
//  Created by SONGYEE SHIN on 2017. 11. 1..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var testLb: UILabel!
   
   @IBOutlet weak var customView: CustomView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        customView.changeText(differentText: "오잉?")
        customView.delegate = self
    }


}

extension ViewController: CustomViewDelegate
{
    func didSelectedBtn(_ customView: CustomView) {
        
        testLb.text = "클릭"
        customView.testLB.text = "hm"
    }
}
