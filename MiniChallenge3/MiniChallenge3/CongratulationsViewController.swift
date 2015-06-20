//
//  CongratulationsViewController.swift
//  MiniChallenge3
//
//  Created by Lidia Chou on 5/19/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class CongratulationsViewController: UIViewController {
    
    let notificationCenter = NSNotificationCenter.defaultCenter()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func btnBack(sender: KPButton) {
        notificationCenter.postNotificationName("backToLevels", object: self, userInfo: nil)
    }
    
    @IBAction func btnHome(sender: KPButton) {
        notificationCenter.postNotificationName("backToHome", object: self, userInfo: nil)
    }
    
    @IBAction func btnNext(sender: KPButton) {
        notificationCenter.postNotificationName("nextLevel", object: self, userInfo: nil)
    }
    
}
