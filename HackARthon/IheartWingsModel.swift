//
//  IheartWingsModel.swift
//  HackARthon
//
//  Created by Kiyano Oben on 8/2/19.
//  Copyright © 2019 Kiyano Oben. All rights reserved.
//

import Foundation
import ARKit

class IheartWingModel: SCNNode {
    
    let imageName: String! = "art.scnassets/emoji.png"
    
    func loadLogo() {
        guard let logoSceneObject = SCNScene(named: "art.scnassets/iheartwings.dae") else {return}
        let logoNode = SCNNode()
        
        for logoChild in logoSceneObject.rootNode.childNodes {
            logoNode.childNode(withName: "iHeartWings", recursively: true)
            logoNode.addChildNode(logoChild)
        }
        
        let xPos = randomPositioniHeartLogo(lowerBound: -1.5, upperBound: 1.5)
        //        let yPos = randomPosition(lowerBound: -1.5, upperBound: 1.5)
        let zPos = randomPositioniHeartLogo(lowerBound: -1.5, upperBound: 1.5)
        
        let position = SCNVector3Make(xPos, -0.75, zPos)
        
        self.position = position
        logoNode.name = "iHeartWing"
        self.addChildNode(logoNode)
    }
    
    //    func removeLogo(){
    //        logoNode.removeFromParentNode()
    //    }
    
    func setItemInfo(){
        
    }
    
}

//Create random position in ARSCNView
func randomPositioniHeartWingLogo(lowerBound lower:Float, upperBound upper:Float) -> Float {
    return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
}
