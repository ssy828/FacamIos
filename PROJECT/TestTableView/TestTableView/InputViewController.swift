//
//  InputViewController.swift
//  TestTableView
//
//  Created by SONGYEE SHIN on 2017. 10. 19..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var tf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveBtnHandler(_ sender: UIButton) {
            let name = tf.text ?? ""
            DataCenter.mainCenter.addName(name)
            self.navigationController?.popViewController(animated: true)
    }

}
