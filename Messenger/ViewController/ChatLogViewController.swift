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
     let cell = ChatLogCollectionViewCell()
    
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

//Collection View Data Source
extension ChatLogViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = messages?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let messages = messages,
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? ChatLogCollectionViewCell else { return UICollectionViewCell() }
        if let messageText = messages[indexPath.row].text {
            let size: CGSize = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: messageText).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], context: nil)
            cell.messageTextView.frame = CGRect(x: 0, y: 0, width: 250 + 15, height: estimatedFrame.height + 20)
        }
        cell.message = messages[indexPath.row]
        cell.messageTextView.text = messages[indexPath.row].text
        
        return cell
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let messageText = messages?[indexPath.row].text {
            let size: CGSize = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: messageText).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], context: nil)
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 20)
        }
        return CGSize(width: view.frame.width, height: 100)
    }

}


