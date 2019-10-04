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
            setCellData()
            setViewComponents()
        }
    }
    
    //Outlets
    @IBOutlet weak var textLabel: UILabel!
    
    func setViewComponents() {
        textLabel.backgroundColor = UIColor.clear
        textLabel.textColor = .white
        self.backgroundColor = UIColor.gray
    }
    
    func setCellData() {
        if let message = message {
            textLabel.text = message.text
        }
    }
}
