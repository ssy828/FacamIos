//
//  ViewController.swift
//  MyCalendar


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var syCalendar: SYCalendar!
    
    @IBOutlet weak var monthLB: UILabel!
    @IBAction func previousBtn(_ sender: UIButton)
    {
        syCalendar.previousMonth()
        monthLB.text = "\(syCalendar.month!)월"
    }
    
    @IBAction func nextbtn(_ sender: UIButton)
    {
        syCalendar.nextMonth()
        monthLB.text = "\(syCalendar.month!)월"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 데이터를 인스턴스를 할당해 -> 셀에 뿌려줌
        syCalendar.date = Date()
        monthLB.text = "\(syCalendar.month!)월"
    }

    func calender (_ calender: SYCalendar, didSelectedDate: Date)
    {
        syCalendar.previousMonth()
    }
    
    

}

