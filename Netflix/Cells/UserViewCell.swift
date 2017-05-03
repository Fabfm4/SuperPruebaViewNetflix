//
//  UserViewCell.swift
//  Netflix
//
//  Created by FabVinco on 4/24/17.
//  Copyright © 2017 FabVinco. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class UserViewCell: UITableViewCell {
    
    @IBOutlet weak var lblIcon: UILabel!
    @IBOutlet weak var lblName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        lblIcon.setFAIcon(icon: FAType.FAExchange , iconSize: 20)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated) 

        // Configure the view for the selected state
    }
    
    func setAttributes(name: String?){
        if let aName = name {
            lblName.text = aName
        }
    }

}
