//
//  Message.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 9/25/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation
import CoreData

extension Message {
    @discardableResult
    convenience init(text: String,
                     date: Date,
                     friend: Friend,
                     context: NSManagedObjectContext = CoreDataStack.managedObjectContext) {
        self.init(context: context)
        self.text = text
        self.date = date
        self.friend = friend
    }
}
