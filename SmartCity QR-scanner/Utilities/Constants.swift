//
//  Constants.swift
//  SmartCity QR-scanner
//
//  Created by Alexander Parshakov on 1/31/20.
//  Copyright © 2020 Alexander Parshakov. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    struct GradientSets {
        
        static let burningOrange = [hexStringToUIColor(hex: "#FF416C").cgColor, hexStringToUIColor(hex: "#FF4B2B").cgColor]
        static let celestial = [hexStringToUIColor(hex: "#C33764").cgColor, hexStringToUIColor(hex: "#1D2671").cgColor]
        static let deepSpace = [hexStringToUIColor(hex: "#000000").cgColor, hexStringToUIColor(hex: "#434343").cgColor]
        static let flare = [hexStringToUIColor(hex: "#f12711").cgColor, hexStringToUIColor(hex: "#f5af19").cgColor]
        static let clouds = [hexStringToUIColor(hex: "#ECE9E6").cgColor, hexStringToUIColor(hex: "#F9FCFF").cgColor]
        static let amin = [hexStringToUIColor(hex: "#4A00E0").cgColor, hexStringToUIColor(hex: "#8E2DE2").cgColor]
    }
    
    struct IDs {
        struct EntryKit {
            static let qrSuccessAlert = "qrSucessAlert"
        }
        struct Hero {
            static let scanButton = "scanButton"
            static let targetOutline = "targetOutline"
        }
    }
}


extension Constants {
    
    private static func hexStringToUIColor (hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
