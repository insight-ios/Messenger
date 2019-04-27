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
    static let myID = "0000"
    
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
    
    func searchProfiles(of usersIDs: [String], completion: @escaping ([User]) -> Void) {
        FetchAllUsersUsecase.shared.searchUsers(iDs: usersIDs, completion: { users in
            completion(users)
        })
    }
    
    func profileImages(path: String, completion: @escaping (UIImage) -> Void) {
        DownloadUserImage.shared.userProfileImage(filePath: path, completion: { profileImg in
            completion(profileImg)
        })
    }
}
