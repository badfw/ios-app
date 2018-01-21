//
//  AnnouncementsViewController.swift
//  BADFW
//
//  Created by Souvik Banerjee on 1/17/18.
//  Copyright © 2018 Souvik Banerjee. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class AnnouncementsViewController : UITableViewController {
    let cellNib = UINib.init(nibName: "AnnouncementTableViewCell", bundle: Bundle.main)
    var database_ref: DatabaseReference! = nil
    var announcements: [Announcement] = []
    override func awakeFromNib() {
        self.database_ref = Database.database().reference().child("announcements")
        self.database_ref.observe(.value) { (snapshot) in
            NSLog("Getting values")
            guard let announcements = snapshot.value as? NSDictionary else {
                NSLog("failed to cast snapshot")
                return
            }
            self.announcements = announcements.flatMap({ (keyObject, announcementObject) -> Announcement? in
                guard let announcement = announcementObject as? [String: String] else {
                    return nil
                }
                guard let key = (keyObject as? String)?.dropFirst() else {
                    NSLog("key is not a string")
                    return nil
                }
                guard let keyAsTimeInterval = TimeInterval.init(key) else {
                    NSLog("key \(key) is not a valid TimeInterval")
                    return nil
                }
                let timestamp = Date.init(timeIntervalSince1970: keyAsTimeInterval)
                guard let title = announcement["title"] else {
                    NSLog("failed to get title")
                    return nil
                }
                guard let subtitle = announcement["subtitle"] else {
                    NSLog("failed to get subtitle")
                    return nil
                }
                guard let body = announcement["body"] else {
                    NSLog("failed to get body")
                    return nil
                }
                return Announcement.init(title: title, subtitle: subtitle, body: body, timestamp: timestamp)
            }).sorted(by: {$1.timestamp < $0.timestamp})
            self.tableView.reloadData()
        }
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        self.tableView.register(self.cellNib, forCellReuseIdentifier: AnnouncementTableViewCell.reuseIdentifier)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (self.tableView.dequeueReusableCell(withIdentifier: AnnouncementTableViewCell.reuseIdentifier) as? AnnouncementTableViewCell) ?? AnnouncementTableViewCell.instantiateFromNib()
        let announcement = self.announcements[indexPath.row]
        cell.title = announcement.title
        cell.subtitle = announcement.subtitle
        cell.descriptionText = announcement.body
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.announcements.count
        } else {
            return 0
        }
    }
}

struct Announcement {
    var title: String
    var subtitle: String
    var body: String
    var timestamp: Date
}
