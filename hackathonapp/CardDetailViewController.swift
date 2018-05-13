//
//  CardDetailViewController.swift
//  hackathonapp
//
//  Created by Brendan Wu on 2018-05-13.
//  Copyright © 2018 Brendan Wu. All rights reserved.
//

import UIKit
import MapKit
class CardDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: UIColor(red: 210/255, green: 109/255, blue: 180/255, alpha: 0.3), bottomColor: UIColor(red: 52/255, green: 148/255, blue: 230/255, alpha: 0.3))
       centerMapOnLocation(location: initialLocation)
        // Do any additional setup after loading the view.
        Description.text = passedDesc
    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var mapView: MKMapView!
    let initialLocation = CLLocation(latitude: 43.64, longitude: -79.38)
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    @IBOutlet weak var Description: UILabel!
    
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
