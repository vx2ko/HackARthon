//
//  DataService.swift
//  HackARthon
//
//  Created by Kiyano Oben on 8/15/19.
//  Copyright © 2019 Kiyano Oben. All rights reserved.
//

import Foundation
import AWSAppSync

class DataService: NSObject {
    static let shared = DataService()
    
    var appSyncClient: AWSAppSyncClient?
    
    private override init() {
        super.init()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appSyncClient = appDelegate.appSyncClient
        
    }

}
