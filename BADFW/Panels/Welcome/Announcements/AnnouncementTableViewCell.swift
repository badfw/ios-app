//
//  AnnouncementTableViewCell.swift
//  BADFW
//
//  Created by Souvik Banerjee on 1/17/18.
//  Copyright © 2018 Souvik Banerjee. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class AnnouncementTableViewCell : UITableViewCell {
    public static let reuseIdentifier = "AnnouncementTableViewCell"
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self._minimized = false
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        self._minimized = false
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {

    }

    var _minimized: Bool = false
    var minimized: Bool {
        get {
            return _minimized
        }
        set {
            _minimized = newValue
            self.descriptionLabel.isHidden = newValue
            if self.descriptionLabel.isHidden {
                // has the effect of setting width+height of label to 0, so the cell height is reduced
                self.descriptionLabel.text = ""
            } else {
                self.descriptionLabel.text = self.descriptionText
            }
        }
    }

    var title: String {
        get {
            return titleLabel.text ?? ""
        }
        set {
            titleLabel.text = newValue
        }
    }

    var subtitle: String {
        get {
            return subtitleLabel.text ?? ""
        }
        set {
            subtitleLabel.text = newValue
        }
    }

    var _descriptionText: String = ""
    var descriptionText: String {
        get {
            return _descriptionText
        }
        set {
            _descriptionText = newValue
            descriptionLabel.text = newValue
        }
    }
}
