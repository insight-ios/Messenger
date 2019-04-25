//
//  FetchAllUsersUsecase.swift
//  Messenger
//
//  Created by SutieDev on 18/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import Foundation
import FirebaseFirestore

class FetchAllUsersUsecase {
    enum Errors: Error {
        case userNotExistError
        case queryFailedError
    }
   
    static let shared = FetchAllUsersUsecase()
    private let collectionKey = "users"
    
    func execute(completion: @escaping ([User]) -> Void ) {
        let database = Firestore.firestore()
        var users: [User] = []
        
        database.collection(collectionKey).getDocuments { querySnapshot, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let querySnapshot = querySnapshot else {
                print(Errors.queryFailedError)
                return
            }
            
            users = querySnapshot.documents
                .map { ($0.data(), $0.documentID) }
                .compactMap { document, id -> User? in
                    let user = User(dict: document, documentID: id)
                    return user
            }
            
            completion(users)
        }
    }
    
    func searchUser(id: String, completion: @escaping (User) -> Void) {
        let database = Firestore.firestore()
        var user: User!
        
        database.collection(collectionKey).document(id)
            .getDocument { querySnapshot, error in
                if let error = error {
                    print(error)
                    return
                }
                
                guard let querySnapshot = querySnapshot else {
                    print(Errors.queryFailedError)
                    return
                }
                
                user = User(dict: querySnapshot.data()!, documentID: id)
            completion(user)
        }
    }
    
    func searchUsers(iDs: [String], completion: @escaping ([User]) -> Void) {
        let database = Firestore.firestore()
        var users: [User]!

        iDs.forEach { database.collection(collectionKey).whereField("id", isEqualTo: $0)
            .getDocuments(completion: { querySnapshot, error in
                if let error = error {
                    print(error)
                    return
                }

                guard let querySnapshot = querySnapshot else {
                    print(Errors.queryFailedError)
                    return
                }

                querySnapshot.documents
                    .map { ($0.data(), $0.documentID) }
                    .compactMap { document, documentID in
                        let user = User(dict: document, documentID: documentID)!
                        users.append(user)
                }
            })
        }
    }
}
