//
//  TableViewController.swift
//  LoginAndJSON
import UIKit

class TableViewController: UIViewController {

    var data = NetworkManager.one
    let cellID = "Cell"
    @IBOutlet weak var tableView: UITableView!
    
    var source: [PostDataprams]?
    
    @IBAction func addButton(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        data.requestGet { (isSuccess, data) in
            if isSuccess {
                self.source = data
                self.tableView.reloadData()
            }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = cellData.title
        cell.detailTextLabel?.text = cellData.content
//        cell.imageView?.image = cellData.imgCover
        return cell
    }
    
    
    
}

// MARK: UITableViewDelegate
extension TableViewController: UITableViewDelegate
{
    
}


