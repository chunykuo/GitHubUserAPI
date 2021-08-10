//
//  UIImageViewExtension.swift
//  GitHubUserAPI
//
//  Created by David Kuo on 2021/8/10.
//

import UIKit.UIImageView

extension UIImageView {
    func makeCircleBorder() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
