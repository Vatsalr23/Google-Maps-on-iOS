//
//  ViewController.swift
//  Google_Maps_iOS
//
//  Created by Vatsal Rustagi on 12/24/16.
//  Copyright © 2016 Vatsal Rustagi. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        
        mapView.delegate = self
        let loc = CLLocationCoordinate2D(latitude: 33.6405, longitude: -117.8443)
        mapView.camera = GMSCameraPosition.camera(withTarget: loc, zoom: 15)
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

