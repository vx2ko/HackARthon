//
//  Mcjag.swift
//  ARTest
//
//  Created by Kiyano Oben on 7/17/19.
//  Copyright © 2019 Kiyano Oben. All rights reserved.
//

import Foundation
import ARKit

class WhataburgerModel: SCNNode {
    
    
    func loadLogo() {
        guard let logoSceneObject = SCNScene(named: "art.scnassets/whataburgerv3.dae") else {return}
        
        let logoNode = SCNNode()
        
        for logoChild in logoSceneObject.rootNode.childNodes {
            logoNode.childNode(withName: "whataburgerModel", recursively: true)
            logoNode.addChildNode(logoChild)
        }
        
        let xPos = randomPositionWhataburgerModel(lowerBound: -1.5, upperBound: 1.5)
        //        let yPos = randomPosition(lowerBound: -1.5, upperBound: 1.5)
        let zPos = randomPositionWhataburgerModel(lowerBound: -1.5, upperBound: 1.5)
        
        let position = SCNVector3Make(xPos, -0.75, zPos)
        
        self.position = position
        logoNode.name = "Whataburger Logo"

        self.addChildNode(logoNode)
    }
    
}

//Create random position in ARSCNView
func randomPositionWhataburgerModel(lowerBound lower:Float, upperBound upper:Float) -> Float {
    return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
}
