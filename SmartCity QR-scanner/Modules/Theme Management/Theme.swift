//
//  Theme.swift
//  SmartCity QR-scanner
//
//  Created by Alexander Parshakov on 2/4/20.
//  Copyright © 2020 Alexander Parshakov. All rights reserved.
//

import Foundation
import UIKit


struct Theme {
    var name: String
    var normalColor: UIColor
    var gradientColor: [CGColor]
    var gradientUIColor: [UIColor]
    var isSelected: Bool = false
    
    init(withName name: String, normalColor: UIColor, gradient: [CGColor], gradientUIColor: [UIColor]) {
        self.normalColor = normalColor
        self.gradientColor = gradient
        self.name = name
        self.gradientUIColor = gradientUIColor
    }
}
