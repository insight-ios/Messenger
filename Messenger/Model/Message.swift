//
//  Message.swift
//  Messenger
//
//  Created by SutieDev on 19/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import Foundation
import UIKit

struct Message {
    var messageID: Int?
    let chatroomID: Int
    
    let fromUserID: String
    
    let contents: String?
    let images: [String]?
    var numOfUnRead: Int
    let timestamp: String
    
    
    init(messageID: Int, chatroomID: Int, fromUserID: String, contents: String?, images: [String]?, numOfUnRead: Int, timestamp: String) {
        self.messageID = messageID
        self.chatroomID = chatroomID
        self.fromUserID = fromUserID
        self.images = images
        self.contents = contents
        self.numOfUnRead = numOfUnRead
        self.timestamp = timestamp
    }
    
    init?(chatroomID: Int, fromUserID: String, contents: String?, images: [String]?) {
        self.messageID = MessageStorage.shared.createMessageID()
        self.chatroomID = chatroomID
        self.fromUserID = fromUserID
        self.contents = contents
        self.images = images
        
        let moment = Date()
        let formatter = DateFormatter()
        print("New Message --- time: \(formatter.string(from: moment))")
        self.timestamp = formatter.string(from: moment)

        self.numOfUnRead = ChatroomStorage.shared.members(of: chatroomID).count - 1
    }
    
    init?(dict: [String: Any]) {
        guard
            let chatroomID = dict["chatroomID"] as? Int,
            let fromUserID = dict["fromUserID"] as? String,
            let numOfUnRead = dict["numOfUnRead"] as? Int,
            let timestamp = dict["timestamp"] as? String else {
                return nil
        }
        
        let messageID = dict["messageID"] as? Int ?? 1000000
        let contents = dict["contents"] as? String ?? ""
        let images = dict["images"] as? [String] ?? []
        
        self.init(messageID: messageID, chatroomID: chatroomID, fromUserID: fromUserID,
                  contents: contents, images: images,
                  numOfUnRead: numOfUnRead, timestamp: timestamp)
    }
    
    func toDict() -> [String: Any] {
        let dic: [String: Any] = [
            "messageID": messageID,
            "chatroomID": chatroomID,
            "fromUserID": fromUserID,
            "contents": contents,
            "images": images,
            "timestamp": timestamp,
            "numOfUnRead": numOfUnRead
        ]
        return dic
    }
}
