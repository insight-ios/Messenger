//
//  OneToThreeChatListCell.swift
//  Messenger
//
//  Created by SutieDev on 19/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import UIKit

class OneToThreeChatListCell: UICollectionViewCell {
    @IBOutlet weak var friendProfileImageView01: UIImageView!
    @IBOutlet weak var friendProfileImageView02: UIImageView!
    @IBOutlet weak var friendProfileImageView03: UIImageView!
    
    @IBOutlet weak var chatroomTitleLabel: UILabel!
    @IBOutlet weak var numOfPeopleLabel: UILabel!
    
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var lastTalkedTimestampLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        resetUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        friendProfileImageView01.layer.cornerRadius = friendProfileImageView01.frame.height * 0.48
        friendProfileImageView02.layer.cornerRadius = friendProfileImageView02.frame.height * 0.48
        friendProfileImageView03.layer.cornerRadius = friendProfileImageView03.frame.height * 0.48
    }
    
    func resetUI() {
        friendProfileImageView01.image = nil
        friendProfileImageView02.image = nil
        friendProfileImageView03.image = nil
        
        chatroomTitleLabel.text = ""
        numOfPeopleLabel.text = ""
        lastMessageLabel.text = ""
        lastTalkedTimestampLabel.text = ""
    }
    
}
