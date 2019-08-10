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

class CustomGeofence: CLCircularRegion {
    var appSyncClient: AWSAppSyncClient?
    var locationManager: CLLocationManager = CLLocationManager()

    func setupGeofence(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appSyncClient = appDelegate.appSyncClient
        
        appSyncClient?.fetch(query: ListLocationsQuery(), cachePolicy: .returnCacheDataAndFetch) {(result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            result?.data?.listLocations?.items!.forEach {
                let name = $0?.name
                let lat = $0?.lat
                let long = $0?.long
                print("Name:\(name!) Latitude:\(lat!) Longitude:\(long!)")
                
                let coordinates = CLLocation(latitude: lat!, longitude: long!)
//                print(coordinates)
                let userLocation = self.locationManager.location
//                print(userLocation)
                let distance = userLocation?.distance(from: coordinates)
                print("\(distance!) meters from \(name!)")
                if distance! <= 500.00 {
                    print("You are within 500 meters of \(name!)")
                }
            }
        }
    }
    
    //    func runMutation(){
    //        let mutationInput = CreateLocationInput(id: "2", name: "fuck you", long: 23.9595, lat: -98.73474, modelName: "iHeart.dae", imageName: "iHeart.png")
    //        appSyncClient?.perform(mutation: CreateLocationMutation(input: mutationInput)) { (result, error) in
    //            if let error = error as? AWSAppSyncClientError {
    //                print("Error occurred: \(error.localizedDescription )")
    //            }
    //            if let resultError = result?.errors {
    //                print("Error saving the item on server: \(resultError)")
    //                return
    //            }
    //            self.runQuery()
    //        }
    //    }
    
    func runQuery(){
        appSyncClient?.fetch(query: ListLocationsQuery(), cachePolicy: .returnCacheDataAndFetch) {(result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            result?.data?.listLocations?.items!.forEach {
                let name = $0?.name
                let lat = $0?.lat
                let long = $0?.long
                print("Name:\(name!) Latitude:\(lat!) Longitude:\(long!)")
                
            }
        }
    }
}
