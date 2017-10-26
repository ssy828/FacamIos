//
//  MyCell.swift
//  UITableViewTest
//
//  Created by SONGYEE SHIN on 2017. 9. 29..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class MyCustomCell: UITableViewCell {
    
    var bgImageView: UIImageView? // UIImageView타입 프로퍼티 선언
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createView()
    }
    // 시작점필요 -> init을 만듦
    required init?(coder aDecoder: NSCoder) { // UITableViewCell -> UIView에 상속됨
        super.init(coder: aDecoder)
        // 뷰 메소드 호출
//        createView()
    }
    
    // 뷰 생성
    func createView()
    {
        bgImageView = UIImageView() // 인스턴스 생성
        self.addSubview(bgImageView!)
    }
    
    func setImage(name: String)
    {
        bgImageView?.image = UIImage(named:name)
    }
    override func layoutSubviews() // 현재 있는 MyCustomCell에 있는 모든 뷰가 바뀌면 실행
    { // 자기 스스로 변경
        super.layoutSubviews()
        updateLayout()
    }
    func updateLayout()
    {
        bgImageView?.frame = self.bounds // self MyCustomCell인스턴스?
    }

//    override func awakeFromNib() {
//        super.awakeFromNib() // 스토리보드를 통해서 사용가능
//        // Nib파일 = 스토리보드
//        // ViewDidLoad와 같음
//        // Initialization code
//    }

  

}
