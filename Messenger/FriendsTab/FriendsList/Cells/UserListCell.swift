//
//  DefaultUserListCell.swift
//  Messenger
//
//  Created by hongjuyeon_dev on 23/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import UIKit
import Foundation

class UserListCell: UICollectionViewCell {
    
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userNickNameLabel: UILabel!
    
    let userStorage: UserStorage = UserStorage.shared
    
    var userItem: User!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        resetUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func resetUI(){
        userProfileImageView.image = nil
        userNickNameLabel.text = ""
    }
}

extension UserListCell{
    func bind(memberID: String){
        userStorage.searchProfile(of: memberID, completion: { user in
            self.userNickNameLabel.text = user.nickname
            
            DownloadUserImage.shared.userProfileImage(filePath: user.profileImageURL!, completion: { image in
                self.userProfileImageView.image = image
            })
        })
    }
}
