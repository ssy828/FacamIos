//
//  ViewController.swift
//  1019_prac
//
//  Created by ilhan won on 2017. 10. 19..
//  Copyright © 2017년 ilhan won. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableV:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        tableV.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    //뷰윌어피어 뷰가 나타나기전에 데이터를 테이블에 세팅
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataCenter.maincenter.nameList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
    
        
        cell.textLabel?.text = DataCenter.maincenter.nameList[indexPath.row]
        
        return cell

    }
    

}





