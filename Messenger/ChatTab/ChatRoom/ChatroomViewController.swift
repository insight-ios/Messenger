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
    
    var chatRoom: Chatroom! {
        didSet {
            let chatroomID = self.chatRoom.chatroomID
            MessageStorage.shared.allMessages(chatroomID: chatroomID!, completion: { messages in
                self.messages = messages
            })
        }
    }
    
    var messages: [Message]? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
        guard let messages = messages else {
            return 0
        }
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let messages = self.messages {
            let eachMessage = messages[indexPath.row]
            
            // 내가 보낸 메세지
            if eachMessage.fromUserID == UserStorage.myID {
                // 1. 메세지가 텍스트라면
                if eachMessage.contents != nil {
                    if let myTextBubbleCell = tableView.dequeueReusableCell(withIdentifier: "MyTextChatBubbleCell", for: indexPath) as? MyTextChatBubbleCell {
                        myTextBubbleCell.contents = eachMessage.contents
                        myTextBubbleCell.timeStamp = eachMessage.timestamp.toDateString()
                        myTextBubbleCell.setMessage()
                        return myTextBubbleCell
                    }
                }
                
                // 2. 메세지가 이미지라면
                if eachMessage.images != nil {
                    if let myImageBubbleCell = tableView.dequeueReusableCell(withIdentifier: "MyImageChatBubbleCell", for: indexPath) as? MyImageChatBubbleCell {
                        return myImageBubbleCell
                    }
                }
                
            } else {    // 대화 상대가 보낸 경우
                // 1. 메세지가 텍스트라면
                if eachMessage.contents != nil {
                    let friendTextBubbleCell = tableView.dequeueReusableCell(withIdentifier: "FriendTextChatBubbleCell", for: indexPath) as! FriendTextChatBubbleCell
                    friendTextBubbleCell.message = eachMessage
                    return friendTextBubbleCell
                }
    
                // 2. 메세지가 이미지라면
                if eachMessage.images != nil {
                    if let friendImageBubbleCell = tableView.dequeueReusableCell(withIdentifier: "FriendImageChatBubbleCell", for: indexPath) as? FriendImageChatBubbleCell {
                        return friendImageBubbleCell
                    }
                }
                
            }
        }
        return UITableViewCell()

//        if let startChatTimestampCell = tableView.dequeueReusableCell(withIdentifier: "StartChatTimestampCell", for: indexPath) as? StartChatTimestampCell {
//            return startChatTimestampCell
//        }
    }
    
}
