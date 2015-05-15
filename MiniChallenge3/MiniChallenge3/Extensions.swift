//
//  Extensions.swift
//  MiniChallenge3
//
//  Created by Kaique Damato on 5/15/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

extension UIView {
    static func congratulationView(view: UIView) {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.width, view.frame.height)
        view.addSubview(blurView)

        var congratulationsView = UIView(frame: CGRectMake(view.frame.midX-100, view.frame.midY-100, 200.0, 200.0))
        congratulationsView.backgroundColor = UIColor.redColor()
        view.addSubview(congratulationsView)
    }
}
