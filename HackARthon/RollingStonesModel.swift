//
//  RollingStonesModel.swift
//  HackARthon
//
//  Created by Kiyano Oben on 8/2/19.
//  Copyright © 2019 Kiyano Oben. All rights reserved.
//

import Foundation
import ARKit

class RollingStoneModel: SCNNode {
    
    var itemImage = UIImage(named: "art.scnassets/iheartconcert.jpg")
    
    func loadLogo() {
        guard let logoSceneObject = SCNScene(named: "art.scnassets/stones.dae") else {return}
        
        let logoNode = SCNNode()
        
        for logoChild in logoSceneObject.rootNode.childNodes {
            logoNode.childNode(withName: "rollingStonesModel", recursively: true)
            logoNode.addChildNode(logoChild)
        }
        
        let xPos = randomPositionWhataburgerModel(lowerBound: -1.5, upperBound: 1.5)
        //        let yPos = randomPosition(lowerBound: -1.5, upperBound: 1.5)
        let zPos = randomPositionWhataburgerModel(lowerBound: -1.5, upperBound: 1.5)
        
        let position = SCNVector3Make(xPos, -0.75, zPos)
        
        self.position = position
        logoNode.name = "Rolling Stones"
        
        self.addChildNode(logoNode)
    }
    
}

//Create random position in ARSCNView
func randomPositionRollingStonesModel(lowerBound lower:Float, upperBound upper:Float) -> Float {
    return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
}
