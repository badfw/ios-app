//
//  UpcomingEventsViewController.swift
//  BADFW
//
//  Created by Souvik Banerjee on 11/22/17.
//  Copyright © 2017 Souvik Banerjee. All rights reserved.
//

import Foundation
import UIKit
import JTAppleCalendar

class UpcomingEventsViewController : BasePanelViewController, JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    let cellNib = UINib.init(nibName: "CalendarCell", bundle: Bundle.main)
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        let cell = cell as! CalendarCell
        let day: String = {
            let components = Calendar.current.dateComponents(Set([Calendar.Component.day]), from: date)
            return String(components.day!)
        }()
        let dayOfWeek: String = {
            let formatter = DateFormatter.init()
            formatter.dateFormat = "EEE"
            return formatter.string(from: date)
        }()
        cell.day = day
        cell.dayOfWeek = dayOfWeek
    }

    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: CalendarCell.reuseIdentifier, for: indexPath) as! CalendarCell
        let day: String = {
            let components = Calendar.current.dateComponents(Set([Calendar.Component.day]), from: date)
            return String(components.day!)
        }()
        let dayOfWeek: String = {
            let formatter = DateFormatter.init()
            formatter.dateFormat = "EEE"
            return formatter.string(from: date)
        }()
        cell.day = day
        cell.dayOfWeek = dayOfWeek
        return cell
    }

    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let start = Date.init()
        let end: Date = {
            var components = DateComponents.init()
            components.day = 5
            return Calendar.current.date(byAdding: components, to: start)!
        }()
        return ConfigurationParameters.init(startDate: start, endDate: end, numberOfRows: 1, calendar: nil, generateInDates: nil, generateOutDates: nil, firstDayOfWeek: DaysOfWeek.friday, hasStrictBoundaries: true)
    }

    override func viewDidLoad() {
        self.calendarView.register(self.cellNib, forCellWithReuseIdentifier: CalendarCell.reuseIdentifier)
        super.viewDidLoad()
    }

    
}
