//
//  DateExtension.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 9/30/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation

extension Date {
    
    func prettyDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        return dateFormatter.string(from: self)
    }
}
