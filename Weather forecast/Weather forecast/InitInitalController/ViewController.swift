//
//  ViewController.swift
//  Weather forecast
//
//  Created by 醒着像睡着 on 11/19/22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    let cities = ["Current Location", "Seattle", "LA", "LV", "Beijing", "Shanghai"]
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        
         
    }


    @IBOutlet weak var tblView: UITableView!
    
    
    
    
    
    
    
    @IBAction func getLocation(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    
}

