//
//  SettingsViewController.swift
//  SmartCity QR-scanner
//
//  Created by Alexander Parshakov on 2/8/20.
//  Copyright © 2020 Alexander Parshakov. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet var settingsTableView: UITableView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = Constants.Titles.settings
    }
}


extension SettingsViewController {
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (section == 0)
        {
            return 40.0;
        }
        if (section == 1)
        {
            return 150.0;
        }
        else
        {
            return .leastNormalMagnitude;
        }
    }
}

