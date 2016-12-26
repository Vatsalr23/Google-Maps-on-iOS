//
//  MapFunctions.swift
//  Google_Maps_iOS
//
//  Created by Vatsal Rustagi on 12/25/16.
//  Copyright © 2016 Vatsal Rustagi. All rights reserved.
//

import Foundation
import GoogleMaps

class MapFunctions: NSObject
{
    let baseURLDirections = "https://maps.googleapis.com/maps/api/directions/json?"
    
    var selectedRoute: Dictionary<NSObject, AnyObject>!
    
    var overviewPolyline: Dictionary<NSObject, AnyObject>!
    
    var originCoordinate: CLLocationCoordinate2D!
    
    var destinationCoordinate: CLLocationCoordinate2D!
    
    var originAddress: String!
    
    var destinationAddress: String!
    
    func getDirections(origin: String!, destination: String!, waypoints: Array<String>!, travelMode: AnyObject!, completionHandler: ((_ status: String, _ success: Bool) -> Void)) {
        if let originLocation = origin {
            if let destinationLocation = destination {
                var directionsURLString = baseURLDirections + "origin=" + originLocation + "&destination=" + destinationLocation
                directionsURLString = directionsURLString.addingPercentEncoding(withAllowedCharacters:String.Encoding.utf8)!
                let directionsURL = NSURL(string: directionsURLString)
            }
            else {
                completionHandler("Destination is nil.", false)
            }
        }
        else {
            completionHandler("Origin is nil", false)
        }
    }
    
}
