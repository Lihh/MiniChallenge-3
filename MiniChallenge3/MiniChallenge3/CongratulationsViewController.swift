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
    
    // Sounds
    var audioPlayer = AVAudioPlayer()
    var soundBlop = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Blop", ofType: "m4a")!)
    var soundGameOver = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("gameOver", ofType: "m4a")!)
    var soundGameWin = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("gameWin", ofType: "mp3")!)
    
    var numberOfStars = 0
    @IBOutlet weak var starsImageView: UIImageView!
    @IBOutlet weak var congratulationsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if numberOfStars == 0
        {
            starsImageView.image = UIImage(named: "HollowStars")
            congratulationsLabel.text = "Você Perdeu!"
            self.playSound(soundGameOver!, volume: 0.7)
        } else if numberOfStars == 1 {
            starsImageView.image = UIImage(named: "OneStarFilled")
            self.playSound(soundGameWin!, volume: 0.7)
        } else if numberOfStars == 2 {
            starsImageView.image = UIImage(named: "TwoStarsFilled")
            self.playSound(soundGameWin!, volume: 0.7)
        } else {
            starsImageView.image = UIImage(named: "ThreeStarsFilled")
            self.playSound(soundGameWin!, volume: 0.7)
        }
    }

    @IBAction func btnBack(sender: KPButton) {
        self.playSound(soundBlop!, volume: 0.3)
        notificationCenter.postNotificationName("backToLevels", object: self, userInfo: nil)
    }
    
    @IBAction func btnHome(sender: KPButton) {
        self.playSound(soundBlop!, volume: 0.3)
        notificationCenter.postNotificationName("backToHome", object: self, userInfo: nil)
    }
    
    func playSound(sound:NSURL, volume:Float)
    {
        audioPlayer = AVAudioPlayer(contentsOfURL: sound, error: nil)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        audioPlayer.volume = volume
    }
    
}
