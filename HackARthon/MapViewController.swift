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
        let oliveGardenAnnotation = CustomAnnotation()
        let longhornAnnotation = CustomAnnotation()
        let greatClipsAnnotation = CustomAnnotation()
        let targetAnnotation = CustomAnnotation()
        let kayJewelersAnnotation = CustomAnnotation()
        let hebAnnotation = CustomAnnotation()
        let gncAnnotation = CustomAnnotation()
        
        iHeartAnnotation.coordinate = CLLocationCoordinate2DMake(29.647667, -98.453903)
        oliveGardenAnnotation.coordinate = CLLocationCoordinate2DMake(29.650716, -98.451268)
        longhornAnnotation.coordinate = CLLocationCoordinate2DMake(29.649638, -98.451776)
        greatClipsAnnotation.coordinate = CLLocationCoordinate2DMake(29.651393, -98.444868)
        targetAnnotation.coordinate = CLLocationCoordinate2DMake(29.653628, -98.445020)
        kayJewelersAnnotation.coordinate = CLLocationCoordinate2DMake(29.655075, -98.446331)
        hebAnnotation.coordinate = CLLocationCoordinate2DMake(29.641039, -98.457656)
        gncAnnotation.coordinate = CLLocationCoordinate2DMake(29.642041, -98.456456)

        let iHeartURL = URL(string: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/iheartwingsTN.png")
        let iHeartData = try? Data(contentsOf: iHeartURL!)
        
        let iHeartImageData = iHeartData
        let iHeartAnnotationImage = UIImage(data: iHeartImageData!)
        
        let oliveGardenURL = URL(string: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/iheartlogoTN.png")
        let oliveGardenData = try? Data(contentsOf: oliveGardenURL!)
        
        let oliveGardenImageData = oliveGardenData
        let oliveGardenAnnotationImage = UIImage(data: oliveGardenImageData!)
        
        let longhornURL = URL(string: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/kj97TN.png")
        let longhornData = try? Data(contentsOf: longhornURL!)
        
        let longhornImageData = longhornData
        let longhornAnnotationImage = UIImage(data: longhornImageData!)
        
        let greatClipsURL = URL(string: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/iheartlogoTN.png")
        let greatClipsData = try? Data(contentsOf: greatClipsURL!)
        
        let greatClipsImageData = greatClipsData
        let greatClipsAnnotationImage = UIImage(data: greatClipsImageData!)
        
        let targetURL = URL(string: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/961nowTN.png")
        let targetData = try? Data(contentsOf: targetURL!)
        
        let targetImageData = targetData
        let targetAnnotationImage = UIImage(data: targetImageData!)
        
        let kayJewelersURL = URL(string: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/countrypickTN.png")
        let kayJewelersData = try? Data(contentsOf: kayJewelersURL!)
        
        let kayJewelersImageData = kayJewelersData
        let kayJewelersAnnotationImage = UIImage(data: kayJewelersImageData!)
        
        let hebURL = URL(string: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/spurTN.png")
        let hebData = try? Data(contentsOf: hebURL!)
        
        let hebImageData = hebData
        let hebAnnotationImage = UIImage(data: hebImageData!)
        
        let gncURL = URL(string: "https://craig-deployments-mobilehub-1839328609.s3.us-east-2.amazonaws.com/Images/MapImages/iheartlogoTN.png")
        let gncData = try? Data(contentsOf: gncURL!)
        
        let gncImageData = gncData
        let gncAnnotationImage = UIImage(data: gncImageData!)
        
        iHeartAnnotation.title = "iHeartMedia"
        iHeartAnnotation.image = iHeartAnnotationImage
        oliveGardenAnnotation.title = "Olive Garden"
        oliveGardenAnnotation.image = oliveGardenAnnotationImage
        //homeAnnotation.imageName = "art.scnassets/iheartwingsTN.png"
        longhornAnnotation.title = "Longhorn"
        longhornAnnotation.image = longhornAnnotationImage
        greatClipsAnnotation.title = "Great Clips"
        greatClipsAnnotation.image = greatClipsAnnotationImage
        targetAnnotation.title = "Target"
        targetAnnotation.image = targetAnnotationImage
        kayJewelersAnnotation.title = "Kay Jewelers"
        kayJewelersAnnotation.image = kayJewelersAnnotationImage
        hebAnnotation.title = "HEB"
        hebAnnotation.image = hebAnnotationImage
        gncAnnotation.title = "GNC"
        gncAnnotation.image = gncAnnotationImage
        
        mapView.addAnnotation(iHeartAnnotation)
        mapView.addAnnotation(oliveGardenAnnotation)
        mapView.addAnnotation(longhornAnnotation)
        mapView.addAnnotation(greatClipsAnnotation)
        mapView.addAnnotation(targetAnnotation)
        mapView.addAnnotation(kayJewelersAnnotation)
        mapView.addAnnotation(hebAnnotation)
        mapView.addAnnotation(gncAnnotation)


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
        //print(pinImage.image)
        //annotationView!.image = UIImage(named: pinImage.imageName)
        
        return annotationView
    }
    
}
