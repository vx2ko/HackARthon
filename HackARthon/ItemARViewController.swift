//
//  ItemARViewController.swift
//  HackARthon
//


import UIKit
import ARKit
import SceneKit

class ItemARViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate, SKSceneDelegate {

    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet var itemSceneView: SCNView!
    
    
    //let itemTableVC = ItemTableViewController()
    var iHeartLogo = IHeartModel()
    var whataburgerModel = WhataburgerModel()
    var itemName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemSceneView.delegate = self
        
        itemSceneView.autoenablesDefaultLighting = true
        itemSceneView.allowsCameraControl = true
        print(itemName)
        switch (itemName){
        case "iHeart":
            addiHeartModel()
        case "Whataburger":
            addWhataburgerModel()
        default:
            return
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
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
    }

    func addiHeartModel(){
        guard let logoSceneObject = SCNScene(named: "art.scnassets/iheart3dV2.scn") else {return}
        let logoNode = SCNNode()
        
        for logoChild in logoSceneObject.rootNode.childNodes {
            logoNode.childNode(withName: "itemModel", recursively: true)
            logoNode.addChildNode(logoChild)
        }
        
        logoSceneObject.rootNode.addChildNode(logoNode)
        itemSceneView.scene = logoSceneObject
    }
    
    func addWhataburgerModel(){
        guard let logoSceneObject = SCNScene(named: "art.scnassets/whataburgerv3.scn") else {return}
        let logoNode = SCNNode()
        
        for logoChild in logoSceneObject.rootNode.childNodes {
            logoNode.childNode(withName: "itemModel", recursively: true)
            logoNode.addChildNode(logoChild)
        }
        
        logoSceneObject.rootNode.addChildNode(logoNode)
        itemSceneView.scene = logoSceneObject
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
