//
//  UIViewExtensions.swift
//  BADFW
//
//  Created by Souvik Banerjee on 1/20/18.
//  Copyright © 2018 Souvik Banerjee. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    fileprivate class func fromNib<T: UIView>(viewType: T.Type) -> T! {
        let nibName = String(describing: T.self)
        let exitFunc = {
            kill(getpid(), SIGSTOP)
            exit(1)
        }
        guard let arr = Bundle.main.loadNibNamed(nibName, owner: self, options: nil) else {
            exitFunc()
            return nil
        }
        if arr.count == 0 {
            exitFunc()
            return nil
        }
        let obj = arr[0]
        if type(of: obj) != T.self {
            exitFunc()
            return nil
        }
        return obj as! T
    }

    public class func instantiateFromNib() -> Self {
        return fromNib(viewType: self)
    }
}
