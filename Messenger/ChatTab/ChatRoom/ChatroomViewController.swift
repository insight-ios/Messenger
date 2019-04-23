//
//  ChatroomViewController.swift
//  Messenger
//
//  Created by SutieDev on 23/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import UIKit

class ChatroomViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func popVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    static func create() -> ChatroomViewController {
        let sb = UIStoryboard(name: "ChatRoom", bundle: nil)
        return sb.instantiateViewController(withIdentifier: "ChatroomViewController") as! ChatroomViewController
    }
    
}

extension ChatroomViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myTextBubbleCell = tableView.dequeueReusableCell(withIdentifier: "MyTextChatBubbleCell", for: indexPath) as! MyTextChatBubbleCell
        return myTextBubbleCell
        
        
//        if let myImageBubbleCell = tableView.dequeueReusableCell(withReuseIdentifier: "MyImageChatBubbleCell", for: indexPath) as? MyImageChatBubbleCell {
//            return myImageBubbleCell
//        }
//
//        if let startChatTimestampCell = tableView.dequeueReusableCell(withReuseIdentifier: "StartChatTimestampCell", for: indexPath) as? StartChatTimestampCell {
//            return startChatTimestampCell
//        }
//
//        if let friendTextBubbleCell = tableView.dequeueReusableCell(withReuseIdentifier: "FriendTextChatBubbleCell", for: indexPath) as? FriendTextChatBubbleCell {
//            return friendTextBubbleCell
//        }
//
//        if let friendImageBubbleCell = tableView.dequeueReusableCell(withReuseIdentifier: "FriendImageChatBubbleCell", for: indexPath) as? FriendImageChatBubbleCell {
//            return friendImageBubbleCell
//        }
//
//        return UITableViewCell()
    }
    
}
