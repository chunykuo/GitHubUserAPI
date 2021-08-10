//
//  GitHubUser.swift
//  GitHubUserAPI
//
//  Created by David Kuo on 2021/8/7.
//

import Foundation

protocol GitHub: Codable {
    var id: Int { get }
    var login: String { get }
    var avatar_url: String { get }
    var type: String { get }
}

struct GitHubUser: GitHub {
    let id: Int
    let login: String
    let avatar_url: String
    let type: String
}

struct GitHubUserInfo: GitHub {
    let id: Int
    let login: String
    let avatar_url: String
    let type: String

    let name: String
    let location: String
    let blog: String
    let followers: Int
    let following: Int
}
