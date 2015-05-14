//
//  ScienceViewController.swift
//  MiniChallenge3
//
//  Created by Kaique Damato on 5/14/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class ScienceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToMainViewController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func transitionToLevel(sender: KPButton) {
        let exerciseStoryboard = UIStoryboard(name: "Animals", bundle: nil)
        if let viewController = exerciseStoryboard.instantiateInitialViewController() as? UIViewController {
            viewController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            presentViewController(viewController, animated: true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}