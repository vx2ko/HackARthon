//
//  CustomLocationService.swift
//  HackARthon
//
//  Created by Kiyano Oben on 8/12/19.
//  Copyright © 2019 Kiyano Oben. All rights reserved.
//

import Foundation
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
    // Swifty way of creating a singleton
    static let shared = LocationService()
    
    // set the manager object right when it gets initialized
    public let manager: CLLocationManager = {
        $0.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        $0.distanceFilter = 5
        $0.requestWhenInUseAuthorization()
        
        return $0
    }(CLLocationManager())
    
    private(set) var currentLocation: CLLocationCoordinate2D!
    private(set) var currentHeading: CLHeading!
    
    private override init() {
        super.init()
        
        // delegate MUST be set while initialization
        manager.delegate = self
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
    
    func getCurrentLocation(){
        manager.location
    }
    
    // MARK: Location Updates
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation])
    {
        // If location data can be determined
        if let location = locations.last {
            currentLocation = location.coordinate
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
        currentHeading = newHeading
    }
    
    func locationManagerShouldDisplayHeadingCalibration(_ manager: CLLocationManager) -> Bool {
        return true
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.authorizedAlways) {
            //setUpGeofence()
            //customGeofence.queryGeofenceData()
            
        }

    }
}
