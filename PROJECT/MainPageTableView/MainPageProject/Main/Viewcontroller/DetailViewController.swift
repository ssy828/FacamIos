//
//  DetailViewController.swift
//  MainPageProject
//
//  Created by youngmin joo on 2017. 10. 20..
//  Copyright © 2017년 WingsCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var descriptionLb: UITextView!
    @IBOutlet weak var phoneNumLb: UILabel!
    @IBOutlet weak var emailLb: UILabel!
    
    var data:ProfileModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "디테일 내용"
        
        if let real = data{
            //UISet
            nameLb.text = real.nickname
            descriptionLb.text = real.myProfileDesc
            phoneNumLb.text = real.phoneNumber
            emailLb.text = real.email
            
            profileImageView.image = UIImage(named:real.profileImageName)
            bgImageView.image = UIImage(named:real.bgImageName)

        }
        // 디자인?
        profileImageView.layer.cornerRadius = profileImageView.bounds.size.width/2
        profileImageView.layer.borderColor = UIColor.black.cgColor
        profileImageView.layer.borderWidth = 1
        profileImageView.clipsToBounds = true
    }
}
