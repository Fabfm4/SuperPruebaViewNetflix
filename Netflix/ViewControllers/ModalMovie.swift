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
    
    //MARK: OUTLETS
    @IBOutlet weak var lblResume: UILabel!
    @IBOutlet weak var vwSimilar: UIView!
    @IBOutlet weak var btnCloseModal: UIButton!
    @IBOutlet weak var svwMain: UIScrollView!
    @IBOutlet weak var cvMoviesSimilar: UICollectionView!
    
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
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidDisappear(true)
        svwMain.contentSize = CGSize(width: self.view.bounds.width, height: (vwSimilar.frame.origin.y + vwSimilar.bounds.height))
    }
    
    //MARK: ACTIONS
    @IBAction func closeModal(_ sender: Any){
        closeModal()
    }

    //MARK: FUNCTIONS
    func configInit() {
        btnCloseModal.titleLabel?.font = MaterialDesignFont.fontOfSize(20)
        btnCloseModal.layer.masksToBounds = true
        btnCloseModal.layer.cornerRadius = btnCloseModal.bounds.height/2
        btnCloseModal.setTitle(MaterialDesignIcon.clear48px, for: .normal)
        svwMain.delegate = self
        cvMoviesSimilar.register(UINib(nibName: "cellCollection", bundle: nil), forCellWithReuseIdentifier: "collection")
        svwMain.contentSize = CGSize(width: self.view.bounds.width, height: (cvMoviesSimilar.frame.origin.y + cvMoviesSimilar.bounds.height))
        cvMoviesSimilar.dataSource = self
        cvMoviesSimilar.delegate = self
    }
    
    func closeModal() {
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromBottom
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
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
extension ModalMovie: UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        switch(offsetY){
        case -500 ... -120:
            closeModal()
            break;
        case -55 ... -36:
            let valueReal = (offsetY + 36) * 0.5
            var valueAlpha = (10 - abs(valueReal.truncatingRemainder(dividingBy: 10))) * 0.1
            valueAlpha = valueAlpha == 1 ? 0 : valueAlpha
            valueAlpha = abs(offsetY) == 36 ? 1 : valueAlpha
            btnCloseModal.alpha = valueAlpha
            break;
        case -120 ... -56:
            btnCloseModal.alpha = 0
            break;
        case -35 ... 0:
            btnCloseModal.alpha = 1
            break;
        default:
            break;
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
