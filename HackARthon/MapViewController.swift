//
//  MapViewController.swift
//  ARTest
//
//  Created by Kiyano Oben on 7/24/19.
//  Copyright © 2019 Kiyano Oben. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        
        let iHeartAnnotation = MKPointAnnotation()
        iHeartAnnotation.coordinate = CLLocationCoordinate2DMake(29.647667, -98.453903)
        iHeartAnnotation.title = "iHeartMedia"
        mapView.addAnnotation(iHeartAnnotation)

        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion.init(center: userLocation, latitudinalMeters: 500, longitudinalMeters: 500)
            mapView.setRegion(viewRegion, animated: false)
        }
    }

}
