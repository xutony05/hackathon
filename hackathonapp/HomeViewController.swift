//
//  HomeViewController.swift
//  hackathonapp
//
//  Created by Brendan Wu on 2018-05-12.
//  Copyright © 2018 Brendan Wu. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func handleLogout(_ target: UIBarButtonItem) {
        try! Auth.auth().signOut()
    }
    let locationName = ["Canada's Wonderland", "Theme Park", "Rollercoasters"]
    let locationImage = [UIImage(named: "wonderland"),UIImage(named: "bahamas"),UIImage(named: "maxresdefault")]
    
    let locationDescription = ["Best theme park in North America!", "An exhilirating watery retreat", "An amazing exploration event in Hawaii"]
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.locationName.text = locationName[indexPath.row]
        cell.locationImage.image = locationImage[indexPath.row]
        cell.locationDescription.text = locationDescription[indexPath.row]
        //
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    
}
