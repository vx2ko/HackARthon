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
    var appSyncClient: AWSAppSyncClient?

    
    //let itemTableVC = ItemTableViewController()
    var iHeartLogo = IHeartModel()
    var whataburgerModel = WhataburgerModel()
    var itemName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appSyncClient = appDelegate.appSyncClient
        
        itemSceneView.delegate = self
        
        itemSceneView.autoenablesDefaultLighting = true
        itemSceneView.allowsCameraControl = true
        print(itemName)

        appSyncClient?.fetch(query: ListLocationsQuery(), cachePolicy: .fetchIgnoringCacheData) {(result, error) in
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

//    func addStonesModel(){
//        guard let logoSceneObject = SCNScene(named: "art.scnassets/stones.dae") else {return}
//        let logoNode = SCNNode()
//        
//        for logoChild in logoSceneObject.rootNode.childNodes {
//            logoNode.childNode(withName: "itemModel", recursively: true)
//            logoNode.addChildNode(logoChild)
//        }
//        
//        logoSceneObject.rootNode.addChildNode(logoNode)
//        itemSceneView.scene = logoSceneObject
//        itemInfoLabel.text = "Rolling Stones Top Songs \n-Paint it Black \n-Gimme Shelter \n-Sympathy for the Devil \n-(I Can't Get No) Satisfaction \n-You Can't Always Get What You Want \n-Jumpin' Jack Flash \n-Brown Sugar \n-Angie \n-Start Me Up"
//    }
//    
//    func addiHeartModel(){
//        guard let logoSceneObject = SCNScene(named: "art.scnassets/iheart3dV2.scn") else {return}
//        let logoNode = SCNNode()
//        
//        for logoChild in logoSceneObject.rootNode.childNodes {
//            logoNode.childNode(withName: "itemModel", recursively: true)
//            logoNode.addChildNode(logoChild)
//        }
//        
//        logoSceneObject.rootNode.addChildNode(logoNode)
//        itemSceneView.scene = logoSceneObject
//        itemInfoLabel.text = "iHeart Test test"
//    }
//    
//    func addKJ97Model(){
//        guard let logoSceneObject = SCNScene(named: "art.scnassets/kg97.dae") else {return}
//        let logoNode = SCNNode()
//        
//        for logoChild in logoSceneObject.rootNode.childNodes {
//            logoNode.childNode(withName: "itemModel", recursively: true)
//            logoNode.addChildNode(logoChild)
//        }
//        
//        logoSceneObject.rootNode.addChildNode(logoNode)
//        itemSceneView.scene = logoSceneObject
//        itemInfoLabel.text = "iHeart Test test"
//    }
//    
//    func addiHeartWingModel(){
//        guard let logoSceneObject = SCNScene(named: "art.scnassets/iheartwings.dae") else {return}
//        let logoNode = SCNNode()
//        
//        for logoChild in logoSceneObject.rootNode.childNodes {
//            logoNode.childNode(withName: "itemModel", recursively: true)
//            logoNode.addChildNode(logoChild)
//        }
//        
//        logoSceneObject.rootNode.addChildNode(logoNode)
//        itemSceneView.scene = logoSceneObject
//        itemInfoLabel.text = "iHeart Wings"
//    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
