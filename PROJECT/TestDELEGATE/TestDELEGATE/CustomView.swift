//
//  CustomView.swift
//  TestDELEGATE
//
//  Created by SONGYEE SHIN on 2017. 10. 12..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

// 뷰컨트롤러에서 하는 일을 여기에 내가 선택해서 만든 것
// 지금 클래스의 역할: 버튼 누르면 역할이 바뀜
class CustomView: UIView { // UIView 상속받았으므로 다 사용 가능
    
    @IBOutlet var titleLb: UILabel!
    var delegate: CustomViewDelegate?

    
    // 뷰디드로랑 역할 같음
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        titleLb.text = "로드 완료!"
    }
    
    func changeText(newText:String)
    {
        titleLb.text = newText
    }
    
    // 버튼액션
    // 커스텀뷰 용도: 터치하면 글자가 바뀜
    @IBAction func btnAction(_ sender:UIButton)
    {
//        titleLb.text = "변했다"
          delegate?.didSelectedCustomView(self)
        // self: customView의 인스턴스를 넣음.
    
    }
    

}

protocol CustomViewDelegate {
    // 파라미터를 이용해 자신을 반환 
    func didSelectedCustomView(_ customView: CustomView)
}

