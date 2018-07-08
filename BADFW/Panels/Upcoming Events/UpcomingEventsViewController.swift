//
//  UpcomingEventsViewController.swift
//  BADFW
//
//  Created by Souvik Banerjee on 11/22/17.
//  Copyright © 2017 Souvik Banerjee. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import iCalKit

class UpcomingEventsViewController : BasePanelViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!

    let cellNib = UINib.init(nibName: "EventTableViewCell", bundle: Bundle.main)

    var events: [iCalKit.Event] = []

    override func awakeFromNib() {
        let calendarURL = "https://calendar.google.com/calendar/ical/mohhticvbkm0fi384ijao0djmc%40group.calendar.google.com/public/basic.ics"
        Alamofire.request(calendarURL).responseString { (response) in
            guard let icalString = response.result.value else {
                NSLog("Failed to download ical as string")
                return
            }
            let icalStringTrimmed = icalString.components(separatedBy: .whitespacesAndNewlines).compactMap({ (s) -> String? in
                if s.isEmpty {
                    return nil
                } else {
                    return s
                }
            }).joined(separator: "\n")
            let calendar = iCal.load(string: icalStringTrimmed)
            self.events = calendar.flatMap({ (c) -> [iCalKit.Event] in
                c.subComponents.compactMap { (cc) -> iCalKit.Event? in
                    cc as? iCalKit.Event
                }
            })
            self.tableView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(self.cellNib, forCellReuseIdentifier: EventTableViewCell.reuseIdentifier)
        self.tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (self.tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.reuseIdentifier) as? EventTableViewCell) ?? EventTableViewCell.instantiateFromNib()
        let event = self.events[indexPath.row]
        cell.title = event.summary ?? "ERROR: no summary"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd HH:mm:ss"
        if let dtstart = event.dtstart, let dtend = event.dtend {
            cell.subtitle = "\(dateFormatter.string(from: dtstart))-\(dateFormatter.string(from: dtend))"
        } else {
            cell.subtitle = "\(dateFormatter.string(from: event.dtstamp))"
        }
        cell.descriptionText = event.descr ?? ""

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.events.count
        } else {
            return 0
        }
    }
}
