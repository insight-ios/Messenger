//
//  ChatListViewController.swift
//  Messenger
//
//  Created by SutieDev on 18/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import UIKit
import Firebase

class ChatListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var chatrooms: [Chatroom]? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChatroomStorage.shared.allChatrooms(completion: { chatroomItems in 
            self.chatrooms = chatroomItems
        })
    }

    static func create() -> ChatListViewController {
        let sb = UIStoryboard(name: "ChatList", bundle: nil)
        return sb.instantiateViewController(withIdentifier: "ChatListVC") as! ChatListViewController
    }

}

extension ChatListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let chatrooms = chatrooms else {
            return 0
        }
        return chatrooms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let chatroom = chatrooms?[indexPath.item] {
            switch chatroom.memberType {
            case .oneToOne:
                if let oneToOneCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OneToOneChatListCell", for: indexPath) as? OneToOneChatListCell {
                    oneToOneCell.chatroomItem = chatroom
                    oneToOneCell.bind(memberID: chatroom.membersIDs[1])
                    return oneToOneCell
                }
                
            case .oneToTwo:
                if let oneToTwoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OneToTwoChatListCell", for: indexPath) as? OneToTwoChatListCell {
                    return oneToTwoCell
                }
                
            case .oneToThree:
                if let oneToThreeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OneToThreeChatListCell", for: indexPath) as? OneToThreeChatListCell {
                    return oneToThreeCell
                }
                
            case .oneToMulti:
                if let multiChatCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MultiChatListCell", for: indexPath) as? MultiChatListCell {
                    return multiChatCell
                }
            }
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let chatroom = chatrooms?[indexPath.item] {
            let chatroomVC = ChatroomViewController.create()
            chatroomVC.chatRoom = chatroom
            self.navigationController?.pushViewController(chatroomVC, animated: true)
        }
        
    }
}

extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 60)
    }
}
