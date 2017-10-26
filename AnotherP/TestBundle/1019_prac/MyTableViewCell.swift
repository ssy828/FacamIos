//
//  MyTableViewCell.swift
//  1019_prac
//
//  Created by ilhan won on 2017. 10. 19..
//  Copyright © 2017년 ilhan won. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet var stepper:UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
