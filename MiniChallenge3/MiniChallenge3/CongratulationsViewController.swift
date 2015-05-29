//
//  CongratulationsViewController.swift
//  MiniChallenge3
//
//  Created by Lidia Chou on 5/19/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class CongratulationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnBack(sender: KPButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func btnHome(sender: KPButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let storyBoardLevels = storyBoard.instantiateViewControllerWithIdentifier("MainView") as! UIViewController
        storyBoardLevels.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        presentViewController(storyBoardLevels, animated: true, completion: nil)
    }
    
    @IBAction func btnNext(sender: KPButton) {
        
    }
    
}
