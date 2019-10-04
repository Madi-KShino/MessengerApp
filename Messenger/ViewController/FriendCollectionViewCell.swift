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
        profilePicView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        profilePicView.layer.borderWidth = 4
    }
    
    //Set Cell Data
    func setData() {
        guard let friend = friend,
            let profileImage = friend.profileImage
        else { return }
        profilePicView.image = UIImage(named: profileImage)
        nameLabel.text = friend.name
    }
}
