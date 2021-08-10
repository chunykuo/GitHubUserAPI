//
//  MineViewModel.swift
//  GitHubUserAPI
//
//  Created by David Kuo on 2021/8/10.
//

import UIKit.UIImage

class MineViewModel {
    let fullName = Box("")
    let login = Box("")
    let image: Box<UIImage?> = Box(nil)
    let followDescription = Box("")
    
    func getMineInfo() {
        let gitHubService = GitHubService()
        gitHubService.getInfoFrom(userName: "chunykuo") { info in
            self.fullName.value = info.name
            self.login.value = info.login
            let url = info.avatar_url
            self.setFollow(ers: info.followers, ing: info.following)
            let baseService = BaseService()
            baseService.getData(from: url) { data in
                if let image = UIImage(data: data) {
                    self.image.value = image
                }
            } failure: { error in
                print(error)
            }
        } failure: { error in
            print(error)
        }
    }
    
    func setFollow(ers: Int, ing: Int) {
        self.followDescription.value = "\(ers) followers, \(ing) following"
    }
}
