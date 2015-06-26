//
//  CongratulationsViewController.swift
//  MiniChallenge3
//
//  Created by Lidia Chou on 5/19/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit
import AVFoundation

class CongratulationsViewController: UIViewController {
    
    let notificationCenter = NSNotificationCenter.defaultCenter()
    
    var audioPlayerSound = AVAudioPlayer()
    var blop2 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Blop2", ofType: "mp3")!)
    
    var audioPlayerDefeat = AVAudioPlayer()
    var defeatSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("defeat", ofType: "m4a")!)
    
    var numberOfStars = 0
    @IBOutlet weak var starsImageView: UIImageView!
    @IBOutlet weak var congratulationsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if numberOfStars == 0 {
            starsImageView.image = UIImage(named: "HollowStars")
            congratulationsLabel.text = "Você Perdeu!"
            audioPlayerSound = AVAudioPlayer(contentsOfURL: defeatSound, error: nil)
            audioPlayerSound.prepareToPlay()
            audioPlayerSound.play()
            audioPlayerSound.volume = 0.7
        } else if numberOfStars == 1 {
            starsImageView.image = UIImage(named: "OneStarFilled")
        } else if numberOfStars == 2 {
            starsImageView.image = UIImage(named: "TwoStarsFilled")
        } else {
            starsImageView.image = UIImage(named: "ThreeStarsFilled")
        }
    }

    @IBAction func btnBack(sender: KPButton) {
        print(blop2)
        audioPlayerSound = AVAudioPlayer(contentsOfURL: blop2, error: nil)
        audioPlayerSound.prepareToPlay()
        audioPlayerSound.play()
        audioPlayerSound.volume = 0.3
        notificationCenter.postNotificationName("backToLevels", object: self, userInfo: nil)
    }
    
    @IBAction func btnHome(sender: KPButton) {
        audioPlayerSound = AVAudioPlayer(contentsOfURL: blop2, error: nil)
        audioPlayerSound.prepareToPlay()
        audioPlayerSound.play()
        audioPlayerSound.volume = 0.3
        notificationCenter.postNotificationName("backToHome", object: self, userInfo: nil)
    }
    
}
