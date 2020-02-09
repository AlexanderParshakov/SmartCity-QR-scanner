//
//  ThemeManager.swift
//  SmartCity QR-scanner
//
//  Created by Alexander Parshakov on 2/4/20.
//  Copyright © 2020 Alexander Parshakov. All rights reserved.
//

import Foundation

final class ThemeManager {
    
    private(set) static var currentTheme: Theme = Theme(withName: "", normalColor: .white, gradient: Constants.CGGradientSets.amin, gradientUIColor: Constants.UIGradientSets.amin)
    
    static func changeTheme(to theme: Theme) {
        currentTheme = theme
    }
}
