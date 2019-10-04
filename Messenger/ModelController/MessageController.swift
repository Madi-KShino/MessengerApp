//
//  MessageController.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 10/1/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation
import CoreData

class MessageController {
    
    //Singleton
    static let sharedInstance = MessageController()
    
    //Create/Save a new message
    func createMessageWith(text: String, date: Date, friend: Friend) {
        Message(text: text, date: date, friend: friend)
        FriendController.sharedInstance.saveToPersistentStore()
    }
    
    //Delete Messages
    func deleteMessage(message: Message) {
        if let moc = message.managedObjectContext {
            moc.delete(message)
            FriendController.sharedInstance.saveToPersistentStore()
        }
    }
}
