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
    var messageID: String?
    let chatroomID: String
    
    let fromUserID: String
    
    let contents: String?
    let images: [String]?
    var numOfUnRead: Int
    var timestamp: Double
    
    
    init(messageID: String, chatroomID: String, fromUserID: String, contents: String?, images: [String]?, numOfUnRead: Int, timestamp: Double) {
        self.messageID = messageID
        self.chatroomID = chatroomID
        self.fromUserID = fromUserID
        self.images = images
        self.contents = contents
        self.numOfUnRead = numOfUnRead
        self.timestamp = timestamp
    }
    
    init?(chatroomID: String, fromUserID: String, contents: String?, images: [String]?) {
        self.messageID = MessageStorage.shared.createMessageID()
        self.chatroomID = chatroomID
        self.fromUserID = fromUserID
        self.contents = contents
        self.images = images
        
        let moment = Date()
        let formatter = DateFormatter()
        print("New Message --- time: \(formatter.string(from: moment))")
        let timeInterval = moment.timeIntervalSince1970
        self.timestamp = Double(timeInterval)
       
        /* Sutie - 안읽음 개수 처리를 어떻게 핸들링할지 고민..  */
        self.numOfUnRead = 0
        self.setNumOfUnRead(num: nil)
    }
    
    init?(dict: [String: Any], documentID: String) {
        guard
            let chatroomID = dict["chatroomID"] as? String,
            let fromUserID = dict["fromUserID"] as? String,
            let numOfUnRead = dict["numOfUnRead"] as? Int,
            let timestamp = dict["timestamp"] as? Double else {
                return nil
        }
        
        let contents = dict["contents"] as? String ?? ""
        let images = dict["images"] as? [String] ?? []
        
        self.init(messageID: documentID, chatroomID: chatroomID, fromUserID: fromUserID,
                  contents: contents, images: images,
                  numOfUnRead: numOfUnRead, timestamp: timestamp)
    }
    
    func toDict() -> [String: Any] {
        let dic: [String: Any] = [
            "chatroomID": chatroomID,
            "fromUserID": fromUserID,
            "contents": contents,
            "images": images,
            "timestamp": timestamp,
            "numOfUnRead": numOfUnRead
        ]
        return dic
    }
    
    mutating func setNumOfUnRead(num: Int?) {
        if let `num` = num {
            self.numOfUnRead = num
        } else {
            var totalNum: Int?
            ChatroomStorage.shared.members(of: chatroomID, completion: { membersIDs in
                totalNum = membersIDs.count
            })
            self.numOfUnRead = totalNum!
        }
    }
}
