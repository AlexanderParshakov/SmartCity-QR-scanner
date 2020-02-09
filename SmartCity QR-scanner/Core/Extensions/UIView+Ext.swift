//
//  UIButton+Ext.swift
//  SmartCity QR-scanner
//
//  Created by Alexander Parshakov on 1/31/20.
//  Copyright © 2020 Alexander Parshakov. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func applyGradient(colors: [CGColor], cornerRadius: CGFloat = 10) {
        self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = cornerRadius
        
        gradientLayer.name = "current"

        gradientLayer.shadowColor = UIColor.darkGray.cgColor
        gradientLayer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        gradientLayer.shadowRadius = 5.0
        gradientLayer.shadowOpacity = 0.3
        gradientLayer.masksToBounds = true
        gradientLayer.bounds = self.bounds

        if self is UIButton {
            (self as! UIButton).contentVerticalAlignment = .center
            (self as! UIButton).setTitleColor(UIColor.white, for: .normal)
            (self as! UIButton).titleLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
            (self as! UIButton).titleLabel?.textColor = UIColor.white
        }
        

        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    func setSlightShadow(shadowColor: UIColor) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height:  2)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.35
    }
}
