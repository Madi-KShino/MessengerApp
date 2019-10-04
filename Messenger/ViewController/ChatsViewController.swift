//
//  ChatsViewController.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 9/25/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit
import CoreData

class ChatsViewController: UIViewController {

    //Properties
    var messages: [Message]?
    var friends: [Friend]?
    
    //Outlets
    @IBOutlet weak var userIconImage: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var searchChatsSearchBar: UISearchBar!
    @IBOutlet weak var friendsCollectionView: UICollectionView!
    @IBOutlet weak var chatsTableView: UITableView!
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setDelegates()
        setData()
        setTestData()
    }
    
    //Set Up - Initial View for Components
    func setupView() {
        cameraButton.layer.cornerRadius = cameraButton.frame.height / 2
        composeButton.layer.cornerRadius = composeButton.frame.height / 2
    }
    
    //Set Up - Delegates for Components
    func setDelegates() {
        searchChatsSearchBar.delegate = self
        friendsCollectionView.delegate = self
        friendsCollectionView.dataSource = self
        chatsTableView.delegate = self
        chatsTableView.dataSource = self
    }
    
    //Set Up Test Data
    func setTestData() {
        let danny = Friend(name: "Danny", profileImage: "DANNY")
        let madi = Friend(name: "Madi K.", profileImage: "ME")
        let message = Message(text: "BURN THEM ALL", date: Date(), friend: danny)
        let otherMessage = Message(text: "Hello World!", date: Date(), friend: madi)
        let message2 = Message(text: "Aghghghg", date: Date(), friend: madi)
        friends?.append(madi)
        friends?.append(danny)
        messages = [message, otherMessage, message2]
    }
    
    //Get fetched friend and message data, sort messages by newest
    func setData() {
        friends = FriendController.sharedInstance.friends
        if let messages = FriendController.sharedInstance.fetchMessages() {
            let sortedMessages = messages.sorted(by: {$0.date!.compare($1.date!) == .orderedDescending})
            self.messages?.append(contentsOf: sortedMessages)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMessageViewForSelectedFriemd" {
            guard let indexPath = chatsTableView.indexPathForSelectedRow,
            let messages = messages else { return }
            let destination = segue.destination as? ChatLogViewController
            let friend = messages[indexPath.row].friend
            destination?.friend = friend
        }
    }
}

//CollectionView Data Source
extension ChatsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let friends = friends else { return 0 }
        return friends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendCell", for: indexPath) as? FriendCollectionViewCell else { return UICollectionViewCell() }
        if let friend = friends?[indexPath.item] {
            cell.friend = friend
        }
        return cell
    }
    
}

//TableView Data Source
extension ChatsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let messages = messages else { return 0 }
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as? ChatTableViewCell else { return UITableViewCell() }
        if let message = messages?[indexPath.row] {
            cell.message = message
        }
        return cell
    }
}

//SearchBar
extension ChatsViewController: UISearchBarDelegate {
    
}
