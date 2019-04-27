//
//  OneToTwoChatListCell.swift
//  Messenger
//
//  Created by SutieDev on 19/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import UIKit

class OneToTwoChatListCell: UICollectionViewCell {
    
    @IBOutlet weak var friendProfileImageView01: UIImageView!
    @IBOutlet weak var friendProfileImageView02: UIImageView!
    
    @IBOutlet weak var chatRoomTitleLabel: UILabel!
    @IBOutlet weak var numOfPeopleLabel: UILabel!
    
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var lastTalkedTimestampLabel: UILabel!
    
    let userStorage: UserStorage = UserStorage.shared
    var chatroomItem: Chatroom!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        resetUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        friendProfileImageView01.layer.cornerRadius = friendProfileImageView01.frame.height * 0.48
        friendProfileImageView02.layer.cornerRadius = friendProfileImageView02.frame.height * 0.48
    }
    
    func resetUI() {
        chatroomItem = nil
        friendProfileImageView01.image = nil
        friendProfileImageView02.image = nil
        chatRoomTitleLabel.text = ""
        numOfPeopleLabel.text = ""
        lastMessageLabel.text = ""
        lastTalkedTimestampLabel.text = ""
    }
}

extension OneToTwoChatListCell {
    func bind(memberIDs: [String]) {
        numOfPeopleLabel.text = String(memberIDs.count)
        
        var chatroomTitle: String! {
            didSet {
                DispatchQueue.main.async {
                    self.chatRoomTitleLabel.text = chatroomTitle
                }
            }
        }
        
        userStorage.searchProfiles(of: memberIDs, completion: { friends in
            for i in 0 ..< friends.count {
                let profileImageURL = friends[i].profileImageURL
                
                DispatchQueue.main.async {
                    DownloadUserImage.shared.userProfileImage(filePath: profileImageURL!, completion: { image in
                        if self.friendProfileImageView01.image == nil {
                            self.friendProfileImageView01.image = image
                            chatroomTitle = friends[i].nickname + ", "
                        } else {
                            chatroomTitle.append(friends[i].nickname)
                            self.friendProfileImageView02.image = image
                        }
                    })
                }
            }
        })
    }
}
