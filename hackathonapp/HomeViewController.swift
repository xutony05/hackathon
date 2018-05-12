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

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func handleLogout(_ target: UIBarButtonItem) {
            try! Auth.auth().signOut()
            
        
    }
}
