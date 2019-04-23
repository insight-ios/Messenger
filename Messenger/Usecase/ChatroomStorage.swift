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
    
    func allChatrooms(completion: @escaping ([Chatroom]) -> Void) {
        FetchAllChatroomsUsecase.shared.execute(completion: { chatroomItems in
            print("chatroomItems -- > \(chatroomItems)")
            completion(chatroomItems)
        })
    }
    
}
