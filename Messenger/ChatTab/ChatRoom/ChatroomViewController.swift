//
//  ChatroomViewController.swift
//  Messenger
//
//  Created by SutieDev on 23/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import UIKit

class ChatroomViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: collectionView.bounds.width, height: 40)
        }
    }
    
    @IBAction func popVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    static func create() -> ChatroomViewController {
        let sb = UIStoryboard(name: "ChatRoom", bundle: nil)
        return sb.instantiateViewController(withIdentifier: "ChatroomViewController") as! ChatroomViewController
    }
    
}

extension ChatroomViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myTextBubbleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyTextChatBubbleCell", for: indexPath) as! MyTextChatBubbleCell
        return myTextBubbleCell
        
        
//        if let myImageBubbleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyImageChatBubbleCell", for: indexPath) as? MyImageChatBubbleCell {
//            return myImageBubbleCell
//        }
//
//        if let startChatTimestampCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StartChatTimestampCell", for: indexPath) as? StartChatTimestampCell {
//            return startChatTimestampCell
//        }
//
//        if let friendTextBubbleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendTextChatBubbleCell", for: indexPath) as? FriendTextChatBubbleCell {
//            return friendTextBubbleCell
//        }
//
//        if let friendImageBubbleCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendImageChatBubbleCell", for: indexPath) as? FriendImageChatBubbleCell {
//            return friendImageBubbleCell
//        }
//
//        return UICollectionViewCell()
    }
    
}
