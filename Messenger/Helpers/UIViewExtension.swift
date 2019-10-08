//
//  UIViewExtension.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 10/7/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addConstraints(format: String, views: UIView...) {
        var viewsDict = [String : UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDict[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDict))
    }
}
