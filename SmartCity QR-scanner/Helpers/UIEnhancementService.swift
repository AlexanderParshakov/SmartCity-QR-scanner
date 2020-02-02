//
//  UIEnhancementService.swift
//  SmartCity QR-scanner
//
//  Created by Alexander Parshakov on 2/1/20.
//  Copyright © 2020 Alexander Parshakov. All rights reserved.
//

import Foundation
import UIKit

struct UIEnhancementService {
    
    private init() {}
    
    static func beautifyAccentButton(button: UIButton, cornerRadius: CGFloat = 10) {
        button.applyGradient(colors: Constants.GradientSets.amin, cornerRadius: cornerRadius)
    }
    static func beautifyNormalButton(button: UIButton) {
        button.layer.cornerRadius = 15
    }
}
