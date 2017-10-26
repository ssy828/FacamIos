//
//  CustomTextField.swift
//  MyLogin
//
//  Created by SONGYEE SHIN on 2017. 10. 18..
//  Copyright © 2017년 SONGYEE SHIN. All rights reserved.
//

import UIKit

class CustomTextField: UITextField{
    
    // 중복되는 기능을 줄이기 위해서 이곳에 씀
    func configureAttributedString(_ string: String, range: NSRange, stringColor: UIColor)
    {
        let attributedString = NSMutableAttributedString(string: string)
        // 클래스이기 때문에 속성을 바꿔도 그대로임
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: stringColor, range: range)
        
        self.attributedPlaceholder = attributedString
    }
    
    
    
    ////////////////
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        
        let leftViewWidth = self.bounds.size.height / 2
        let resultRect = CGRect(x: 10, y: (self.bounds.size.height/2) - (leftViewWidth/2), width: leftViewWidth, height: leftViewWidth)
        
        return resultRect
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
      return UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(0, (self.bounds.size.height / 2) + 15, 0, 0))
        
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(0, (self.bounds.size.height / 2) + 15, 0, 0))
        
    }
//    override func textRect(forBounds bounds: CGRect) -> CGRect {
//        return UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(0, (self.bounds.size.height / 2) + 15, 0, 0))
//
//    }
    
}
