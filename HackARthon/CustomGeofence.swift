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

class CustomGeofence: NSObject {
    var modelURL: String!
    var imageURL: String!
    var lat = Double()
    var long = Double()
    var geofenceRegion = CLCircularRegion()
    
    func queryGeofenceData(){
        DataService.shared.appSyncClient?.fetch(query: ListLocationsQuery(), cachePolicy: .returnCacheDataElseFetch) {(result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            
            let userLocation = LocationService.shared.manager.location

            result?.data?.listLocations?.items!.forEach {
                let name = $0?.name
                let lat = $0?.lat
                let long = $0?.long

                print("Name:\(name!) Latitude:\(lat!) Longitude:\(long!)")
                
                let coordinates = CLLocation(latitude: lat!, longitude: long!)
                print(coordinates)
                let distance = userLocation?.distance(from: coordinates)
                print("\(distance!) meters from \(name!)")
                if distance! <= 1000.00 {
                    print("You are within 1000 meters of \(name!)")
                    self.setupGeofence(lat: lat!, long: long!, name: name!)
                }
            }
        }
    }
    
    func setupGeofence(lat: CLLocationDegrees, long: CLLocationDegrees, name: String){
        let geofenceCenter = CLLocationCoordinate2D(latitude: lat, longitude: long)
        geofenceRegion = CLCircularRegion(center: geofenceCenter, radius: 20, identifier: name)
        print(geofenceRegion.identifier)

        LocationService.shared.manager.startMonitoring(for: geofenceRegion)
        LocationService.shared.manager.startUpdatingLocation()
        LocationService.shared.manager.requestState(for: geofenceRegion)

    }
}
