//
//  FriendController.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 10/1/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation
import CoreData

class FriendController {
    
    //Singleton
    static let sharedInstance = FriendController()
    
    //Source of Truth
    var friends: [Friend] {
        let request: NSFetchRequest<Friend> = Friend.fetchRequest()
        return (try? CoreDataStack.managedObjectContext.fetch(request)) ?? []
    }
    
    //Create/Save new Friend
    func addFriend(name: String, profileImage: String) {
        Friend(name: name, profileImage: profileImage)
        saveToPersistentStore()
    }
    
    //Delete/Remove Friend
    func deleteFriend(friend: Friend) {
        if let moc = friend.managedObjectContext {
            moc.delete(friend)
            saveToPersistentStore()
        }
    }
    
    //Base Save Function
    func saveToPersistentStore() {
        let moc = CoreDataStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error in \(#function): \(error.localizedDescription) \n---\n \(error)")
        }
    }
}
