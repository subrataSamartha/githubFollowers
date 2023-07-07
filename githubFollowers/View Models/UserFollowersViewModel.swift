//"scotteg"
import Foundation

class UserFollowersViewModel {
    var followersList = Box(Array<GithubUser>())
    var userNameInput = ""
    
    init() {
        callAPIforFollowers()
    }
    
    func callAPIforFollowers() {
        NetworkManager.shared.getUserFollowers(userName: "scotteg",
                                               pageNumber: 1) { followersData, errorMessage in
            if let errorMessage = errorMessage {
                print(errorMessage)
                return
            }
            
                guard let followers = followersData else {
                print("no data")
                return
            }
            
            self.followersList.value = followers
            
            
        }
    }
}
