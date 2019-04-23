//
//  Friends.swift
//  Messenger
//
//  Created by SutieDev on 17/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import Foundation

struct User {
    let userID: String
    var nickname: String
    var statusMessage: String?
    var profileImageURL: String?
    var profileBackgroundImageURL: String?
    var documentID: String?
    
    init(userID: String, nickname: String, statusMessage: String, profileImageURL: String?, profileBackgroundImageURL: String?) {
        self.userID = userID
        self.nickname = nickname
        self.statusMessage = statusMessage
        
        if let `profileImageURL` = profileImageURL {
            self.profileImageURL = profileImageURL
        }
        
        if let `profileBackgroundImageURL` = profileBackgroundImageURL {
            self.profileBackgroundImageURL = profileBackgroundImageURL
        }
    }
    
    init?(dict: [String: Any], documentID: String) {
        guard
            let userID = dict["id"] as? String,
            let nickname = dict["nickname"] as? String else {
                return nil
        }
        
        let statusMessage = dict["statusMessage"] as? String ?? ""
        let profileImage = dict["profileImage"] as? String ?? "defaultProfileImage.jpg"
        let profileBackgroundImage = dict["profileBackgroundImage"] as? String ?? "defaultProfileBackgroundImage.png"
        
        self.init(userID: userID, nickname: nickname, statusMessage: statusMessage, profileImageURL: profileImage, profileBackgroundImageURL: profileBackgroundImage)
    }
    
    func toDictionary() -> [String: Any] {
        let dict: [String: Any] = [
            "id": userID,
            "nickname": nickname,
            "statusMessage": statusMessage,
            "profileImage": profileImageURL,
            "profileBackgroundImage": profileBackgroundImageURL
        ]
        return dict
    }

    mutating func setDocumentID(_ id: String) {
        self.documentID = id
    }
}
