//
//  userModel.swift
//  githubFollowers
//
//  Created by subrata Samartha on 08/05/23.
//

import Foundation

struct GithubUser: Codable {
    var login: String
    var avatarUrl: String
    var url: String
    var reposUrl: String
    var type: String
}
