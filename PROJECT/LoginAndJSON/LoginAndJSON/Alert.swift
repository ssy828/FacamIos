//
//  Alert.swift
//  LoginAndJSON

import  UIKit

// 알람
struct Alert
{
    static func showAlert(title: String,
                          msg: String,
                          actionStyle: UIAlertActionStyle = UIAlertActionStyle.default,
                          cancelAction: Bool,
                          completion: ((UIAlertAction)->Void)?) -> UIAlertController
    {
        let alert = UIAlertController(title: title,
                                      message: msg,
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인",
                                     style: actionStyle,
                                     handler: completion)
        alert.addAction(okAction)
        if cancelAction
        {
            let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.destructive, handler: completion)
            alert.addAction(cancelAction)
        }
    
        return alert
    }
}
