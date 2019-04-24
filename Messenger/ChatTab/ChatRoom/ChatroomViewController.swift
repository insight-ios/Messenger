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
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
    }
    
    @IBAction func popVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    static func create() -> ChatroomViewController {
        let sb = UIStoryboard(name: "ChatRoom", bundle: nil)
        return sb.instantiateViewController(withIdentifier: "ChatroomViewController") as! ChatroomViewController
    }
    
}

extension ChatroomViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let myTextBubbleCell = tableView.dequeueReusableCell(withIdentifier: "MyTextChatBubbleCell", for: indexPath) as! MyTextChatBubbleCell
            return myTextBubbleCell
        } else {
            if let friendTextBubbleCell = tableView.dequeueReusableCell(withIdentifier: "FriendTextChatBubbleCell", for: indexPath) as? FriendTextChatBubbleCell {
                return friendTextBubbleCell
            }
        }
        
        
//        if let myImageBubbleCell = tableView.dequeueReusableCell(withIdentifier: "MyImageChatBubbleCell", for: indexPath) as? MyImageChatBubbleCell {
//            return myImageBubbleCell
//        }
//
//        if let startChatTimestampCell = tableView.dequeueReusableCell(withIdentifier: "StartChatTimestampCell", for: indexPath) as? StartChatTimestampCell {
//            return startChatTimestampCell
//        }
//

//
//        if let friendImageBubbleCell = tableView.dequeueReusableCell(withIdentifier: "FriendImageChatBubbleCell", for: indexPath) as? FriendImageChatBubbleCell {
//            return friendImageBubbleCell
//        }
//
        return UITableViewCell()
    }
    
}
