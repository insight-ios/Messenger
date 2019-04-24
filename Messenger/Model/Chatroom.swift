//
//  Chatroom.swift
//  Messenger
//
//  Created by SutieDev on 19/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import Foundation

enum ChatMemberType {
    case oneToOne
    case oneToTwo
    case oneToThree
    case oneToMulti
}

struct Chatroom {
    var membersIDs: [String]
    var chatroomID: Int?
    let memberType: ChatMemberType
    var messagesIDs: [String]?
    
    init(membersIDs: [String], chatroomID: Int?, messagesIDs: [String]?) {
        self.membersIDs = membersIDs
        if chatroomID != nil {
            self.chatroomID = chatroomID
        } else {
            self.chatroomID = ChatroomStorage.shared.createChatroomID()
        }
        self.messagesIDs = messagesIDs
        
        switch membersIDs.count - 1 {
        case 1:
            self.memberType = .oneToOne
        case 2:
            self.memberType = .oneToTwo
        case 3:
            self.memberType = .oneToThree
        default :
            self.memberType = .oneToMulti
        }
    }
    
    init?(dict: [String: Any], documentID: String, messagesIDs: [String]?) {
        guard
            let membersIDs = dict["membersIDs"] as? [String],
            let chatroomID = dict["chatroomID"] as? Int,
            let messagesIDs = dict["messagesIDs"] as? [String] else {
                return nil
        }
        self.init(membersIDs: membersIDs, chatroomID: chatroomID, messagesIDs: messagesIDs)
    }
    
    func toDictionary() -> [String: Any] {
        let dic: [String: Any] = [
            "membersIDs": membersIDs,
            "chatroomID": chatroomID,
            "messagesIDs": messagesIDs
        ]
        return dic
    }
    
    mutating func setChatroomID(id: Int) {
        self.chatroomID = id
    }
}
