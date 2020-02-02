//
//  AlertService.swift
//  SmartCity QR-scanner
//
//  Created by Alexander Parshakov on 1/31/20.
//  Copyright © 2020 Alexander Parshakov. All rights reserved.
//

import Foundation
import SwiftEntryKit

final class AlertService {
    static func showQRSuccess(viewController: FromSuccessAlertToScanViewDelegate, alertTitle title: String) {
        guard !SwiftEntryKit.isCurrentlyDisplaying else { return }
        
        var attributes = EKAttributes.centerFloat
        attributes.name = Constants.IDs.EntryKit.qrSuccessAlert
        
        attributes.entranceAnimation = .init(
            translate: .init(duration: 0.5, anchorPosition: .top, spring: .init(damping: 1, initialVelocity: 0)),
            scale: .init(from: 0.8, to: 1, duration: 0.5),
            fade: .init(from: 0.8, to: 1, duration: 0.3))
        
        attributes.windowLevel = .normal
        attributes.position = .center
        attributes.displayDuration = .infinity
        attributes.entryInteraction = .absorbTouches
        attributes.scroll = .enabled(swipeable: false, pullbackAnimation: .jolt)
        
        attributes.entryBackground = .color(color: .standardBackground)
        attributes.hapticFeedbackType = .success
        attributes.roundCorners = .all(radius: 15)
        let contentView = QRSuccessAlert()
        contentView.titleLabel.text = title
        contentView.delegate = viewController
        
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    static func hideQRSuccess(delegate: FromSuccessAlertToScanViewDelegate?) {
        SwiftEntryKit.dismiss(.specific(entryName: Constants.IDs.EntryKit.qrSuccessAlert)) {
            delegate?.alertDidDisappear()
        }
    }
}
