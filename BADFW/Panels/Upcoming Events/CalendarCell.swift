//
//  CalendarCell.swift
//  BADFW
//
//  Created by Souvik Banerjee on 1/25/18.
//  Copyright © 2018 Souvik Banerjee. All rights reserved.
//

import Foundation
import UIKit
import JTAppleCalendar

class CalendarCell : JTAppleCell {
    @IBOutlet weak var cellBackgroundView: UIView!

    public static let reuseIdentifier = "CalendarCell"

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    var day: String {
        get {
            return self.dayLabel.text ?? ""
        }
        set {
            self.dayLabel.text = newValue
        }
    }

    var dayOfWeek: String {
        get {
            return self.dayOfWeekLabel.text ?? ""
        }
        set {
            self.dayOfWeekLabel.text = newValue
        }
    }

    override func layoutSubviews() {
        //self.cellBackgroundView.layer.cornerRadius = self.cellBackgroundView.frame.size.width / 2
        //self.cellBackgroundView.clipsToBounds = true
    }
}
