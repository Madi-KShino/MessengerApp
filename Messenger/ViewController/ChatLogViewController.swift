//
//  ChatLogViewController.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 10/3/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit

class ChatLogViewController: UIViewController {

    //Properties
    private let cellID = "messageCell"
    var messages: [Message]?
    var friend: Friend? {
        didSet {
            messages = friend?.messages?.allObjects as? [Message]
            if let messages = messages {
                self.messages = messages.sorted(by: {$0.date!.compare($1.date!) == .orderedAscending})
            }
        }
    }
    
    //Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatsCollectionView: UICollectionView!
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setView()
    }
    
    //Set Delegate as self for Collection View
    func setDelegates() {
        chatsCollectionView.delegate = self
        chatsCollectionView.dataSource = self
    }
    
    //Set View Componets
    func setView() {
        if let friend = friend {
            nameLabel.text = friend.name
        }
    }
}

extension ChatLogViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = messages?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? ChatLogCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
           layout collectionViewLayout: UICollectionViewLayout,
           sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }

}


