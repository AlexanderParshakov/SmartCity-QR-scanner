//
//  ScanViewController.swift
//  SmartCity QR-scanner
//
//  Created by Alexander Parshakov on 1/21/20.
//  Copyright © 2020 Alexander Parshakov. All rights reserved.
//

import UIKit
import Hero

class StartScanViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var scanButton: UIButton!
    @IBOutlet weak var scanImage: UIImageView!
    
    
    // MARK: - Actions
    @IBAction func onScanButtonTapped(_ sender: Any) {
        
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scanButton.hero.id = Constants.IDs.Hero.scanButton
        
        UIEnhancementService.beautifyAccentButton(button: scanButton)
    }
}
