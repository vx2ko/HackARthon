//
//  MapViewController.swift
//  ARTest
//


import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var imageNew: UIImage = UIImage()
    var arVC = ARViewController()
    
    
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
        let iHeartAnnotatoin = CustomMapAnnotation()
        iHeartAnnotatoin.setupCustomAnnotation(lat: 29.647667,
                                               long: -98.453903,
                                               annotationImageURLString: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/iheartwingsTN.png",
                                               annotationName: "iHeart")
        let oliveGardenAnnotation = CustomMapAnnotation()
        oliveGardenAnnotation.setupCustomAnnotation(lat: 29.650716,
                                                    long: -98.451268,
                                                    annotationImageURLString: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/iheartlogoTN.png",
                                                    annotationName: "Olive Garden")
        let longhornAnnotation = CustomMapAnnotation()
        longhornAnnotation.setupCustomAnnotation(lat: 29.649638,
                                                 long: -98.451776,
                                                 annotationImageURLString: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/kj97TN.png",
                                                 annotationName: "Longhorn")
        let greatClipsAnnotation = CustomMapAnnotation()
        greatClipsAnnotation.setupCustomAnnotation(lat: 29.651393,
                                                   long: -98.444868,
                                                   annotationImageURLString: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/iheartlogoTN.png",
                                                   annotationName: "Great Clips")
        let targetAnnotation = CustomMapAnnotation()
        targetAnnotation.setupCustomAnnotation(lat: 29.653628,
                                               long: -98.445020,
                                               annotationImageURLString: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/961nowTN.png",
                                               annotationName: "Target")
        let kayJewelersAnnotation = CustomMapAnnotation()
        kayJewelersAnnotation.setupCustomAnnotation(lat: 29.655075,
                                                    long: -98.446331,
                                                    annotationImageURLString: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/countrypickTN.png",
                                                    annotationName: "Kay Jewelers")
        let hebAnnotation = CustomMapAnnotation()
        hebAnnotation.setupCustomAnnotation(lat: 29.641039,
                                            long: -98.457656,
                                            annotationImageURLString: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/spurTN.png",
                                            annotationName: "HEB")
        let gncAnnotation = CustomMapAnnotation()
        gncAnnotation.setupCustomAnnotation(lat: 29.642041,
                                            long: -98.456456,
                                            annotationImageURLString: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/iheartlogoTN.png",
                                            annotationName: "GNC")
        let homeAnnotatioin = CustomMapAnnotation()
        homeAnnotatioin.setupCustomAnnotation(lat: 29.529308,
                                            long: -98.404263,
                                            annotationImageURLString: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/iheartlogoTN.png",
                                            annotationName: "Home")
        
        mapView.addAnnotation(homeAnnotatioin)
        mapView.addAnnotation(iHeartAnnotatoin)
        mapView.addAnnotation(oliveGardenAnnotation)
        mapView.addAnnotation(longhornAnnotation)
        mapView.addAnnotation(greatClipsAnnotation)
        mapView.addAnnotation(targetAnnotation)
        mapView.addAnnotation(kayJewelersAnnotation)
        mapView.addAnnotation(hebAnnotation)
        mapView.addAnnotation(gncAnnotation)

    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is CustomMapAnnotation) {
            return nil
        }
        
        let annotationIdentifier = annotation.title as! String
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView!.canShowCallout = true
        }
        else {
            annotationView!.annotation = annotation
        }
        let pinImage = annotation as! CustomMapAnnotation
        annotationView!.image = pinImage.image
        //print(pinImage.image)
        //annotationView!.image = UIImage(named: pinImage.imageName)
        
        return annotationView
    }
    
}
