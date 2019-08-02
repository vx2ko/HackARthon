//
//  MapViewController.swift
//  ARTest
//


import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var imageNew: UIImage = UIImage()
    
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
        let iHeartAnnotation = CustomAnnotation()
        let homeAnnotation = CustomAnnotation()
        let whataburgerAnnotation = CustomAnnotation()
        
        iHeartAnnotation.coordinate = CLLocationCoordinate2DMake(29.647667, -98.453903)
        homeAnnotation.coordinate = CLLocationCoordinate2DMake(29.529139, -98.404270)
        whataburgerAnnotation.coordinate = CLLocationCoordinate2DMake(29.636807, -98.454548)

        let iHeartURL = URL(string: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/iheartwingsTN.png")
        let iHeartData = try? Data(contentsOf: iHeartURL!)
        
        let iHeartImageData = iHeartData
        let iHeartAnnotationImage = UIImage(data: iHeartImageData!)
        
        iHeartAnnotation.title = "iHeartMedia"
        //iHeartAnnotation.imageName = "art.scnassets/iheartwingsTN.png"
        iHeartAnnotation.image = iHeartAnnotationImage
        homeAnnotation.title = "Home"
        //homeAnnotation.imageName = "art.scnassets/iheartwingsTN.png"
        whataburgerAnnotation.title = "Whataburger"
        //whataburgerAnnotation.imageName = "art.scnassets/wbTN.png"
        
        
        mapView.addAnnotation(iHeartAnnotation)
        mapView.addAnnotation(homeAnnotation)
        mapView.addAnnotation(whataburgerAnnotation)

    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if !(annotation is CustomAnnotation) {
            return nil
        }
        
        let annotationIdentifier = "iheartAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView!.canShowCallout = true
        }
        else {
            annotationView!.annotation = annotation
        }
        let pinImage = annotation as! CustomAnnotation
        annotationView!.image = pinImage.image
        print(pinImage.image)
        //annotationView!.image = UIImage(named: pinImage.imageName)
        
        return annotationView
    }
    
}
