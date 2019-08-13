//
//  CustomGeofence.swift
//  HackARthon
//
//  Created by Kiyano Oben on 8/10/19.
//  Copyright © 2019 Kiyano Oben. All rights reserved.
//

import Foundation
import CoreLocation
import AWSAppSync

class CustomGeofence: CLLocationManager, CLLocationManagerDelegate {
    var appSyncClient: AWSAppSyncClient?
    var modelURL: String!
    var imageURL: String!
    var name: String!
    
    func queryGeofenceData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appSyncClient = appDelegate.appSyncClient
        
        
        appSyncClient?.fetch(query: ListLocationsQuery(), cachePolicy: .returnCacheDataElseFetch) {(result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            result?.data?.listLocations?.items!.forEach {
                self.name = $0?.name
                let lat = $0?.lat
                let long = $0?.long
                self.imageURL = $0?.imageName
                self.modelURL = $0?.modelName
                //self.nameArray.append([self.name!, self.imageURL!])

                print("Name:\(self.name!) Latitude:\(lat!) Longitude:\(long!)")
                
                let coordinates = CLLocation(latitude: lat!, longitude: long!)
//                print(coordinates)
                let userLocation = ARViewController.shared.locationManager.location
//                print(userLocation)
                let distance = userLocation?.distance(from: coordinates)
                print("\(distance!) meters from \(self.name!)")
                if distance! <= 1000.00 {
                    print("You are within 1000 meters of \(self.name!)")
                    //self.closestCoordinates.append([lat!, long!])
                    //print(self.closestCoordinates)
                    self.setupGeofence(lat: lat!, long: long!, name: self.name!)
                }
            }
        }
    }
    
    func setupGeofence(lat: CLLocationDegrees, long: CLLocationDegrees, name: String){
        let geofenceCenter = CLLocationCoordinate2D(latitude: lat, longitude: long)
        let geofenceRegion = CLCircularRegion(center: geofenceCenter, radius: 20, identifier: name)
        print(geofenceRegion.identifier)
        ARViewController.shared.locationManager.startMonitoring(for: geofenceRegion)
        ARViewController.shared.locationManager.startUpdatingLocation()
        ARViewController.shared.locationManager.requestState(for: geofenceRegion)
        
    }
}
