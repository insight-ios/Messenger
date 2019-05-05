//
//  FetchMessageUsecase.swift
//  Messenger
//
//  Created by SutieDev on 24/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import Foundation
import FirebaseFirestore

class FetchMessageUsecase {
    enum Errors {
        case messageNotExistError
        case queryFailedError
    }
    
    private let collectionKey = "messages"
    static let shared = FetchMessageUsecase()
    
    func extractMessage(in chatroomID: String , completion: @escaping ([Message]) -> Void ) {
        let database = Firestore.firestore()
        database.collection(collectionKey)
            .whereField("chatroomID", isEqualTo: chatroomID)
            .getDocuments { querySnapshot, error in
                if let error = error {
                    print(error)
                    return
                }
                
                guard let querySnapshot = querySnapshot else {
                    print(Errors.queryFailedError)
                    return
                }
                
                let messages = querySnapshot.documents.map { ($0.data(), $0.documentID) }
                    .compactMap { document, documentID -> Message? in
                        let message = Message(dict: document, documentID: documentID)
                        return message
                    }
                completion(messages)
        }
    }
    
}
