//
//  ContactViewController.swift
//  BADFW
//
//  Created by Souvik Banerjee on 7/21/18.
//  Copyright © 2018 Souvik Banerjee. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

class ContactViewController : BasePanelViewController {

    var tapGestureRecognizer: UITapGestureRecognizer!
    var taps: Int = 0
    var alertController: UIAlertController!
    var sideMenuViewController: SideMenuViewController!

    func ccSha256(data: Data) -> Data {
        var digest = Data(count: Int(CC_SHA256_DIGEST_LENGTH))

        _ = digest.withUnsafeMutableBytes { (digestBytes) in
            data.withUnsafeBytes { (stringBytes) in
                CC_SHA256(stringBytes, CC_LONG(data.count), digestBytes)
            }
        }
        return digest
    }

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        tapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tapRecognized(_:)))
        alertController = UIAlertController.init(title: "Password", message: "Enter admin password", preferredStyle: .alert)
        alertController!.addTextField { (field) in
            field.placeholder = "Password"
        }
        let action = UIAlertAction.init(title: "Submit", style: .default) { (action) in
            if let textFields = self.alertController?.textFields{
                let theTextFields = textFields as [UITextField]
                guard let enteredText = theTextFields[0].text else {
                    return
                }
                let data = self.ccSha256(data: enteredText.data(using: .utf8)!)
                let hash = data.map { String(format: "%02hhx", $0) }.joined()
                UserDefaults.standard.set(true, forKey: "adminEnabled")
                self.sideMenuViewController!.adminViewControllerCell.isHidden = false
            }
        }
        alertController!.addAction(action)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.addGestureRecognizer(tapGestureRecognizer!)
    }



    @objc func tapRecognized(_ sender: Any) {
        taps += 1
        if taps > 5 {
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
