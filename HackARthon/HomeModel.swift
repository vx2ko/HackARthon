//
//  File.swift
//  HackARthon
//
//  Created by Kiyano Oben on 7/25/19.
//  Copyright © 2019 Kiyano Oben. All rights reserved.
//

import Foundation
import ARKit

class HomeModel: SCNNode {
    
    
    func loadLogo() {
        guard let logoSceneObject = SCNScene(named: "art.scnassets/iheart3dV2.scn") else {return}
        
        let logoNode = SCNNode()
        
        for logoChild in logoSceneObject.rootNode.childNodes {
            logoNode.childNode(withName: "logo", recursively: true)
            logoNode.addChildNode(logoChild)
        }
        
        let xPos = randomPositionHomeModel(lowerBound: -1.5, upperBound: 1.5)
        //        let yPos = randomPosition(lowerBound: -1.5, upperBound: 1.5)
        let zPos = randomPositionHomeModel(lowerBound: -1.5, upperBound: 1.5)
        
        let position = SCNVector3Make(xPos, -0.75, zPos)
        
        self.position = position
        self.addChildNode(logoNode)
    }
    
}

//Create random position in ARSCNView
func randomPositionHomeModel(lowerBound lower:Float, upperBound upper:Float) -> Float {
    return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
}
