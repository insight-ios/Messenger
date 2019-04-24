//
//  ChatroomStorage.swift
//  Messenger
//
//  Created by SutieDev on 22/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import Foundation
import UIKit

class ChatroomStorage {
    static let shared = ChatroomStorage()
    var chatroomItems: [Chatroom]!
    
    func allChatrooms(completion: @escaping ([Chatroom]) -> Void) {
        FetchAllChatroomsUsecase.shared.execute(completion: { chatroomItems in
            print("*** ChatroomStorage     chatroomItems -- > \(chatroomItems)")
            self.chatroomItems = chatroomItems
            completion(chatroomItems)
        })
    }
    
    func createChatroomID() -> Int {
        print("chatroomItems.count = \(self.chatroomItems.count)")
        print("new chatroomID = \(self.chatroomItems.count + 1)")

        return self.chatroomItems.count + 1
    }
    
    func members(of chatroomID: Int) -> [String] {
        let chatroom = chatroomItems.filter { $0.chatroomID == chatroomID }.first!
        return chatroom.membersIDs
    }
}
