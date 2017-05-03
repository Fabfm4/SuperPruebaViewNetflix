//
//  MenuHeaderViewCell.swift
//  Netflix
//
//  Created by FabVinco on 4/24/17.
//  Copyright © 2017 FabVinco. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class MenuHeaderViewCell: UITableViewCell {
    
    //MARK: OUTLETS
    @IBOutlet weak var lblIcon: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblArrow: UILabel!
    
    //MARK: VIEW LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        let borderLayer = CALayer()
        let lineHeight:CGFloat = 1
        borderLayer.frame = CGRect(x: 0, y: self.frame.height - lineHeight , width: UIScreen.main.bounds.width, height: lineHeight)
        borderLayer.backgroundColor = UIColor.black.cgColor
        self.layer.addSublayer(borderLayer)
        lblArrow.setFAIcon(icon: FAType.FAChevronRight, iconSize: 20)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: FUNCTIONS
    func setAttributes(name: String?, icon: FAType?){
        if let nam = name {
            lblName.text = nam
        }
        if let ico = icon {
            lblIcon.setFAIcon(icon: ico, iconSize: 20)
        }
    }
}
