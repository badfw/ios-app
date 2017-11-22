//
//  UIViewControllerExtensions.swift
//  BADFW
//
//  Created by Souvik Banerjee on 11/22/17.
//  Copyright © 2017 Souvik Banerjee. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    private class func fromNib<T: UIViewController>(viewType: T.Type) -> T! {
        let nibName = String(describing: T.self)
        let storyboard = UIStoryboard(name: nibName, bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: nibName)
        return vc as! T
    }
    
    // Lets you instantiate a view controller from a nib using
    // MyViewController.instantiateFromStoryboard()
    public class func instantiateFromStoryboard() -> Self {
        return fromNib(viewType: self)
    }
}
