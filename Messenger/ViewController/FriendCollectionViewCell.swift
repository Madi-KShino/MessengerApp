//
//  FriendCollectionViewCell.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 9/25/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    
    //Properties
    var friend: Friend? {
        didSet {
            setView()
            setData()
        }
    }
    
    //Outlets
    @IBOutlet weak var profilePicView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    //Set Cell Components
    func setView() {
        profilePicView.layer.cornerRadius = profilePicView.frame.height / 2
    }
    
    //Set Cell Data
    func setData() {
        guard let friend = friend else { return }
        profilePicView.image = UIImage(named: friend.profileImage)
        nameLabel.text = friend.name
    }
}
