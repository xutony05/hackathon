//
//  CollectionViewCell.swift
//  hackathonapp
//
//  Created by Brendan Wu on 2018-05-12.
//  Copyright © 2018 Brendan Wu. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var locationImage: UIImageView!
    //@IBOutlet weak var locationName: UILabel!
    
    @IBOutlet weak var LocationName: UIButton!
    @IBAction func LocationNameButton(_ sender: UIButton) {
        passedDesc = locationDescription.text!
    }
    @IBOutlet weak var locationDescription: UILabel!
    @IBOutlet weak var locationJP: UILabel!
  
}
