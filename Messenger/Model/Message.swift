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
    let timestamp: String
    let contents: String
    let image: [String]?
    let isRead: Bool
    let senderID: String
    let chatroomID: String
    
}
