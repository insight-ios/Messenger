//
//  MyTextChatBubbleCell.swift
//  Messenger
//
//  Created by SutieDev on 23/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import UIKit

class MyTextChatBubbleCell: UITableViewCell {
    
    @IBOutlet weak var chatBubbleView: UIView!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        contentsLabel.text = ""
        timeStampLabel.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        chatBubbleView.layer.cornerRadius = 8
        contentsLabel.text = "얄루얄루얄라셩얄라리얄라....edkjfkjkkddkskdjlsjldkjfakjdlfsk djfksjdksjfks skjdkflj()dfkjslkd"
    }

}
