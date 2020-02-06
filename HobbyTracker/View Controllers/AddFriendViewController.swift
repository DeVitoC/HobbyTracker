//
//  AddFriendViewController.swift
//  HobbyTracker
//
//  Created by Lambda_School_Loaner_259 on 2/5/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

protocol AddFriendDelegate {
    func friendWasCreated(_ friend: Friend)
}


// Delegator
// 1: Create a protocol with the delegate name
// 2: Create a delegate property of type [whatever your delegate name is]
// 3: When needed, call the delegate methodon the delegator

// Responsible for creating a friend object
class AddFriendViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hometownTextField: UITextField!
    @IBOutlet weak var hobby1tTextField: UITextField!
    @IBOutlet weak var hobby2TextField: UITextField!
    @IBOutlet weak var hobby3TextField: UITextField!
    
    // MARK: Properties
    
    var delegate: AddFriendDelegate?
    
    // MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, let homeTown = hometownTextField.text, !name.isEmpty,
            !homeTown.isEmpty else { return }
        
        var friend = Friend(name: name, hometown: homeTown, hobbies: [])
        
        if let hobby1 = hobby1tTextField.text, !hobby1.isEmpty {
            friend.hobbies.append(hobby1)
        }
        
        if let hobby2 = hobby1tTextField.text, !hobby2.isEmpty {
            friend.hobbies.append(hobby2)
        }
        
        if let hobby3 = hobby1tTextField.text, !hobby3.isEmpty {
            friend.hobbies.append(hobby3)
        }
        
        delegate?.friendWasCreated(friend)
        self.dismiss(animated: true)
    }
        
        
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
