//
//  ItemARViewController.swift
//  HackARthon
//
//  Created by Kiyano Oben on 7/31/19.
//  Copyright © 2019 Kiyano Oben. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ItemARViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate, SKSceneDelegate {

    
    @IBOutlet var itemSceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemSceneView.delegate = self
        
        itemSceneView.autoenablesDefaultLighting = true
        
        let itemTableVC = ItemTableViewController()
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        
        guard let logoSceneObject = SCNScene(named: "art.scnassets/iheart3dV2.scn") else {return}
        
        let logoNode = SCNNode()
        
        for logoChild in logoSceneObject.rootNode.childNodes {
            logoNode.childNode(withName: "iHeartModel", recursively: true)
            logoNode.addChildNode(logoChild)
        }
        
        let position = SCNVector3Make(0, -0.85, -0.75)
        logoNode.name = "iHeartLogo"
        logoNode.position = position
        itemSceneView.scene.rootNode.addChildNode(logoNode)
        
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        itemSceneView.session.run(configuration)
                

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
