//
//  ViewController.swift
//  ARTest


import UIKit
import SceneKit
import ARKit
import CoreData
import CoreLocation
import AVFoundation
import AWSAppSync

class ARViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var itemLabel: UILabel!
    
    var arVCItemArray = [String]()
    var arCellImageArray = [UIImage]()
    var itemsCDArray = [NSManagedObject]()
    var objPlayer: AVAudioPlayer?
    var parentName: String?
    
    let logoRefImageName = ["iheartlogo1","iheartlogo2","iheartlogo3","iheartlogo4","iheartlogo5"]
    let hackathonRefImageName = ["hackathonlogo2", "hackathonlogo"]
    let whataburgerRefImageName = ["whataburgerLogo1","whataburgerLogo2"]
    let cerealRefImageName = "honeyNutCherrios"
    let ffCerealRefImage = "FrostedFlakes"
    
    var iHeartLogo = IHeartModel()
    var whataburgerModel = WhataburgerModel()
    var homeModel = HomeModel()
    
    var customGeofence = CustomGeofence()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set the view's delegate
        sceneView.delegate = self

        LocationService.shared.manager.delegate = self
        LocationService.shared.manager.requestAlwaysAuthorization()

        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
        
        //Enable feature points
//        locationManager.delegate = self

//        locationManager.requestAlwaysAuthorization()
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.distanceFilter = 5
        
        UIApplication.shared.isIdleTimerDisabled = true
        
        itemLabel.isHidden = true
        
        //Add gesture recognizer
        self.sceneView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        
        //Set lighting
        configureLighting()

    }
    
    //Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //Hide home bar
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Load reference images
        guard let refImages = ARReferenceImage.referenceImages(inGroupNamed: "ARRefImages", bundle: Bundle.main) else {return}
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        configuration.detectionImages = refImages
        configuration.maximumNumberOfTrackedImages = 10
        
        // Run the view's session
        sceneView.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        //sceneView.session.pause()
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }

    //Animates passed node
    func addAnimation(node: SCNNode) {
//        let rotateOne = SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi), z: 0, duration: 2.0)
        let rotateOne = SCNAction.rotateBy(x: 0, y: 10, z: 0, duration: 0.5)

        node.runAction(rotateOne, completionHandler: {
            node.parent?.isHidden = true
        })
    }
    
    //When scene is rendered
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        let node = SCNNode()
        let trackedImageName = anchor.name
        
        //Checks reference image for iHeart logo
        for logoName in logoRefImageName {
            if trackedImageName == logoName {
                let plane = SCNPlane(width: 10, height: 6)
                plane.cornerRadius = 0.5
                let material = SCNMaterial()
                
                material.diffuse.contents = UIImage(named: "art.scnassets/iheartconcert.jpg")
                plane.materials = [material]
                
                let planeNode = SCNNode(geometry: plane)
                planeNode.eulerAngles.x = -.pi / 2
                planeNode.position.y = -2
                planeNode.name = "logoImage"
                
                node.addChildNode(planeNode)
                node.removeFromParentNode()
                
            }
        }
        
        //Checks reference image for Hackathon logo
        for whatLogoName in whataburgerRefImageName {
            if trackedImageName == whatLogoName {
                let plane = SCNPlane(width: 10, height: 6)
                plane.cornerRadius = 0.5
                let material = SCNMaterial()
                
                material.diffuse.contents = UIImage(named: "art.scnassets/whataburgerAd.jpg")
                plane.materials = [material]
                
                let planeNode = SCNNode(geometry: plane)
                planeNode.eulerAngles.x = -.pi / 2
                planeNode.position.y = -2
                planeNode.name = "whataburgerImage"
                
                node.addChildNode(planeNode)
                node.removeFromParentNode()
                
            }
        }
        
        if trackedImageName == cerealRefImageName {
            let imageAnchor = anchor as! ARImageAnchor
            
            
            let referenceImage = imageAnchor.referenceImage
            
            //2. Get The Physical Width & Height Of Our Reference Image
            let width = CGFloat(referenceImage.physicalSize.width)
            let height = CGFloat(referenceImage.physicalSize.height)
            
            //3. Create An SCNNode To Hold Our Video Player
            let videoHolder = SCNNode()
            videoHolder.name = "Honey Nut Cheerios"
            let planeHeight = height/2
            let videoHolderGeometry = SCNPlane(width: width, height: planeHeight)
            videoHolder.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
            videoHolder.geometry = videoHolderGeometry
            
            //4. Place It About The Target
            let zPosition = height - (planeHeight/2)
            videoHolder.position = SCNVector3(0, 0, -zPosition)
            
            //5. Create Our Video Player
            if let videoURL = Bundle.main.url(forResource: "art.scnassets/HoneyNutCherrios", withExtension: "mp4"){
                
                setupVideoOnNode(videoHolder, fromURL: videoURL)
            }
            
            //5. Add It To The Hierachy
            node.addChildNode(videoHolder)
            
        }

        if trackedImageName == ffCerealRefImage {
            let plane = SCNPlane(width: 4, height: 6)
            plane.cornerRadius = 0.5
            let material = SCNMaterial()
            
            material.diffuse.contents = UIImage(named: "art.scnassets/honeyNutCherrios.png")
            plane.materials = [material]
            
            let planeNode = SCNNode(geometry: plane)
            planeNode.eulerAngles.x = -.pi / 2
            planeNode.position.y = -2
            planeNode.name = "ffCerealImage"
            
            let imageAnchor = anchor as! ARImageAnchor
            
            
            let referenceImage = imageAnchor.referenceImage
            
            //2. Get The Physical Width & Height Of Our Reference Image
            let width = CGFloat(referenceImage.physicalSize.width)
            let height = CGFloat(referenceImage.physicalSize.height)
            
            //3. Create An SCNNode To Hold Our Video Player
            let videoHolder = SCNNode()
            videoHolder.name = "Honey Nuts"
            let planeHeight = height/2
            let videoHolderGeometry = SCNPlane(width: width, height: planeHeight)
            videoHolder.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
            videoHolder.geometry = videoHolderGeometry
            
            //4. Place It About The Target
            let zPosition = height - (planeHeight/2)
            videoHolder.position = SCNVector3(0, 0, -zPosition)
            
            //5. Create Our Video Player
            if let videoURL = Bundle.main.url(forResource: "art.scnassets/HoneyNutCherrios", withExtension: "mp4"){
                
                setupVideoOnNode(videoHolder, fromURL: videoURL)
            }
            
            //5. Add It To The Hierachy
            node.addChildNode(videoHolder)
            
            node.addChildNode(planeNode)
            node.removeFromParentNode()
            
        }
        
        return node

    }

    //When ARScene updates
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        let trackedNode = node

        if let imageAnchor = anchor as? ARImageAnchor{

            if (imageAnchor.isTracked) {
                trackedNode.isHidden = false
                //print("\(trackedNode.name)")
            
            } else {
                trackedNode.isHidden = true

                //print("\(trackedImageName)")
                //print("No image in view")
            
            }
        }
    }
    
    func removeiHeartModel(){
        
        let model = IHeartModel()
        model.removeFromParentNode()
        
    }
    
    func removeHomeModel(){
        let model = HomeModel()
        model.removeFromParentNode()
    }
    
    func removeWhataburgerModel(){
        let model = WhataburgerModel()
        model.removeFromParentNode()
    }
    
    func addiHeartModel(){
        let model = IHeartModel()
        model.loadLogo()
        sceneView.scene.rootNode.addChildNode(model)
    }
    
    func addHomeModel(){
        let model = HomeModel()
        model.loadLogo()
        sceneView.scene.rootNode.addChildNode(model)
    }
    
    func addWhataburgerModel(){
        let model = WhataburgerModel()
        model.loadLogo()
        sceneView.scene.rootNode.addChildNode(model)
    }
    
    func addRollingStonesModel(){
        let model = RollingStoneModel()
        model.loadLogo()
        sceneView.scene.rootNode.addChildNode(model)
    }
    
    func addKJ97Model(){
        let model = KJ97Model()
        model.loadLogo()
        sceneView.scene.rootNode.addChildNode(model)
    }
    
    func addiHeartWingModel(){
        let model = IheartWingModel()
        model.loadLogo()
        sceneView.scene.rootNode.addChildNode(model)
    }
    
    //TapGesture handler
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        let results = self.sceneView.hitTest(gesture.location(in: gesture.view), types: ARHitTestResult.ResultType.featurePoint)
        //let results = gesture.location(in: sceneView)
        guard let _: ARHitTestResult = results.first else {
            return
        }

        let tappedNode = self.sceneView.hitTest(gesture.location(in: gesture.view), options: [:])

        if !tappedNode.isEmpty {
            let node = tappedNode[0].node
            let nodeParent = node.parent
            let parentName = nodeParent?.name
            
            if let node = tappedNode.first?.node as SCNNode? {
                playAudioFile()
                addAnimation(node: node)
                print(parentName!)
//                itemLabel.isHidden = false
//                itemLabel.text = ("You got \(parentName!)")

                //itemTableViewController.itemArray.append(parentName!)
                //arVCItemArray.append(parentName!)
                
                //arCellImageArray.append(UIImage(named: "art.scnassets/emoji.png")!)
                
                DataService.shared.appSyncClient?.fetch(query: ListLocationsQuery(), cachePolicy: .fetchIgnoringCacheData) {(result, error) in
                    if error != nil {
                        print(error?.localizedDescription ?? "")
                        return
                    }
                    result?.data?.listLocations?.items!.forEach {
                        let name = $0?.name
                        let imageURL = $0?.imageName
                        if name == parentName{
                            self.save(name: name!, imageName: imageURL!, modelName: parentName!)
                        }
                    }
                }
                
                switch (parentName) {
                case "Rolling Stones":
                    let imageName: String! = "art.scnassets/RollingstonesTNx50.png"
                    save(name: parentName!, imageName: imageName, modelName: "RollingStones")
                case "iHeartLogo":
                    let imageName: String! = "art.scnassets/iheartwingsTNx50.png"
                    save(name: parentName!, imageName: imageName, modelName: "iHeartLogo")
                case "KJ97":
                    let imageName: String! = "art.scnassets/kj97TNx50.png"
                    save(name: parentName!, imageName: imageName, modelName: "KJ97")
                case "iHeartWing":
                    let imageName: String! = "art.scnassets/iheartwingsTNx50.png"
                    save(name: parentName!, imageName: imageName, modelName: "iHeartWing")

                default:
                   return
                }
                
            }

        }
    }
    
    func save(name: String, imageName: String, modelName: String) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Item",
                                       in: managedContext)!
        
        let item = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
        
        // 3
        item.setValue(name, forKeyPath: "name")
        item.setValue(imageName, forKeyPath: "imageName")
        item.setValue(modelName, forKeyPath: "modelName")

        
        // 4
        do {
            try managedContext.save()
            itemsCDArray.append(item)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func playAudioFile() {
        guard let url = Bundle.main.url(forResource: "art.scnassets/SeinfeldTheme", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            // For iOS 11
            objPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
           
            guard let aPlayer = objPlayer else { return }
            aPlayer.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func setupVideoOnNode(_ node: SCNNode, fromURL url: URL){
        
        //1. Create An SKVideoNode
        var videoPlayerNode: SKVideoNode!
        
        //2. Create An AVPlayer With Our Video URL
        let videoPlayer = AVPlayer(url: url)
        
        //3. Intialize The Video Node With Our Video Player
        videoPlayerNode = SKVideoNode(avPlayer: videoPlayer)
        videoPlayerNode.yScale = -1
        
        //4. Create A SpriteKitScene & Postion It
        let spriteKitScene = SKScene(size: CGSize(width: 600, height: 300))
        spriteKitScene.scaleMode = .aspectFit
        videoPlayerNode.position = CGPoint(x: spriteKitScene.size.width/2, y: spriteKitScene.size.height/2)
        videoPlayerNode.size = spriteKitScene.size
        spriteKitScene.addChild(videoPlayerNode)
        
        //6. Set The Nodes Geoemtry Diffuse Contenets To Our SpriteKit Scene
        node.geometry?.firstMaterial?.diffuse.contents = spriteKitScene
        
        //5. Play The Video
        videoPlayerNode.play()
        videoPlayer.volume = 0
        
    }

    func randomPosition(lowerBound lower:Float, upperBound upper:Float) -> Float {
        return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.authorizedAlways) {
            customGeofence.queryGeofenceData()
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        print("Monitoring \(region.identifier)")
    }
    
    func locationManager(_ manager: CLLocationManager, didDetermineState state: CLRegionState, for region: CLRegion) {
        if state == CLRegionState.inside{
            //var modelURL: NSURL!
            print(region.identifier)
            setupModel(region)
            
        }
    }
    
    func setupModel(_ region: CLRegion){
        let modelNode = SCNNode()

        DataService.shared.appSyncClient?.fetch(query: ListLocationsQuery(), cachePolicy: .fetchIgnoringCacheData) {(result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            
            print("stop 1")
            
            result?.data?.listLocations?.items!.forEach {
                let name = $0?.name
                if name == region.identifier{
                    print("Stop 2")
                    let modelURLString = $0?.modelName
                    print(modelURLString!)
                    let modelURL = NSURL(string: modelURLString!)
                    let modelSceneObject = try! SCNScene(url: modelURL! as URL, options: nil)

                    for modelChild in modelSceneObject.rootNode.childNodes {
                        modelNode.childNode(withName: name!, recursively: true)
                        modelNode.addChildNode(modelChild)
                    }
                    let xPos = self.randomPosition(lowerBound: -1.5, upperBound: 1.5)
                    //        let yPos = randomPosition(lowerBound: -1.5, upperBound: 1.5)
                    let zPos = self.randomPosition(lowerBound: -1.5, upperBound: 1.5)
                    
                    let position = SCNVector3Make(xPos, -2.5, zPos)
                    
                    modelNode.position = position
                    modelNode.name = name!
                    print(name!)
                    print(modelNode)
                    self.sceneView.scene.rootNode.addChildNode(modelNode)
                }
            }
        }
    }
}
