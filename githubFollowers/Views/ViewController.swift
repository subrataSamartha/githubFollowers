//
//  ViewController.swift
//  githubFollowers
//
//  Created by subrata Samartha on 08/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }

    @IBAction func callGetUserApi(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let userFollowersVC = storyBoard.instantiateViewController(withIdentifier: "userFollowersVC") as! UserFollowerViewController
//        userFollowersVC.viewModel.userNameInput = userNameTextInput.text!
        self.navigationController?.pushViewController(userFollowersVC, animated: true)

        
        
    }
    
}

