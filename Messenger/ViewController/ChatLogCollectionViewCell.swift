//
//  ChatLogCollectionViewCell.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 10/3/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit

class ChatLogCollectionViewCell: UICollectionViewCell {
    
    //Cell Properties
    var message: Message? {
        didSet {
            addSubview(textBubbleView)
            addSubview(messageTextView)
            addSubview(profileImageView)
            addConstraints(format: "H:|-5-[v0(30)]", views: profileImageView)
            addConstraints(format: "V:|[v0(30)]", views: profileImageView)
            
        }
    }
    
    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.text = "TESTING TESTING TESTING TESTING TESTING TESTING"
        textView.backgroundColor = UIColor.clear
        return textView
    }()
    
    let textBubbleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        return view
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        return imageView
    }()

}
