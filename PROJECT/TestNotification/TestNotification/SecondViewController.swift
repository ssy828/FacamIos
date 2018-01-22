//
//  SecondViewController.swift
//  TestNotification

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tf: UITextField!
    @IBAction func notiBtn(_ sender: Any) {
       // 얘를 보내줘!
    NotificationCenter.default.post(name:Notification.Name.init("TestNoti"),object: tf!.text, userInfo:["noti":"info"])
        // TestNoti라는 값이 텍스트필드에 써진 것을 넘긴다 -> NewViewController를 넣어야함
        // object : 인스턴스를 넘기고
        // userInfo: 딕셔너리 형태로 넘김 -> 생략해도 가능!
    //  NotificationCenter.default.post(name:Notification.Name.init("TestNoti"),
        //object: tf!.text)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
