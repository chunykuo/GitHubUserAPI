//
//  GitHubUserListTableViewCell.swift
//  GitHubUserAPI
//
//  Created by David Kuo on 2021/8/9.
//

import UIKit.UITableViewCell

class GitHubUserListTableViewCell: UITableViewCell {
    private var viewModel: GitHubUserListCellViewModel?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.makeCircleBorder()
    }
    
    override func prepareForReuse() {
        self.imageView?.image = nil
        self.viewModel?.onImageDownload = nil
    }
    
    func setupDataBind(viewModel: GitHubUserListCellViewModel) {
        self.viewModel = viewModel
        self.viewModel?.title.bind { [weak self] title in
            self?.textLabel?.text = title
        }
        self.viewModel?.type.bind { [weak self] subtitle in
            self?.detailTextLabel?.text = subtitle
        }
        self.viewModel?.onImageDownload = { [weak self] image in
            DispatchQueue.main.async {
                self?.imageView?.image = image
                self?.setNeedsLayout()
            }
        }
        self.viewModel?.getImage()
    }
}
