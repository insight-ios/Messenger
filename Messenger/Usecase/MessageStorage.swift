//
//  MessageStorage.swift
//  Messenger
//
//  Created by SutieDev on 24/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import Foundation
import UIKit

class MessageStorage {
    static let shared = MessageStorage()
    var messageItems: [Message]!
    
    func allMessages(chatroomID: String, completion: @escaping ([Message]) -> Void) {
        FetchMessageUsecase.shared.extractMessage(in: chatroomID, completion: { messages in
            self.messageItems = messages
            completion(messages)
        })
    }
    
    func createMessageID() -> String {
        print("\n last MessageID ---> \(messageItems.count)")
        print("new Message ID Created ---> \(messageItems.count + 1)")
        return String(messageItems.count + 1001)
    }
}
