//
//  Friends.swift
//  Messenger
//
//  Created by SutieDev on 17/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import Foundation
import Firebase

struct User {
    let userID: String
    var nickname: String
    var statusMessage: String?
    var profileImage: String?
    var profileBackgroundImage: String?
    var documentID: String?
    
    init(userID: String, nickname: String, statusMessage: String, profileImage: String?, profileBackgroundImage: String?) {
        self.userID = userID
        self.nickname = nickname
        self.statusMessage = statusMessage
        self.profileImage = profileImage
        self.profileBackgroundImage = profileBackgroundImage
    }
    
    init?(dict: [String: Any], documentID: String) {
        guard
            let userID = dict["id"] as? String,
            let nickname = dict["nickname"] as? String else {
                return nil
        }
        
        let statusMessage = dict["statusMessage"] as? String ?? ""
        let profileImage = dict["profileImage"] as? String ?? "defaultProfileImage"
        let profileBackgroundImage = dict["profileBackgroundImage"] as? String ?? "defaultProfileBackgroundImage"
        
        self.init(userID: userID, nickname: nickname, statusMessage: statusMessage, profileImage: profileImage, profileBackgroundImage: profileBackgroundImage)
    }
    
    func toDictionary() -> [String: Any] {
        let dict: [String: Any] = [
            "id": userID,
            "nickname": nickname,
            "statusMessage": statusMessage,
            "profileImage": profileImage,
            "profileBackgroundImage": profileBackgroundImage
        ]
        return dict
    }

    mutating func setDocumentID(_ id: String) {
        self.documentID = id
    }
}
