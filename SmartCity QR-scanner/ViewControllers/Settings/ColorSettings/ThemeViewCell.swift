//
//  ThemeViewCell.swift
//  SmartCity QR-scanner
//
//  Created by Alexander Parshakov on 2/7/20.
//  Copyright © 2020 Alexander Parshakov. All rights reserved.
//

import UIKit

protocol ThemeTableButtonDelegate {
    func updateTable()
}
class ThemeViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var gradientView: LayerContainerView!
    @IBOutlet weak var themeNameLabel: UILabel!
    @IBOutlet weak var setButton: UIButton!
    
    
    // MARK: - Constraints
    @IBOutlet weak var setButtonWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var gradientViewHeightConstraint: NSLayoutConstraint!
    
    
    // MARK: - Actions
    @IBAction func onSetButtonTapped(_ sender: Any) {
        ThemeManager.changeTheme(to: theme)
        
        UIView.animate(withDuration: 0.4) {
            self.setButton.setTitle("Выбрано", for: .normal)
            self.setButton.layer.borderWidth = 3
            self.setButton.layer.borderColor = UIColor.systemBlue.cgColor
        }
        delegate?.updateTable()
        theme.isSelected = true
        AlertService.showChangeThemeSuccess()
    }
    
    
    // MARK: Variables
    var theme: Theme = Theme(withName: "", normalColor: .white, gradient: Constants.CGGradientSets.amin, gradientUIColor: Constants.UIGradientSets.amin)
    var delegate: ThemeTableButtonDelegate?
    var reload: Bool = false
    
    
    func set(with theme: Theme, reloading: Bool) {
        self.reload = reloading
        configureUI()
        
        self.theme = theme
        themeNameLabel.text = theme.name
    }
    
    func configureUI() {
        setDefaults()
        addGradient()
        setupSetButton()
    }
    
    func setDefaults() {
        gradientView.alpha = 0
        setButton.alpha = 0
        selectionStyle = .none
    }
    func addGradient() {
        guard reload else { return }
        gradientView.gradientColor = theme.gradientColor
        gradientView.awakeFromNib()
        gradientView.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.7) {
            self.gradientView.alpha = 1
            self.setButton.alpha = 1
        }
    }
    func setupSetButton() {
        setButton.layer.cornerRadius = 15
        setButton.setSlightShadow(shadowColor: .systemGray)
    }
}
