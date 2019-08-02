//
//  ContestViewController.swift
//  HackARthon
//
//  Created by Kiyano Oben on 8/2/19.
//  Copyright © 2019 Kiyano Oben. All rights reserved.
//

import UIKit

class ContestViewController: UIViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    @IBOutlet weak var image10: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image1.image = UIImage(named: "art.scnassets/RollingstonesTNx50.png")
        image2.image = UIImage(named: "art.scnassets/kj97TNx50.png")

        image3.image = UIImage(named: "art.scnassets/MicTNG.png")

        image4.image = UIImage(named: "art.scnassets/drumstickTNG.png")
        image5.image = UIImage(named: "art.scnassets/wbTN.png")
        image6.image = UIImage(named: "art.scnassets/iobTN.png")
        image7.image = UIImage(named: "art.scnassets/spurTN.png")
        image8.image = UIImage(named: "art.scnassets/mdTN.png")
        image9.image = UIImage(named: "art.scnassets/HomeDepotTNG.png")
        image10.image = UIImage(named: "art.scnassets/HomeDepotTN.png")


        // Do any additional setup after loading the view.
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
