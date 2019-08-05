//
//  CustomMapAnnotation.swift
//  HackARthon
//
//  Created by Kiyano Oben on 8/4/19.
//  Copyright © 2019 Kiyano Oben. All rights reserved.
//

import Foundation
import MapKit

class CustomMapAnnotation: MKPointAnnotation {
    var image: UIImage!
    
    func setupCustomAnnotation(lat: CLLocationDegrees, long: CLLocationDegrees, annotationImageURLString: String, annotationName: String!){
        
        self.coordinate = CLLocationCoordinate2DMake(lat, long)
        
        let annotationImageURL = URL(string: annotationImageURLString)
        let annotationData = try? Data(contentsOf: annotationImageURL!)
        
        let imageData = annotationData
        let annotationImage = UIImage(data: imageData!)
        
        self.title = annotationName
        self.image = annotationImage
        
    }
    
}
