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

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var ref: DatabaseReference?
    var databaseHandle:DatabaseHandle?
    
    
    var locationName = [String]()
    //let locationName = ["Canada's Wonderland", "Theme Park", "Rollercoasters", "test"]
    let locationImage = [UIImage(named: "Wonderland")]//UIImage(named: "bahamas")]//,UIImage(named: "maxresdefault"),UIImage(named: "Wonderland")]
    
    let locationDescription = ["Best theme park in North America!"]//, "An exhilirating watery retreat"]//, "An amazing exploration event in Hawaii", "testing description"]
    var flag=false
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        var Event = ""

        
        databaseHandle = ref?.observe(.childAdded, with: { (snapshot) in
            let post = snapshot.value as? [String : AnyObject] ?? [:]
            var name = post.description.split(separator: "&")[3]
            var value = post.description.split(separator: "&")[1]
            if (name == "Recommendation" && value.split(separator: "|")[0] == emailLLL)
            {
                Event = String(value.split(separator: "|")[2])
                var XP = value.split(separator: "|")[3]
                var Desc = value.split(separator: "|")[4]
                self.locationName.append(String(Event))
                self.flag=true
//                self.locationName[0]=String(Event)
               
            }
            
        })
        if flag == true{
            flag=false
            locationName.append(String(Event))
        }
//        self.locationName.append(String("ass"))
//         self.locationName.append(String("ass2"))
        
    }
    
    
    @IBAction func handleLogout(_ target: UIBarButtonItem) {
        try! Auth.auth().signOut()
    }
   
    
   
    
    
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
