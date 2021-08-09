//
//  GitHubUser.swift
//  GitHubUserAPI
//
//  Created by David Kuo on 2021/8/7.
//

import Foundation

struct GitHubUser: Codable {
    let id: Int
    let login: String
    let avatar_url: String
    let type: String
}

struct GitHubUserInfo: Codable {
    let name: String
    let location: String
    let blog : String
}
