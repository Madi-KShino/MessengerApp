//
//  Friend.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 9/25/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import Foundation

class Friend: NSObject {
    
    var name: String
    var profileImage: String
    
    init(name: String, profileImage: String) {
        self.name = name
        self.profileImage = profileImage
    }
}
