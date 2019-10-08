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
        return (try? CoreDataStack.managedObjectContext.fetch(request))
        ?? []
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
    
    //Fetch Friends from Persistent Store
    func fetchFriends() -> [Friend]? {
        var friends: [Friend] = []
        let request: NSFetchRequest<Friend> = Friend.fetchRequest()
             friends = (try? CoreDataStack.managedObjectContext.fetch(request)) ?? []
        return friends
    }
    
    //Fetch Messages for friends and sort by date
    func fetchMessages() -> [Message]? {
        var messages: [Message] = []
        if let friends = fetchFriends() {
            for friend in friends {
                print(friend.name!)
                let request: NSFetchRequest<Message> = Message.fetchRequest()
                request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
                request.predicate = NSPredicate(format: "friend.name = %@", friend.name!)
                request.fetchLimit = 1
                do {
                    messages = try(CoreDataStack.managedObjectContext.fetch(request))
                    print(messages)
                } catch {
                    print("Error Fetching Messages")
                    return nil
                }
            }
        }
        return messages
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
