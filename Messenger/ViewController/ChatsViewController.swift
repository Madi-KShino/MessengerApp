//
//  ChatsViewController.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 9/25/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit

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
