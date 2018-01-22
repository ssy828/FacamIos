//
//  ViewController.swift
//  SecondMain

import UIKit

class TableViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    // 만든 데이터를 받아와서 계속 업데이트를 시켜줄 것이므로 옵져버 사용!
    var data: [PhotoModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // cell ID
    let cellID = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

}

// MARK: UITableViewDataSource
extension TableViewController: UITableViewDataSource {
    // 섹션 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // 섹션 안에 row 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    // 셀 구현
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustomCell
        // 셀을 받아와 그걸 이용
        let cellData = data[indexPath.row]
        cell.titleLb.text = cellData.title
//        cell.imgView.image = UIImage(named: cellData.image)
//        cell.itembtn.backgroundImage(for: .normal)
        
        return cell
    }
    
    
}

// MARK:
extension TableViewController: UITableViewDelegate {
    
}
