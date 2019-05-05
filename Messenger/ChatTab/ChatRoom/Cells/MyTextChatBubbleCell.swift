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
    
    var contents: String!
    var timeStamp: String!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        contentsLabel.text = ""
        timeStampLabel.text = ""
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        chatBubbleView.layer.cornerRadius = 8
    }
    
    func setMessage() {
        contentsLabel.text = contents
        timeStampLabel.text = timeStamp
    }
}
