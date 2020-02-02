//
//  ScanViewController.swift
//  SmartCity QR-scanner
//
//  Created by Alexander Parshakov on 2/1/20.
//  Copyright © 2020 Alexander Parshakov. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import SwiftEntryKit


class ScanViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var targetOutline: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    // MARK: - Actions
    @IBAction func onCancelButtonTapped(_ sender: Any) {
        SwiftEntryKit.dismiss()
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Variables
    var delegate: FromSuccessAlertToScanViewDelegate?
    var video = AVCaptureVideoPreviewLayer()
    let session = AVCaptureSession()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelButton.hero.id = Constants.IDs.Hero.scanButton
        
        setupTargetOutline()
        UIEnhancementService.beautifyAccentButton(button: cancelButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLayoutSubviews()
        
        initScanning()
        self.view.bringSubviewToFront(cancelButton)
        self.view.bringSubviewToFront(targetOutline)
    }
} 

// MARK: - Configure UI
extension ScanViewController {
    private func setupTargetOutline() {
        targetOutline.layer.borderColor = UIColor.systemBlue.cgColor
        targetOutline.layer.borderWidth = 5
    }
}

// MARK: -
extension ScanViewController: AVCaptureMetadataOutputObjectsDelegate {
    private func initScanning() {
        
        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        
        do {
            if let inputs = session.inputs as? [AVCaptureDeviceInput] {
                for input in inputs {
                    session.removeInput(input)
                }
            }
            let input = try AVCaptureDeviceInput(device: captureDevice)
            session.addInput(input)
        } catch {
            print("Error")
        }
        if let outputs = session.outputs as? [AVCaptureMetadataOutput] {
            for output in outputs {
                session.removeOutput(output)
            }
        }
        let output = AVCaptureMetadataOutput()
        
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: .main)
        output.metadataObjectTypes = [.qr]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.bounds
        video.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.layer.addSublayer(video)
        
        session.startRunning()
        output.rectOfInterest = video.metadataOutputRectConverted(fromLayerRect: targetOutline.frame)
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard metadataObjects.count != 0 else { return }
        guard let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject else { return }
        guard object.type == .qr else { return }
        session.stopRunning()
        
        AlertService.showQRSuccess(viewController: self, alertTitle: object.stringValue ?? "Информация найдена")
    }
}

extension ScanViewController: FromSuccessAlertToScanViewDelegate {
    func alertDidDisappear() {
        session.startRunning()
    }
}
