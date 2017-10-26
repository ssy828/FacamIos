//
//  ShadowView.swift
//  MyLogin
//
//  Created by SONGYEE SHIN on 2017. 10. 18..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    // 나만의 방식으로 만들라고 초기화할때부터 설정함!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        // 검정색에 반쿠명한 컬러!
        
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowOpacity = 0.5
        
    }

}
