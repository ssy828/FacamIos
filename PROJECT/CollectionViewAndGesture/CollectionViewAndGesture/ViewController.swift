//
//  ViewController.swift
//  CollectionViewAndGesture


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func addAction(_ sender: Any) {
        collectionView.performBatchUpdates({
            let indexPath = IndexPath(item:0, section: 0)
            // Item: 셀(아이템)의 위치
            let newItem = one.lbList[0]
            one.lbList.append(newItem)
            collectionView.insertItems(at: [indexPath])
        }, completion: nil)
        
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        collectionView.performBatchUpdates({
            let index = IndexPath(item: 0, section: 0)
            one.lbList.removeFirst()
            collectionView.deleteItems(at: [index])
        }, completion: nil)
    }
    var one = CustomCollectionViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
// MARK: UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return one.lbList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        // 라벨에 배열로 만든 것을 입력!
        cell.Lb.text = one.lbList[indexPath.item]
        cell.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return cell
    }
    
    
}
// MARK: UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    // MARK: 아이템 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width/3
//        let height = collectionView.frame.size.height/4
        return CGSize(width: width, height: width)
    }

    //   // MARK: 지금: 가로줄의미
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return collectionView.frame.size.height/4
//    }

    // MARK: 아이템끼리의 간격
    // -> 지금: 수평으로 설정 -> 세로줄의미
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}


