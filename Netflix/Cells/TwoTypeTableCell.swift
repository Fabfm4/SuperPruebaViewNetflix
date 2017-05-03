//
//  TwoTypeTableCell.swift
//  Netflix
//
//  Created by FabVinco on 4/20/17.
//  Copyright © 2017 FabVinco. All rights reserved.
//

import UIKit

class TwoTypeTableCell: UITableViewCell {
    
    //MARK: OUTLETS
    @IBOutlet weak var cvMovies: UICollectionView!
    
    //MARK: VIEW LIFECYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        if let layout = cvMovies.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        cvMovies.register(UINib(nibName: "cellCollection", bundle: nil), forCellWithReuseIdentifier: "collection")
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

