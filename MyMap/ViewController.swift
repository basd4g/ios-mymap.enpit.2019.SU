//
//  ViewController.swift
//  MyMap
//
//  Created by 中山慶祐 on 2019/09/04.
//  Copyright © 2019 Keisuke Nakayama. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    let manager = CLLocationManager()
    @IBOutlet weak var mapVIew: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            manager.requestWhenInUseAuthorization()
        }
    }
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            manager.requestLocation()
        }
        label.text = "autorizedInUse"

    }
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        print("locations : \(locations)")
        let current = locations[0]
        let region = MKCoordinateRegion.init(center: current.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        mapVIew.setRegion(region, animated: true)
        label.text = "didUpdateLocations"

    }
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error:Error) {
        print("error = \(error)")
        label.text = "didFailWithError"
    }


}

