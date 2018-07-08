//
//  AnnouncementTableViewCell.swift
//  BADFW
//
//  Created by Souvik Banerjee on 1/17/18.
//  Copyright © 2018 Souvik Banerjee. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class EventTableViewCell : UITableViewCell {
    public static let reuseIdentifier = "EventTableViewCell"
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mainBackground: UIView!
    @IBOutlet weak var shadowLayer: UIView!
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self._minimized = false
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        self._minimized = false
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        self.mainBackground.layer.cornerRadius = 8
        self.mainBackground.layer.masksToBounds = true
        self.shadowLayer.layer.masksToBounds = false
        self.shadowLayer.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        self.shadowLayer.layer.shadowColor = UIColor.black.cgColor
        self.shadowLayer.layer.shadowOpacity = 0.23
        self.shadowLayer.layer.shadowRadius = 4
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

class EventTableViewCellShadowView : UIView {
    override var bounds: CGRect {
        didSet {
            setupShadow()
        }
    }

    private func setupShadow() {
        self.layer.cornerRadius = 8
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.3
        self.layer.shadowPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
