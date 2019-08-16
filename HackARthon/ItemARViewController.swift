//
//  ItemARViewController.swift
//  HackARthon
//


import UIKit
import ARKit
import SceneKit
import AWSAppSync

class ItemARViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate, SKSceneDelegate {

    
    @IBOutlet weak var itemInfoLabel: UILabel!
    @IBOutlet var itemSceneView: SCNView!

    var itemName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemSceneView.delegate = self
        
        itemSceneView.autoenablesDefaultLighting = true
        itemSceneView.allowsCameraControl = true

        DataService.shared.appSyncClient?.fetch(query: ListLocationsQuery(), cachePolicy: .fetchIgnoringCacheData) {(result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            result?.data?.listLocations?.items!.forEach {
                let name = $0?.name
                if name == self.itemName!{
                    let modelURLString = $0?.modelName
                    print(modelURLString!)
                    let modelURL = NSURL(string: modelURLString!)
                    let modelSceneObject = try! SCNScene(url: modelURL! as URL, options: nil)
                    let modelNode = SCNNode()
                    
                    for modelChild in modelSceneObject.rootNode.childNodes {
                        modelNode.childNode(withName: name!, recursively: true)
                        modelNode.addChildNode(modelChild)
                    }

                    modelSceneObject.rootNode.addChildNode(modelNode)
                    self.itemSceneView.scene = modelSceneObject
                }
            }
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
}
