//
//  ChatTableViewCell.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 9/25/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit
import CoreData

class ChatTableViewCell: UITableViewCell {

    //Properties
    var message: Message? {
        didSet {
            setView()
            setData()
        }
    }
    
    //Outlets
    @IBOutlet weak var profilePicView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    //Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //Set Cell View / Style Components
    func setView() {
        profilePicView.layer.cornerRadius = profilePicView.frame.height / 2
        profilePicView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        profilePicView.layer.borderWidth = 4
    }
    
    //Setup Cell Component Data
    func setData() {
        guard let message = message,
            let friend = message.friend,
            let profileImage = message.friend?.profileImage,
            let name = friend.name,
            let date = message.date
        else { return }
        profilePicView.image = UIImage(named: profileImage)
        nameLabel.text = "\(name)"
        messageLabel.text = message.text
        timeLabel.text = date.prettyDate()
    }
}
