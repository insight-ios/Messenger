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
        chatMessageLabel.text = "dsjdshkjshkjfhskhdjsk ahdsjalidsajlsjsjshd isajasjsjdsjdksjl asjdkljljsjsj hs18172893719797"
    }
}
