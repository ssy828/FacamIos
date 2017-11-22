//
//  TableViewController.swift
//  LoginAndJSON
import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var data = NetworkManager.one
    let cellID = "Cell"
    var source: [PostDataprams]?

    override func viewDidLoad() {
        super.viewDidLoad()
//        data.requestGet { (isSuccess, data) in
//            if isSuccess {
//                self.source = data
//                self.tableView.reloadData()
//            }
//        }
    
        data.requestPostFromAlamofire { [weak self] data in
            self?.source = data
            self?.tableView.reloadData()
        }
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refreshTableView(_:)), for: .valueChanged)
    }
    
    
    
    @IBAction func addButton(_ sender: Any) {
        
    }
    
    @objc private func refreshTableView(_ sender: UIRefreshControl) {
        data.requestPostFromAlamofire { [weak self] data in
            sender.endRefreshing()
            self?.source = data
            self?.tableView.reloadData()
        }
        
    }

}

// MARK: UITableViewDataSource
extension TableViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellData = source?[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! FeedCell
        cell.idLB.text = cellData.title
        cell.contentsLB.text = cellData.content
        cell.imgView.setImageFromServer(at: cellData.imgCover!)
        return cell
    }
    
    
    
}

// MARK: UITableViewDelegate
extension TableViewController: UITableViewDelegate
{
    
}


