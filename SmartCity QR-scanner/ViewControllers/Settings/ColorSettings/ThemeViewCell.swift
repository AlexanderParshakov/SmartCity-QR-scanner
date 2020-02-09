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
    
    // MARK: - Init Function
    func setup(with theme: Theme, reloading: Bool) {
        self.reload = reloading
        
        setupSetButtonAppearance()
        setUIDefaults()
        addGradient()
        
        setData(theme: theme)
    }
}

// MARK: - UI Section
extension ThemeViewCell {
    private func setupSetButtonAppearance() {
        setButton.layer.cornerRadius = 15
        setButton.setSlightShadow(shadowColor: .systemGray)
    }
    private func setUIDefaults() {
        self.setGradientAndButtonVisibility(hide: true)
        selectionStyle = .none
    }
    private func setGradientAndButtonVisibility(hide: Bool) {
        self.gradientView.alpha = hide ? .zero : .greatestFiniteMagnitude
        self.setButton.alpha = hide ? .zero : .greatestFiniteMagnitude
    }
    private func addGradient() {
        guard reload else { return }
        gradientView.gradientColor = theme.gradientColor
        gradientView.awakeFromNib()
        gradientView.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.7) {
            self.setGradientAndButtonVisibility(hide: false)
        }
    }
}

// MARK: - Data Section
extension ThemeViewCell {
    private func setData(theme: Theme) {
        self.theme = theme
        themeNameLabel.text = theme.name
    }
}
