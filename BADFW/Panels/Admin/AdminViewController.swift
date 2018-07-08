//
//  AdminViewController.swift
//  BADFW
//
//  Created by Souvik Banerjee on 7/7/18.
//  Copyright © 2018 Souvik Banerjee. All rights reserved.
//

import Foundation
import UIKit

class AdminViewController : BasePanelViewController {
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var textView: UITextView!

    @IBOutlet weak var sendButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
    }

    @objc func keyboardWillHide(sender: NSNotification) {
        bottomConstraint.constant = 0
    }

    @objc func keyboardWillShow(sender: NSNotification) {
        guard let frame = sender.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        let newframe = self.view.convert(frame, from: (UIApplication.shared.delegate?.window)!)
        self.bottomConstraint.constant = newframe.origin.y - self.view.frame.height
    }

    @IBAction func buttonPressed(_ sender: Any) {
        self.textView.resignFirstResponder()
        self.setEditing(false, animated: true)
    UIApplication.shared.sendAction(#selector(resignFirstResponder), to: nil, from: nil, for: nil)

    }
}
