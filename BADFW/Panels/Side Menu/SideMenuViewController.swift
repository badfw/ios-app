//
//  SideMenuViewController.swift
//  BADFW
//
//  Created by Souvik Banerjee on 11/22/17.
//  Copyright © 2017 Souvik Banerjee. All rights reserved.
//

import Foundation
import UIKit

class SideMenuViewController : UITableViewController {
    // TODO: improve design, replace the header view with something more meaningful
    var associatedNavigationController : UINavigationController?
    var welcomeViewController: WelcomeViewController?
    var upcomingEventsViewController: UpcomingEventsViewController?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        self.dismiss(animated: true) {
            // TODO: Add cases and view controllers for the other panels
            UIView.animate(withDuration: 0.2) {
                switch (indexPath.row) {
                case 0: // Welcome
                    self.associatedNavigationController?.setViewControllers([self.welcomeViewController!], animated: false)
                case 1: // Upcoming Events
                    self.associatedNavigationController?.setViewControllers([self.upcomingEventsViewController!], animated: false)
                default:
                    NSLog("Invalid case")
                }
            }
        }
    }
}
