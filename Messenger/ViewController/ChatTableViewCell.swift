//
//  ChatTableViewCell.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 9/25/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    //Properties
    var message: Message? {
        didSet {
            updateView()
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
    
    //Setup Cell View
    func updateView() {
        guard let message = message else { return }
        profilePicView.image = UIImage(named:  message.friend.profileImage)
        nameLabel.text = "\(message.friend)"
        messageLabel.text = message.text
        timeLabel.text = "\(message.date)"
    }
}
