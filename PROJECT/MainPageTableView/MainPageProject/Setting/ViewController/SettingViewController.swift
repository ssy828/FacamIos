//
//  settingViewController.swift
//  MainPageProject
//
//  Created by SONGYEE SHIN on 2017. 10. 23..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    // DataSource: 테이블뷰에서 보여줄 데이터를 관리할 대리인의 역할 정의함
    // Delegate: 테이블뷰의 대리자로써의 수행할 역할 정의
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // 섹션의 수를 세는 메소드
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    // MARK: -배열묶음인 data의 섹션의 row개수
    // MARK: -섹션별 row 개수 리턴 코드
    // 섹션의 row 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    // 셀한테 데이터를 주고 다 표시해
    // 뷰컨트롤러: 데이터가 필요할때만 달라고 하는 것
    // MARK: -cell 관리(구현)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
