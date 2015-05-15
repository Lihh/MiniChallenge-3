//
//  KPInspectableView.swift
//  KaiqueDamato
//
//  Created by Kaique Pantosi D'amato on 2/27/15.
//  Copyright (c) 2015 Kaique Pantosi D'amato. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        get {
            return UIColor(CGColor: layer.borderColor)!
        }
        set {
            layer.borderColor = newValue.CGColor
        }
    }
}

@IBDesignable
class KPButton : UIButton {}

@IBDesignable
class KPImageView: UIImageView {}

@IBDesignable
class KPTextField: UITextField {}
