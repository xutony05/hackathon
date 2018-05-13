//
//  ProfileViewController.swift
//  hackathonapp
//
//  Created by Brendan Wu on 2018-05-12.
//  Copyright © 2018 Brendan Wu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
var userJPs = 0
class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        amountJPs.text = String(String(userJPs) + " JPs")
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var amountJPs: UILabel!
    @IBAction func backbutton(_ sender: Any) {
        locationName.removeAll()
        locationXPs.removeAll()
        locationDescription.removeAll()
        try! Auth.auth().signOut()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
