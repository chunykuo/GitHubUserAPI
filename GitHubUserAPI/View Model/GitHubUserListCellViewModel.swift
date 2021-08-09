//
//  GitHubUserListCellViewModel.swift
//  GitHubUserAPI
//
//  Created by David Kuo on 2021/8/9.
//

import UIKit.UIImage

class GitHubUserListCellViewModel {
    let title = Box("unknown user")
    let type = Box("unknown type")
    let imageUrl = Box("")
    let image: Box<UIImage?> = Box(nil)
    
    func getImagesFrom(url: String) {
        DispatchQueue.global().async {
            let baseService = BaseService()
            baseService.getData(from: url) { data in
                if let image = UIImage(data: data) {
                    self.image.value = image
                } else {
                    print("get data, but is not image")
                }
            } failure: { error in
                print(error)
            }
        }
    }
}
