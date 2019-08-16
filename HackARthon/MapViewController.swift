//
//  MapViewController.swift
//  ARTest
//


import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    var imageNew: UIImage = UIImage()
    var arVC = ARViewController()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        mapView.showsUserLocation = true
        setupAnnotations()  

        
        if let userLocation = LocationService.shared.manager.location?.coordinate {
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
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
    }
    
    func setupAnnotations(){
        DataService.shared.appSyncClient?.fetch(query: ListLocationsQuery(), cachePolicy: .fetchIgnoringCacheData) {(result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            
            result?.data?.listLocations?.items!.forEach {
                let name = $0?.name
                let mapImageURLString = $0?.mapImageName
                let long = $0?.long
                let lat = $0?.lat
                
                let customAnnotation = CustomMapAnnotation()
                customAnnotation.setupCustomAnnotation(lat: lat!, long: long!, annotationImageURLString: mapImageURLString!, annotationName: name!)
                self.mapView.addAnnotation(customAnnotation)
                
            }
        }
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
        
        return annotationView
    }
    
}
