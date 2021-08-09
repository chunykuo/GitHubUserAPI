//
//  GitHubUserListTableViewCell.swift
//  GitHubUserAPI
//
//  Created by David Kuo on 2021/8/9.
//

import UIKit.UITableViewCell

class GitHubUserListTableViewCell: UITableViewCell {
    func setupDataBind(viewModel: GitHubUserListCellViewModel) {
        viewModel.title.bind { [weak self] title in
            self?.textLabel?.text = title
        }
        viewModel.type.bind { [weak self] subtitle in
            self?.detailTextLabel?.text = subtitle
        }
        viewModel.image.bind { [weak self] image in
            DispatchQueue.main.async {
                self?.imageView?.image = image
                self?.setNeedsLayout()
            }
        }
        viewModel.imageUrl.bind { url in
            viewModel.getImagesFrom(url: url)
        }
    }
}
