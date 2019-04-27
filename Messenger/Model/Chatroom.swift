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
    var chatroomID: String?
    var memberType: ChatMemberType {
        switch membersIDs.count - 1 {
        case 1:
            return .oneToOne
        case 2:
            return .oneToTwo
        case 3:
            return .oneToThree
        default :
            return .oneToMulti
        }
    }
    var messagesIDs: [String]?
    
    init(membersIDs: [String], chatroomID: String?, messagesIDs: [String]?) {
        self.membersIDs = membersIDs
        if chatroomID != nil {
            self.chatroomID = chatroomID
        } else {
            self.chatroomID = ChatroomStorage.shared.createChatroomID()
        }
        self.messagesIDs = messagesIDs
    }
    
    init?(dict: [String: Any], documentID: String) {
        guard
            let membersIDs = dict["membersIDs"] as? [String],
            let messagesIDs = dict["messagesIDs"] as? [String] else {
                return nil
        }
        self.init(membersIDs: membersIDs, chatroomID: documentID, messagesIDs: messagesIDs)
    }
    
    func toDictionary() -> [String: Any] {
        let dic: [String: Any] = [
            "membersIDs": membersIDs,
            "messagesIDs": messagesIDs
        ]
        return dic
    }
    
    mutating func setChatroomID(id: String) {
        self.chatroomID = id
    }
}
