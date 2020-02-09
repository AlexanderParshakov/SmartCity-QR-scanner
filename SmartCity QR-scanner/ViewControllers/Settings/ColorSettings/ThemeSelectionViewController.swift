//
//  StyleSelectionViewController.swift
//  SmartCity QR-scanner
//
//  Created by Alexander Parshakov on 2/7/20.
//  Copyright © 2020 Alexander Parshakov. All rights reserved.
//

import Foundation
import UIKit

class ThemeSelectionViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var themeTableView: UITableView!
    
    
    // MARK: - Constraints
    
    
    // MARK: - Actions
    
    
    // MARK: - Variables
    var themesList: [Theme] = []
    var wasShown: Bool = false
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConformance()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !wasShown {
            themeTableView.reloadData()
            wasShown = true
        }
    }
    
    private func setupConformance() {
        themeTableView.delegate = self
        themeTableView.dataSource = self
    }
}


extension ThemeSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Constants.Themes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = themeTableView.dequeueReusableCell(withIdentifier: "ThemeViewCell") as! ThemeViewCell
        cell.delegate = self
        
        let currentTheme = Constants.Themes[indexPath.row]
        cell.setup(with: currentTheme, reloading: wasShown)
        
        if currentTheme.gradientColor == ThemeManager.currentTheme.gradientColor {
            cell.theme.isSelected = true
        } else { cell.theme.isSelected = false }
        
        if wasShown { cell.reload = true }
        
        if !cell.theme.isSelected {
            setButtonSelectionState(in: cell, with: "Выбрать", withWidth: 0, ofColor: UIColor.clear)
        } else { setButtonSelectionState(in: cell, with: "Выбрано", withWidth: 3, ofColor: UIColor.systemBlue) }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    private func setButtonSelectionState(in themeCell: ThemeViewCell, with title: String, withWidth borderWidth: CGFloat, ofColor borderColor: UIColor) {
        themeCell.setButton.setTitle(title, for: .normal)
        themeCell.setButton.layer.borderWidth = borderWidth
        themeCell.setButton.layer.borderColor = borderColor.cgColor
    }
}

extension ThemeSelectionViewController: ThemeTableButtonDelegate {
    func updateTable() {
        themeTableView.reloadData()
    }
}
