//
//  ViewController.swift
//  MyCalendar


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var syCalendar: SYCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 데이터 인스턴스를 할당해 -> 셀에 뿌려줌
        syCalendar.date = Date()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

