//
//  CustomCell.swift
//  SecondMain


import UIKit

class CustomCell: UITableViewCell {

    // MARK: 이미지 / 라벨 / 버튼
    @IBOutlet weak var itembtn: UIButton!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    // imageView 이름 하지 말것.
    // 셀 자체에 저 이름을 가진 것이 있으므로
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.addSubview(titleLb)
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
