//
//  FriendImageChatBubbleCell.swift
//  Messenger
//
//  Created by SutieDev on 23/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import UIKit

class FriendImageChatBubbleCell: UITableViewCell {
    
    @IBOutlet weak var friendProfileImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var chatMessageImageView: UIImageView!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}
