//
//  Message.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 9/25/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation

class Message: NSObject {
    
    var text: String
    var date: NSDate
    var friend: Friend
    
    init(text: String, date: NSDate, friend: Friend) {
        self.text = text
        self.date = date
        self.friend = friend
    }
}
