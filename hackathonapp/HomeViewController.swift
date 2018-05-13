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
import FirebaseDatabase
var passedDesc=""
//var postSt = [String : AnyObject]()
var locationName = [String]()
var locationXPs = [String]()
//let locationName = ["Canada's Wonderland", "Theme Park", "Rollercoasters", "test"]
var locationImage = [String]()
//,UIImage(named: "maxresdefault"),UIImage(named: "Wonderland")]

var locationDescription = [String]() //["Best theme park in North America!"]//, "An exhilirating watery retreat"]//, "An amazing exploration event in Hawaii", "testing description"]

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var ref: DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
   

    override func viewDidLoad() {
            super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
//    @IBAction func handleLogout(_ target: UIBarButtonItem) {
//       // locationName.removeAll()
//       // locationXPs.removeAll()
//       // locationDescription.removeAll()
////        locationImage.removeAll()
//        try! Auth.auth().signOut()
//    }
 
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.LocationName.setTitle(locationName[indexPath.row], for: .normal)
        let url = URL(string: locationImage[indexPath.row])
        let data = try? Data(contentsOf: url!)
         cell.locationImage.image =  UIImage(data: data!)

      //  cell.locationImage.image = locationImage[indexPath.row]
        cell.locationDescription.text = locationDescription[indexPath.row]
        cell.locationJP.text = locationXPs[indexPath.row]
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
