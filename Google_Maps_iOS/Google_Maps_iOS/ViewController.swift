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

    @IBOutlet weak var streetAddressLabel: UILabel!
    @IBOutlet weak var mapView: GMSMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        mapView.delegate = self
        let loc = CLLocationCoordinate2D(latitude: 33.6405, longitude: -117.8443)
        mapView.camera = GMSCameraPosition.camera(withTarget: loc, zoom: 15)
        
        super.viewDidLoad()
    }
    
    func getAddress(atCoordinate coordinate: CLLocationCoordinate2D)
    {
        let geocoder = GMSGeocoder()
        
        geocoder.reverseGeocodeCoordinate(coordinate){ response, error in
            if let address = response?.firstResult(){
                self.mapView.padding = UIEdgeInsets(top: self.topLayoutGuide.length, left: 0,bottom: 45, right: 0)
                let lines = address.lines!
                self.streetAddressLabel.text = lines[0]
            }
        }
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        getAddress(atCoordinate: position.target)
        
        mapView.clear()
        
        let marker = GMSMarker(position: position.target)
        marker.map = mapView
        marker.title = "Current Location"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

