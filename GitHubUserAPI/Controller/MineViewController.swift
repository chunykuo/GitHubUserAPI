//
//  MineViewController.swift
//  GitHubUserAPI
//
//  Created by David Kuo on 2021/8/10.
//

import UIKit

class MineViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var followImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var followLabel: UILabel!
    
    let viewModel = MineViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        imageView.makeCircleBorder()
        followImageView.isHidden = true
        self.tabBarController?.title = "Mine"
        
        viewModel.getMineInfo()
        viewModel.fullName.bind { [weak self] name in
            self?.fullNameLabel.text = name
        }
        viewModel.login.bind { [weak self] login in
            self?.loginLabel.text = login
        }
        viewModel.image.bind { [weak self] image in
            self?.imageView.image = image
            if let imageView = self?.imageView {
                self?.view.bringSubviewToFront(imageView)
            }
        }
        viewModel.followDescription.bind { [weak self] follow in
            self?.followLabel.text = follow
            self?.followImageView.isHidden = follow.isEmpty
        }
    }

}
