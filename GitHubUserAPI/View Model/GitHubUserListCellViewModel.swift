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
    
    let imageDownloadQueue = DispatchQueue(label: "image.download", attributes: .concurrent)
    var onImageDownload: ((UIImage?) -> Void)?
    
    // MARK: - Detail property
    let fullName = Box("")
    let location = Box("")
    let blogUrl = Box("")
    let image: Box<UIImage?> = Box(nil)
    
    func getImage() {
        imageDownloadQueue.async {
            let baseService = BaseService()
            baseService.getData(from: self.imageUrl.value) { data in
                if let image = UIImage(data: data) {
                    self.image.value = image
                    guard let imageDownloaded = self.onImageDownload else { return }
                    imageDownloaded(image)
                } else {
                    print("get data, but is not image")
                }
            } failure: { error in
                print(error)
            }
        }
    }
    
    func getInfo() {
        let gitHubService = GitHubService()
        gitHubService.getInfoFrom(userName: title.value) { info in
            self.fullName.value = info.name
            self.location.value = info.location
            self.blogUrl.value = info.blog
        } failure: { error in
            print(error)
        }
    }
}
