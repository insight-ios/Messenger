//
//  FetchAllChatroomsUsecase.swift
//  Messenger
//
//  Created by SutieDev on 19/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import Foundation
import FirebaseFirestore

class FetchAllChatroomsUsecase {
    enum Errors: Error {
        case chatroomsNotExistError
        case queryFailedError
    }
    
    private let collectionKey = "chatrooms"
    static let shared = FetchAllChatroomsUsecase()
    
    
    func execute(completion: @escaping ([Chatroom]) -> Void) {
        var chatrooms: [Chatroom] = []
        
        Firestore.firestore().collection(collectionKey)
            .getDocuments { querySnapshot, error in
                if let error = error {
                    print(error)
                    return
                }
                guard let querySnapshot = querySnapshot else {
                    print(Errors.queryFailedError)
                    return
                }
                chatrooms = querySnapshot.documents
                    .map { ($0.data(), $0.documentID) }
                    .compactMap { document, id -> Chatroom? in
                        let chatroom = Chatroom(dict: document, documentID: id)
                        print("************ FetchAllChatroomUsecase documentID = \(id) *********")
                        return chatroom
                }
            completion(chatrooms)
        }
    }
    
    
    func membersIDs(of chatroomID: String, completion: @escaping ([String]) -> Void) {
        var iDs: [String] = []
        Firestore.firestore().collection(collectionKey)
            .document(chatroomID).getDocument(completion: { querySnapshot, error in
                if let error = error {
                    print(error)
                    return
                }
                
                guard let querySnapshot = querySnapshot else {
                    print(Errors.queryFailedError)
                    return
                }
                
                iDs = querySnapshot.get("membersIDs") as? [String] ?? []
                print("----- members IDs   ----->    \(iDs)-----")
                completion(iDs)
            })
    }
}

