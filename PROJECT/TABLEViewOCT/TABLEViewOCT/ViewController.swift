//
//  ViewController.swift
//  TABLEViewOCT
//
//  Created by SONGYEE SHIN on 2017. 10. 20..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SwitchTableViewCellDelegate {

    @IBOutlet weak var tv: UITableView!
    var indexPath: SwitchTableViewCell?
    var onOffList: [Bool] = [true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true]//
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return onOffList.count
    }

     // 우리가 이동할때 셀이 움직이는 것
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SwitchTableViewCell
        cell.delegate = self // self: 뷰컨트롤러
        cell.textLabel?.text = "\(indexPath.row)"
        cell.switchData = onOffList[indexPath.row]
        cell.indexPath = indexPath
        return cell
    }
    
    // switchTableViewCellDelegate를 상속받았으므로 만든 프로토콜 항상 있어야함
    func switchTableViewCell(_ cell: SwitchTableViewCell, didChangedSwitch value: Bool) {
        print("change switch")
        onOffList[cell.indexPath!.row] = value
    }
}

