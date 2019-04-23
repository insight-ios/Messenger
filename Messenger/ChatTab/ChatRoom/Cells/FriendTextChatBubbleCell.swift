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
    @IBOutlet weak var lastTalkedTimestampLabel: UILabel!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        friendProfileImageView.image = nil
        nickNameLabel.text = ""
        chatMessageLabel.text = ""
        lastTalkedTimestampLabel.text = ""
    }
}
