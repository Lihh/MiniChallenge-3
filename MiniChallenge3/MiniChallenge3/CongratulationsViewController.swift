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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnBack(sender: KPButton) {
        //self.dismissViewControllerAnimated(true, completion: nil)
        self.removeFromParentViewController()
    }
    
    @IBAction func btnReplay(sender: KPButton) {
        
    }
    
    @IBAction func btnNext(sender: KPButton) {
        
    }
    
}
