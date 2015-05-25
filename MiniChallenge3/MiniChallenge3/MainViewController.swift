//
//  ViewController.swift
//  MiniChallenge3
//
//  Created by Lidia Chou on 5/14/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    
    var transition = CircleSegue()
    var toViewController: UIViewController? = nil

    @IBOutlet weak var mathButton: KPButton!
    @IBOutlet weak var portugueseButton: KPButton!
    @IBOutlet weak var scienceButton: KPButton!
    
    var gameSoundBlop = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Blop", ofType: "mp3")!)
    var gameSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("gameMusic", ofType: "mp3")!)
    var audioPlayerMusic = AVAudioPlayer()
    var audioPlayerSound = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = true
        
        audioPlayerMusic = AVAudioPlayer(contentsOfURL: gameSound, error: nil)
        audioPlayerMusic.prepareToPlay()
        audioPlayerMusic.play()
        audioPlayerMusic.numberOfLoops = -1
        audioPlayerMusic.volume = 0.07
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        audioPlayerSound = AVAudioPlayer(contentsOfURL: gameSoundBlop, error: nil)
        audioPlayerSound.prepareToPlay()
        audioPlayerSound.play()
        audioPlayerSound.volume = 0.3
        let customSegue: String = segue.identifier!
        
        switch customSegue {
        case "segueOne":
            self.transition.animationChild = mathButton
            self.transition.animationColor = UIColor(red: 236/255, green: 86/255, blue: 82/255, alpha: 1.0)
            toViewController = segue.destinationViewController as! MathViewController
        case "segueTwo":
            self.transition.animationChild = portugueseButton
            self.transition.animationColor = UIColor(red: 18/255, green: 143/255, blue: 250/255, alpha: 1)
            toViewController = segue.destinationViewController as! PortugueseViewController
        case "segueThree":
            self.transition.animationChild = scienceButton
            self.transition.animationColor = UIColor(red: 46/255, green: 209/255, blue: 133/255, alpha: 1.0)
            toViewController = segue.destinationViewController as! ScienceViewController
        default:
            return;
        }
        self.transition.fromViewController = self
        self.transition.toViewController = toViewController
        
        toViewController!.transitioningDelegate = transition
    }

}

