//
//  Box.swift
//  GitHubUserAPI
//
//  Created by David Kuo on 2021/8/9.
//

import Foundation

final class Box<T> {
    typealias Listener = (T) -> ()
    var listener: Listener?
    var value: T {
        didSet {
            listener?(value)
        }
    }
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
