//
//  DrawerMenu.swift
//  Netflix
//
//  Created by FabVinco on 4/24/17.
//  Copyright © 2017 FabVinco. All rights reserved.
//

import UIKit
import KYDrawerController
import Font_Awesome_Swift

class DrawerMenu: UIViewController {
    
    //MARK: VARIABLES
    var arrayMenu: [[String:Any]]!
    var idSelected: Int!
    
    //MARK: OUTLETS
    @IBOutlet weak var tvMenu: UITableView!
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var lblSyncUp: UILabel!
    @IBOutlet weak var vwUser: UIView!
    
    //MARK: VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        configInit()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: FUNCTIONS
    func configInit() {
        idSelected = 2
        lblUser.text = "Sergio Fabian"
        lblSyncUp.setFAIcon(icon: FAType.FAExchange, iconSize: 20)
        arrayMenu = []
        if let path = Bundle.main.path(forResource: "menu", ofType: "plist") {
            arrayMenu = NSArray(contentsOfFile: path) as! [[String:Any]]
        }
        tvMenu.separatorStyle = .none
        tvMenu.register(UINib(nibName: "userViewCell", bundle: nil), forCellReuseIdentifier: "userViewCell")
        tvMenu.register(UINib(nibName: "menuHeaderViewCell", bundle: nil), forCellReuseIdentifier: "menuHeaderViewCell")
        tvMenu.register(UINib(nibName: "menuHeaderViewCell", bundle: nil), forCellReuseIdentifier: "menuHeaderViewCell")
        tvMenu.register(UINib(nibName: "menuViewCell", bundle: nil), forCellReuseIdentifier: "menuViewCell")
        tvMenu.dataSource = self
        tvMenu.delegate = self
        
        let borderLayer = CALayer()
        borderLayer.frame = CGRect(x: 0, y: vwUser.frame.height - 1 , width: UIScreen.main.bounds.width, height: 1)
        borderLayer.backgroundColor = UIColor.black.cgColor
        vwUser.layer.addSublayer(borderLayer)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARCK: EXTENSIONS
extension DrawerMenu: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let view = self.arrayMenu[indexPath.row]["view"] as? String {
            switch(view) {
                case "menuHeaderViewCell":
                    let icon = getIconByText(name: self.arrayMenu[indexPath.row]["icon"] as? String)
                    let cell:MenuHeaderViewCell = tableView.dequeueReusableCell(withIdentifier: view)! as! MenuHeaderViewCell
                        cell.setAttributes(name: self.arrayMenu[indexPath.row]["name"] as? String, icon: icon)
                    return cell
                case "menuViewCell":
                    let cell = tableView.dequeueReusableCell(withIdentifier: view)! as! MenuViewCell
                    var printCell:Bool = false
                    if self.idSelected == indexPath.row{
                        printCell = true
                    }
                    cell.selectionStyle = .none
                    cell.setAttributes(name: self.arrayMenu[indexPath.row]["name"] as? String, isActive: printCell)
                    return cell
                case "userViewCell":
                    let cell = tableView.dequeueReusableCell(withIdentifier: view)! as! UserViewCell
                    cell.setAttributes(name: self.arrayMenu[indexPath.row]["name"] as? String)
                    return cell
                default:
                    let cell = UITableViewCell()
                    cell.textLabel?.text = self.arrayMenu[indexPath.row]["name"] as? String
                    return cell
            }
        }
        let cell = UITableViewCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height:CGFloat = 50
        if let view = self.arrayMenu[indexPath.row]["view"] as? String {
            switch(view) {
            case "userViewCell":
                height = 70
                break
            default:
                break
            }
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row >= 2 {
            if (self.idSelected != indexPath.row) {
                let cell = tableView.cellForRow(at: indexPath) as! MenuViewCell
                cell.setAttributes(name: nil, isActive: true)
                if let cellPrevius = tableView.cellForRow(at: IndexPath(row: self.idSelected, section: 0)) as? MenuViewCell {
                    cellPrevius.setAttributes(name: nil, isActive: false)
                }
                self.idSelected = indexPath.row
                if let drawer = self.parent as? KYDrawerController {
                    drawer.setDrawerState(.closed, animated: true)
                }
            }
        }
    }
}
