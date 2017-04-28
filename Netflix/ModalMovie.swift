//
//  ModalMovie.swift
//  Netflix
//
//  Created by FabVinco on 4/26/17.
//  Copyright © 2017 FabVinco. All rights reserved.
//

import UIKit
import Font_Awesome_Swift
import MaterialDesignSymbol

class ModalMovie: UIViewController {
    
    @IBOutlet weak var vmResume: UIView!
    @IBOutlet weak var lblResume: UILabel!
    @IBOutlet weak var vmCast: UIView!
    @IBOutlet weak var vmDirector: UIView!
    @IBOutlet weak var vmActionMovie: UIView!
    @IBOutlet weak var vmSimilar: UIView!
    @IBOutlet weak var btnCloseModal: UIButton!
    @IBOutlet weak var scv: UIScrollView!
    @IBOutlet weak var cvMoviesSimilar: UICollectionView!
    @IBOutlet weak var vmDetails: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        vmResume.backgroundColor = UIColor.clear
        vmCast.backgroundColor = UIColor.clear
        vmDirector.backgroundColor = UIColor.clear
        vmSimilar.backgroundColor = UIColor.clear
        vmActionMovie.backgroundColor = UIColor.clear
        cvMoviesSimilar.backgroundColor = UIColor.clear
        vmDetails.backgroundColor = UIColor.clear
        btnCloseModal.titleLabel?.font = MaterialDesignFont.fontOfSize(20)
        btnCloseModal.layer.masksToBounds = true
        btnCloseModal.layer.cornerRadius = btnCloseModal.bounds.height/2
        btnCloseModal.setTitle(MaterialDesignIcon.clear48px, for: .normal)
        scv.delegate = self
        cvMoviesSimilar.register(UINib(nibName: "cellCollection", bundle: nil), forCellWithReuseIdentifier: "collection")
        scv.contentSize = CGSize(width: self.view.bounds.width, height: (cvMoviesSimilar.frame.origin.y + cvMoviesSimilar.bounds.height))
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 10 , bottom:10, right: 10)
//        layout.minimumInteritemSpacing = 10
//        layout.minimumLineSpacing = 100
//        cvMoviesSimilar!.collectionViewLayout = layout
        cvMoviesSimilar.dataSource = self
        cvMoviesSimilar.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    @IBAction func closeModal(_ sender: Any){
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromBottom
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidDisappear(true)
        scv.contentSize = CGSize(width: self.view.bounds.width, height: (vmSimilar.frame.origin.y + vmSimilar.bounds.height))
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

extension ModalMovie: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        if offsetY <= -120 {
            let transition: CATransition = CATransition()
            transition.duration = 0.3
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            transition.type = kCATransitionReveal
            transition.subtype = kCATransitionFromBottom
            self.view.window!.layer.add(transition, forKey: nil)
            self.dismiss(animated: true, completion: nil)
        }
        if offsetY > -36 {
            btnCloseModal.alpha = 1
        }
        if offsetY <= -36, offsetY >= -55 {
            let valueReal = (offsetY + 36) * 0.5
            print(offsetY)
            var valueAlpha = (10 - abs(valueReal.truncatingRemainder(dividingBy: 10))) * 0.1
            valueAlpha = valueAlpha == 1 ? 0 : valueAlpha
            valueAlpha = abs(offsetY) == 36 ? 1 : valueAlpha
            btnCloseModal.alpha = valueAlpha
        }
        if offsetY < -55 {
            btnCloseModal.alpha = 0
        }
    }
}

extension ModalMovie: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as! CollectionViewCell
        cell.awakeFromNib()
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        // Give cell width and height
        return CGSize(width: (collectionView.bounds.width - 20) / 3, height: (collectionView.bounds.height - 10) / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        // splace between two cell horizonatally
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        // give space top left bottom and right for cells
        return UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
