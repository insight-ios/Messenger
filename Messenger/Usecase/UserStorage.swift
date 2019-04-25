//
//  UserStorage.swift
//  Messenger
//
//  Created by SutieDev on 22/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import Foundation
import UIKit

class UserStorage {
    
    static let shared = UserStorage()
    
    func allUsers(completion: @escaping ([User]) -> Void) {
        FetchAllUsersUsecase.shared.execute(completion: { users in
            completion(users)
        })
    }
    
    func searchProfile(of userID: String, completion: @escaping (User) -> Void) {
        FetchAllUsersUsecase.shared.searchUser(id: userID, completion: { user in
            completion(user)
        })
    }
    
//    func searchProfile(of usersIDs: [String], completion: @escaping ([User]) -> Void) {
//        var users: [User] = []
//
//        for i in 0..<usersIDs.count {
//            searc
//            FetchAllUsersUsecase.shared.searchUser(id: usersIDs[i], completion: { user in
//                users.append(user)
//            })
//            completion(users)
//        }
//    }
    
    func profileImages(path: String, completion: @escaping (UIImage) -> Void) {
        DownloadUserImage.shared.userProfileImage(filePath: path, completion: { profileImg in
            completion(profileImg)
        })
    }
}
