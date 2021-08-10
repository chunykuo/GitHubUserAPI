//
//  DetailViewController.swift
//  GitHubUserAPI
//
//  Created by David Kuo on 2021/8/9.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var fullNameImageView: UIImageView!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var blogImageView: UIImageView!
    @IBOutlet weak var titleNameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var blogLabel: UILabel!
    
    var viewModel: GitHubUserListCellViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.makeCircleBorder()
        fullNameImageView.isHidden = true
        locationImageView.isHidden = true
        blogImageView.isHidden = true
        
        viewModel?.getInfo()

        viewModel?.image.bind(listener: { [weak self] image in
            self?.imageView.image = image
        })
        
        viewModel?.title.bind(listener: { [weak self] title in
            self?.titleNameLabel.text = title
        })
        
        viewModel?.fullName.bind(listener: { [weak self] name in
            self?.fullNameLabel.text = name
            self?.fullNameImageView.isHidden = name.isEmpty
        })
        
        viewModel?.location.bind(listener: { [weak self] location in
            self?.locationLabel.text = location
            self?.locationImageView.isHidden = location.isEmpty
        })
        
        viewModel?.blogUrl.bind(listener: { [weak self] url in
            self?.blogLabel.text = url
            self?.blogImageView.isHidden = url.isEmpty
        })
    }
}

