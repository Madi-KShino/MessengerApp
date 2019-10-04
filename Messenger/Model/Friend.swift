//
//  Friend.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 9/25/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation
import CoreData

extension Friend {
    @discardableResult
    convenience init(name: String,
                     profileImage: String,
                     context: NSManagedObjectContext = CoreDataStack.managedObjectContext) {
        self.init(context: context)
        self.name = name
        self.profileImage = profileImage
    }
}
