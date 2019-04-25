//
//  FiriendsListViewController.swift
//  Messenger
//
//  Created by SutieDev on 18/04/2019.
//  Copyright © 2019 insightCell. All rights reserved.
//

import UIKit

class FriendsListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var users: [User]? {
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserStorage.shared.allUsers(completion: { userItems in
            self.users = userItems
        })
    }
    
    static func create() -> FriendsListViewController {
        let sb = UIStoryboard(name: "FriendsList", bundle: nil)
        return sb.instantiateViewController(withIdentifier: "FriendsListVC") as! FriendsListViewController
    }
    
}

extension FriendsListViewController:  UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let _ = users else {
            return 0
        }
        
        return 1
        
       
//       if (section == 0) { return 1 }
//
//        else if (section == 1) { return 1 }
//
//        else {
//            guard let users = users else {
//                return 0
//            }
//            return users.count
//        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let user = users?[indexPath.item]{
//            if(indexPath.section == 0){
                 let userListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserListCell", for: indexPath) as! UserListCell
                    userListCell.userItem = user
                    userListCell.bind(memberID: "0000")
                    return userListCell
//               }
        }
        return UICollectionViewCell()
    }
}
