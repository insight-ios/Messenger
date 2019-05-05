//
//  FriendTextBubbleCell.swift
//  Messenger
//
//  Created by SutieDev on 23/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import UIKit

class FriendTextChatBubbleCell: UITableViewCell {
    
    @IBOutlet weak var friendProfileImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var chatMessageLabel: UILabel!
    @IBOutlet weak var chatBubbleView: UIView!
    @IBOutlet weak var lastTalkedTimestampLabel: UILabel!
    
    let userStorage: UserStorage = UserStorage.shared
    var message: Message! {
        didSet {
            bind(memberID: self.message.fromUserID)
            setMessage()
        }
    }
    var profileImage: UIImage!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        friendProfileImageView.image = nil
        nickNameLabel.text = ""
        chatMessageLabel.text = ""
        lastTalkedTimestampLabel.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        friendProfileImageView.layer.cornerRadius = friendProfileImageView.frame.height * 0.48
        chatBubbleView.layer.cornerRadius = 8
    }
}

private extension FriendTextChatBubbleCell {
    func setMessage() {
        chatMessageLabel.text = message.contents
        lastTalkedTimestampLabel.text = message.timestamp.toDateString()
    }
    
    func bind(memberID: String) {
        userStorage.searchProfile(of: memberID, completion: { user in
            self.nickNameLabel.text = user.nickname
            
            if let url = user.profileImageURL {
                DownloadUserImage.shared.userProfileImage(filePath: url, completion: { image in
                    self.friendProfileImageView.image = image
                })
            }
        })
    }
}
