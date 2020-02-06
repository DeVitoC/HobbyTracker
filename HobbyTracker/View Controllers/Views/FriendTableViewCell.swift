//
//  FriendTableViewCell.swift
//  HobbyTracker
//
//  Created by Lambda_School_Loaner_259 on 2/5/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class FriendTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var hometownLabel: UILabel!
    @IBOutlet var hobbyCountLabel: UILabel!
    
    var friend: Friend? {
        didSet {
            self.updateViews()
        }
    }
    
    private func updateViews() {
        guard let friend = friend else { return }
        
        nameLabel.text = friend.name
        hometownLabel.text = friend.hometown
        hobbyCountLabel.text = "\(friend.hobbies.count) hobbies"
    }

}
