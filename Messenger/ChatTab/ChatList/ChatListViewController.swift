//
//  ChatListViewController.swift
//  Messenger
//
//  Created by SutieDev on 18/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import UIKit
import Firebase

struct Message {
    let date: String
    let contents: String
    let image: [String]?
    let isRead: Bool
    let senderID: String
    
}

class ChatListViewController: UIViewController {

    var allUsers: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func fetchFriends(_ sender: Any) {
        FetchAllUsersUsecase.shared.execute(completion: { users in
            self.allUsers = users
            print(self.allUsers)
        })
        
    }
    
    static func create() -> ChatListViewController {
        let sb = UIStoryboard(name: "ChatList", bundle: nil)
        return sb.instantiateViewController(withIdentifier: "ChatListVC") as! ChatListViewController
    }

}

private extension ChatListViewController {
    
}
