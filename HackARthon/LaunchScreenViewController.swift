//
//  LaunchScreenViewController.swift
//  HackARthon
//
//  Created by Kiyano Oben on 8/16/19.
//  Copyright © 2019 Kiyano Oben. All rights reserved.
//

import UIKit
import AVFoundation

class LaunchScreenViewController: UIViewController {

    var player: AVPlayer?
    @IBOutlet weak var startARButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "art.scnassets/iheartwingsTN.png")
        
        let blur = UIVisualEffectView(effect: UIBlurEffect(style:
            UIBlurEffect.Style.light))
        startARButton.layer.cornerRadius = 5
        startARButton.setTitle("iHeARt Experience", for: .normal)
        blur.layer.cornerRadius = 5
        blur.clipsToBounds = true

        blur.frame = startARButton.bounds
        blur.isUserInteractionEnabled = false
        
        startARButton.insertSubview(blur, belowSubview: startARButton.titleLabel!)

        let path = Bundle.main.path(forResource: "art.scnassets/city", ofType: "mp4")
        player = AVPlayer(url: NSURL(fileURLWithPath: path!) as URL)
        player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none;
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd) , name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        player!.seek(to: CMTime.zero)
        player!.play()
        // Do any additional setup after loading the view.
    }
    
    @objc func playerItemDidReachEnd() {
        player!.seek(to: CMTime.zero)
    }
}
