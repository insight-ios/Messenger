//
//  OneToOneChatListCell.swift
//  Messenger
//
//  Created by SutieDev on 19/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import UIKit
import Foundation

class OneToOneChatListCell: UICollectionViewCell {
    
    @IBOutlet weak var friendProfileImageView: UIImageView!
    @IBOutlet weak var friendNicknameLabel: UILabel!
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
        friendProfileImageView.layer.cornerRadius = friendProfileImageView.frame.height * 0.48
    }
    
    func resetUI() {
        friendProfileImageView.image = nil
        friendNicknameLabel.text = ""
        lastMessageLabel.text = ""
        lastTalkedTimestampLabel.text = ""
    }
}

extension OneToOneChatListCell {
    func bind(memberID: String) {
        userStorage.searchProfile(of: memberID, completion: { user in
            self.friendNicknameLabel.text = user.nickname
            
            if let url = user.profileImageURL {
                DownloadUserImage.shared.userProfileImage(filePath: url, completion: { image in
                    self.friendProfileImageView.image = image
                })
            }
        })
    }
}
