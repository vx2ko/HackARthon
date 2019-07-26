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
        setupAnnotations()  

        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion.init(center: userLocation, latitudinalMeters: 500, longitudinalMeters: 500)
            mapView.setRegion(viewRegion, animated: false)
        }
        // Do any additional setup after loading the view.
    }
    
    //Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //Hide home bar
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
    }
    
    func setupAnnotations(){
        let iHeartAnnotation = MKPointAnnotation()
        let homeAnnotation = MKPointAnnotation()
        let whataburgerAnnotation = MKPointAnnotation()
        
        iHeartAnnotation.coordinate = CLLocationCoordinate2DMake(29.647667, -98.453903)
        homeAnnotation.coordinate = CLLocationCoordinate2DMake(29.529139, -98.404270)
        whataburgerAnnotation.coordinate = CLLocationCoordinate2DMake(29.636807, -98.454548)

        iHeartAnnotation.title = "iHeartMedia"
        homeAnnotation.title = "Home"
        whataburgerAnnotation.title = "Whataburger"
        
        mapView.addAnnotation(iHeartAnnotation)
        mapView.addAnnotation(homeAnnotation)
        mapView.addAnnotation(whataburgerAnnotation)

    }
    
}
