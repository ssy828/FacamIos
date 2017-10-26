//
//  ViewController.swift
//  TestGeneric
//
//  Created by SONGYEE SHIN on 2017. 10. 25..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 제네릭사용
        var foo = Stack<String>()
        foo.push("asdf")
        foo.pop()
        
        // 여러가지 타입은 되도록안쓰는게 좋음
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

