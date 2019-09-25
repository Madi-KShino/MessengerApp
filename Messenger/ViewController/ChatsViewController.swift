//
//  ChatsViewController.swift
//  Messenger
//
//  Created by Madison Kaori Shino on 9/25/19.
//  Copyright © 2019 Madi S. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {

    //Outlets
    @IBOutlet weak var userIconImage: UIImageView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var searchChatsSearchBar: UISearchBar!
    @IBOutlet weak var friendsCollectionView: UICollectionView!
    @IBOutlet weak var chatsTableView: UITableViewCell!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView() {
        cameraButton.layer.cornerRadius = cameraButton.frame.height / 2
        composeButton.layer.cornerRadius = composeButton.frame.height / 2
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
