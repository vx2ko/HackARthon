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
        guard let logoSceneObject = SCNScene(named: "art.scnassets/bomberman.dae") else {return}
        
        let logoNode = SCNNode()
        
        for logoChild in logoSceneObject.rootNode.childNodes {
            logoNode.childNode(withName: "homeModel", recursively: true)
            logoNode.addChildNode(logoChild)
        }
        
        let xPos = randomPositionHomeModel(lowerBound: -1.5, upperBound: 1.5)
        //        let yPos = randomPosition(lowerBound: -1.5, upperBound: 1.5)
        let zPos = randomPositionHomeModel(lowerBound: -1.5, upperBound: 1.5)
        
        let position = SCNVector3Make(xPos, -0.75, zPos)
        
        self.position = position
        logoNode.name = "Bomberman"
        self.addChildNode(logoNode)
    }
    
    func addItem(){
        
    }
    
}



//Create random position in ARSCNView
func randomPositionHomeModel(lowerBound lower:Float, upperBound upper:Float) -> Float {
    return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
}
