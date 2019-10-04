//
//  ChatLogCollectionViewCell.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 10/3/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit

class ChatLogCollectionViewCell: UICollectionViewCell {
    
    //Properties
    var message: Message? {
        didSet {
            setViews()        }
    }
    
    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.text = "TESTING TESTING TESTING TESTING TESTING TESTING"
        textView.textColor = UIColor.white
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    func setViews() {
        backgroundColor = UIColor.lightGray
        addSubview(messageTextView)
        if let message = message {
            messageTextView.text = message.text
        }
    }
}
