//
//  TwoTypeTableCell.swift
//  Netflix
//
//  Created by FabVinco on 4/20/17.
//  Copyright © 2017 FabVinco. All rights reserved.
//

import UIKit

class TwoTypeTableCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        collectionView.register(UINib(nibName: "cellCollection", bundle: nil), forCellWithReuseIdentifier: "collection")
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

