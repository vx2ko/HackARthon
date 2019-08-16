//
//  CustomLocationService.swift
//  HackARthon
//
//  Created by Kiyano Oben on 8/12/19.
//  Copyright © 2019 Kiyano Oben. All rights reserved.
//

import Foundation
import CoreLocation
import AWSAppSync
import ARKit


class LocationService: NSObject, CLLocationManagerDelegate {
    // Swifty way of creating a singleton
    static let shared = LocationService()
    
    // set the manager object right when it gets initialized
    
    var manager: CLLocationManager = CLLocationManager()

    
    private override init() {
        super.init()
        // delegate MUST be set while initialization
        //manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        manager.distanceFilter = 5
    }
    
    // MARK: Control Mechanisms
    func startUpdatingLocation() {
        manager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        manager.stopUpdatingLocation()
    }
    
    func startUpdatingHeading() {
        manager.startUpdatingHeading()
    }
    
    func stopUpdatingHeading() {
        manager.stopUpdatingHeading()
    }
    
    func getDistance(location: CLLocation){
        manager.location?.distance(from: location)
    }
    
    // MARK: Location Updates
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation])
    {
        // If location data can be determined
        if let location = locations.last {
            //currentLocation = location.coordinate
        }
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error)
    {
        print("Location Manager Error: \(error)")
    }
    
    // MARK: Heading Updates
    func locationManager(_ manager: CLLocationManager,
                         didUpdateHeading newHeading: CLHeading)
    {
        //currentHeading = newHeading
    }
    
    func locationManagerShouldDisplayHeadingCalibration(_ manager: CLLocationManager) -> Bool {
        return true
    }
}
