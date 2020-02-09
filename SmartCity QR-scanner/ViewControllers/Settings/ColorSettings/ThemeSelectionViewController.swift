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
        
        themeTableView.delegate = self
        themeTableView.dataSource = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !wasShown {
            themeTableView.reloadData()
            wasShown = true
        }
    }
}


extension ThemeSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Constants.Themes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentTheme = Constants.Themes[indexPath.row]
        let cell = themeTableView.dequeueReusableCell(withIdentifier: "ThemeViewCell") as! ThemeViewCell
        cell.set(with: currentTheme, reloading: wasShown)
        if currentTheme.gradientColor == ThemeManager.currentTheme.gradientColor {
            cell.theme.isSelected = true
        }
        else { cell.theme.isSelected = false }
        
        if wasShown {
            cell.reload = true
        }
        if !cell.theme.isSelected {
            cell.setButton.setTitle("Выбрать", for: .normal)
            cell.setButton.layer.borderWidth = 0
            cell.setButton.layer.borderColor = UIColor.clear.cgColor
        }
        else {
            cell.setButton.setTitle("Выбрано", for: .normal)
            cell.setButton.layer.borderWidth = 3
            cell.setButton.layer.borderColor = UIColor.systemBlue.cgColor
        }
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
}

extension ThemeSelectionViewController: ThemeTableButtonDelegate {
    func updateTable() {
        themeTableView.reloadData()
    }
    
    
}
