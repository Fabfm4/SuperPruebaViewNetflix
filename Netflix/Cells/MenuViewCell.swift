//
//  MenuViewCell.swift
//  Netflix
//
//  Created by FabVinco on 4/24/17.
//  Copyright © 2017 FabVinco. All rights reserved.
//

import UIKit

class MenuViewCell: UITableViewCell {
    
    //MARK: OUTLETS
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var vwIsActive: UIView!
    
    //MARK: VIEW LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        vwIsActive.backgroundColor = UIColor.clear
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //self.vwIsActive.backgroundColor = UIColor.red
        // Configure the view for the selected state
    }
    
    //MARK: FUNCTIONS
    func setAttributes(name: String?, isActive: Bool?){
        if let nam = name {
            lblName.text = nam
        }
        if let isActiv = isActive, isActiv{
            vwIsActive.backgroundColor = UIColor.red
        } else {
            vwIsActive.backgroundColor = UIColor.clear
        }
    }
}
