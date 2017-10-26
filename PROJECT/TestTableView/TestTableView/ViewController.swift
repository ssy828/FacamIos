//
//  ViewController.swift
//  TestTableView
//
//  Created by SONGYEE SHIN on 2017. 10. 19..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tv: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        tv.reloadData() // 리로드
    
    }
    // 보여지기 전에 셋팅을 하고 보여지게 하기 위해
    override func viewWillAppear(_ animated: Bool)
    { // 이거 없으면 처음 읽었던 상태로 ui를 업데이트하지 않는다.
        super.viewWillAppear(animated)
    }

    // MARK: -UITableViewDataSource
    // 실제 데이터 카운터 들어가야함!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return 10
        
        return DataCenter.mainCenter.nameList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let name: String = DataCenter.mainCenter.nameList[indexPath.row]
        
        cell.textLabel?.text = name
        
        return cell
    }

}

