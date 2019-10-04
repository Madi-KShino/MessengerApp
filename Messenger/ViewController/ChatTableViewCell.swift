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
        profilePicView.layer.cornerRadius = profilePicView.frame.width / 2
    }
    
    //Setup Cell Component Data
    func setData() {
        guard let message = message,
            let friend = message.friend,
            let profileImage = message.friend?.profileImage,
            let name = friend.name,
            let date = message.date
        else { return }
        let formattedDate = setDateText(date: date)
        profilePicView.image = UIImage(named: profileImage)
        nameLabel.text = "\(name)"
        messageLabel.text = message.text
        timeLabel.text = formattedDate
    }
    
    //Format Date based of time since message was recieved
    func setDateText(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let timeSinceRecieved = NSDate().timeIntervalSince(date)
        let secondsInDay: TimeInterval = 60 * 60 * 24
        if timeSinceRecieved > 7 * secondsInDay {
            dateFormatter.dateFormat = "MM/dd/yy"
        } else if timeSinceRecieved
         > secondsInDay {
            dateFormatter.dateFormat = "EEE"
        }
        return dateFormatter.string(from: date)
    }
}
