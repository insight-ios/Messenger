//
//  MyTextChatBubbleCell.swift
//  Messenger
//
//  Created by SutieDev on 23/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import UIKit

class MyTextChatBubbleCell: UITableViewCell {
    
    @IBOutlet weak var chatBubbleImage: UIImageView!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        contentsLabel.text = ""
        timeStampLabel.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let bubbleImage = UIImage(named: "myChatBubble")?.resizableImage(withCapInsets: UIEdgeInsets(top: 1.0, left: 1.8, bottom: 1.0, right: 1.0), resizingMode: .stretch)
        chatBubbleImage.image = bubbleImage
    }
}
