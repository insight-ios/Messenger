//
//  FetchUserImages.swift
//  Messenger
//
//  Created by SutieDev on 22/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import Foundation
import FirebaseStorage

class DownloadUserImage {
    static let shared = DownloadUserImage()
    private let pathKey = "profileImages"
    
    func userProfileImage(filePath: String, completion: @escaping (UIImage) -> Void) {
        let storage = Storage.storage()
        
        // Create a storage reference from our storage service
        let reference = storage.reference()
        let imagURL = pathKey + "/" + filePath
        let profileImageRef = reference.child(imagURL)
        var profileImage: UIImage!
        
        profileImageRef.getData(maxSize: 1 * 1024 * 1024, completion: { data, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                profileImage = UIImage(data: data)!
                completion(profileImage)
            }
        })
    }
}
