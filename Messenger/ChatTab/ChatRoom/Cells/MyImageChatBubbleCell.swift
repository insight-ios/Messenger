//
//  MyImageChatBubbleCell.swift
//  Messenger
//
//  Created by SutieDev on 23/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import UIKit

class MyImageChatBubbleCell: UITableViewCell {
    
    @IBOutlet weak var chatMessageImageView: UIImageView!
    @IBOutlet weak var lastTalkedTimestampLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        chatMessageImageView.image = nil
        lastTalkedTimestampLabel.text = ""
    }
}
