//
//  MainVC.swift
//  Netflix
//
//  Created by FabVinco on 5/3/17.
//  Copyright © 2017 FabVinco. All rights reserved.
//

import UIKit
import KYDrawerController
import Font_Awesome_Swift

class MainVC: UIViewController {
    
    //MARK: VARIABLES
    let listColumn = ["OneType", "TwoType", "TwoType", "TwoType", "TwoType", "FiveType", "TwoType", "TwoType", "FourType", "ThreeType", "TwoType", "TwoType", "TwoType", "TwoType", "TwoType", "TwoType", "TwoType", "TwoType", "TwoType"]
    
    //MARK: OUTLETS
    @IBOutlet weak var tvMain: UITableView!
    @IBOutlet weak var btnNav: UIButton!
    
    //MARK: VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        btnNav.setFAIcon(icon: FAType.FANavicon, iconSize: 25, forState: .normal)
        tvMain.register(UINib(nibName: "CellOneType", bundle: nil), forCellReuseIdentifier: "OneType")
        tvMain.register(UINib(nibName: "CellTwoType", bundle: nil), forCellReuseIdentifier: "TwoType")
        tvMain.register(UINib(nibName: "CellThreeType", bundle: nil), forCellReuseIdentifier: "ThreeType")
        tvMain.register(UINib(nibName: "CellFourType", bundle: nil), forCellReuseIdentifier: "FourType")
        tvMain.register(UINib(nibName: "CellFiveType", bundle: nil), forCellReuseIdentifier: "FiveType")
        tvMain.dataSource = self
        tvMain.delegate = self
        tvMain.separatorStyle = .none
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: ACTIONS
    @IBAction func showDrawer(_ sender: Any) {
        if let navigator = self.navigationController, let drawer = navigator.parent as? KYDrawerController {
            drawer.setDrawerState(.opened, animated: true)
        }
    }
    
    
}

extension MainVC:UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listColumn.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(self.listColumn[indexPath.section]) {
        case "TwoType":
            let cell = tableView.dequeueReusableCell(withIdentifier: self.listColumn[indexPath.section]) as! TwoTypeTableCell
            cell.cvMovies.delegate = self
            cell.cvMovies.dataSource = self
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: self.listColumn[indexPath.section])!
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(listColumn[indexPath.section]) {
        case "OneType":
            return 150
        case "TwoType":
            return 185
        case "ThreeType":
            return 300
        case "FourType":
            return 50
        case "FiveType":
            return 180
        default:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
}


extension MainVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as! CollectionViewCell
        cell.awakeFromNib()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width/3, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "openModal", sender: nil)
    }
    
}
