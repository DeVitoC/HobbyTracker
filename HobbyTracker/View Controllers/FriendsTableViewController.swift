//
//  FriendsTableViewController.swift
//  HobbyTracker
//
//  Created by Lambda_School_Loaner_259 on 1/30/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class FriendsTableViewController: UIViewController, UITableViewDelegate {
    
    // MARK: IBOutlet
    @IBOutlet var tableView: UITableView!
    
    // MARK: Properties
    var friends: [Friend] = [Friend(name: "Johnny", hometown: "Provo Utah", hobbies: ["Golf", "Coding"])]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }


}

extension FriendsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
        
        let friend = friends[indexPath.row]
        cell.friend = friend
        return cell
    }
    // 2:
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddFriendSegue" {
            let addFriendVC = segue.destination as! AddFriendViewController
            
            addFriendVC.delegate = self
        }
    }
}

// Delegate
// 1: Adopt and conform to delegate/protocol
// 2: Set self as delegate when delegator is created


// 1:
extension FriendsTableViewController: AddFriendDelegate {
    func friendWasCreated(_ friend: Friend) {
        friends.append(friend)
        tableView.reloadData()
    }
}

