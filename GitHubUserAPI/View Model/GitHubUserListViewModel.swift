//
//  GitHubUserListViewModel.swift
//  GitHubUserAPI
//
//  Created by David Kuo on 2021/8/9.
//

import Foundation

class GitHubUserListViewModel {
    var userList: Box<[GitHubUserListCellViewModel]> = Box([])
    var lastedID: Box<Int> = Box(0)
    
    func fetchUserListFor(page: Int, completion: @escaping () -> ()) {
        let gitHubService = GitHubService()
        gitHubService.getUserList(since: page) { users in
            for user in users {
                let newUser = GitHubUserListCellViewModel()
                newUser.title.value = user.login
                newUser.type.value = user.type
                newUser.imageUrl.value = user.avatar_url
                self.userList.value.append(newUser)
            }
            self.lastedID.value = users[users.count - 1].id
            completion()
        } failure: { error in
            print(error)
        }
    }
}
