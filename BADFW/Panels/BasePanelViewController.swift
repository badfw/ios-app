//
//  BasePanelViewController.swift
//  BADFW
//
//  Created by Souvik Banerjee on 11/22/17.
//  Copyright © 2017 Souvik Banerjee. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

class BasePanelViewController : UIViewController {
    
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        // TODO: replace with an actual hamburger menu button image
        let hamburgerMenuButton = UIBarButtonItem.init(title: "Menu", style: .plain, target: self, action: #selector(BasePanelViewController.selectPanel))
        self.navigationItem.leftBarButtonItem = hamburgerMenuButton
    }
    
    @objc func selectPanel() {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
}


