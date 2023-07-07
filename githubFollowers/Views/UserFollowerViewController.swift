//
//  UserFollowerViewController.swift
//  githubFollowers
//
//  Created by subrata Samartha on 10/05/23.
//

import UIKit
import SDWebImage

class UserFollowerViewController: UIViewController {
    @IBOutlet weak var userFollowerCollectionView: UICollectionView!
    
    var followers:[GithubUser] = []
    var filteredFollowers:[GithubUser] = []
    var viewModel = UserFollowersViewModel()
    var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userFollowerCollectionView.dataSource = self
        userFollowerCollectionView.delegate = self
        searchController.searchResultsUpdater = self

        // Do any additional setup after loading the view.
//        title = "Followers"
        navigationItem.title = "Followers"
        navigationItem.searchController = searchController
        
        
        viewModel.followersList.bind{ followers in
            self.followers = followers
            self.filteredFollowers = followers
        }
        
        
        
        
    }

}

extension UserFollowerViewController: UICollectionViewDelegate {}
extension UserFollowerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredFollowers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let followerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "followerCell", for: indexPath) as! FollowersCollectionViewCell
        followerCell.followerNameLabel.text = filteredFollowers[indexPath.row].login
        
//        let imageUrl = URL(string: "https://example.com/image.jpg")
//        yourImageView.sd_setImage(with: imageUrl, completed: nil)
        let imageUrl = URL(string: filteredFollowers[indexPath.row].avatarUrl)
        followerCell.followerImageView.sd_setImage(with: imageUrl, completed: nil)
        return followerCell
    }
    
    
}
extension UserFollowerViewController:UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }

        if(searchText.isEmpty) {
            filteredFollowers = followers
        } else {
            filteredFollowers = followers.filter{ $0.login.contains(searchText.lowercased())}
        }
        userFollowerCollectionView.reloadData()
    }

    
    
}
