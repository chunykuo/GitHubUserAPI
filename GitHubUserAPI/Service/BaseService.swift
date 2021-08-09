//
//  BaseService.swift
//  GitHubUserAPI
//
//  Created by David Kuo on 2021/8/7.
//

import Foundation

enum BaseServiceError: String, Error {
    case notFoundUrl
    case failedRequest
    case invalidResponse
    case emptyData
}


class BaseService {
    
    func getJSON(from urlComponents: URLComponents, success: @escaping (Data) -> (), failure: @escaping (BaseServiceError) -> ()) {
        if let url = urlComponents.url {
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            session.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    guard error == nil else {
                        failure(.failedRequest)
                        return
                    }
                    
                    guard response != nil else {
                        failure(.invalidResponse)
                        return
                    }
                    
                    guard let data = data else {
                        failure(.emptyData)
                        return
                    }
                    
                    success(data)
                }
            }.resume()
        } else {
            failure(.notFoundUrl)
        }
    }
    
    func getData(from url: String, success: @escaping (Data) -> (), failure: @escaping (BaseServiceError) -> ()) {
        if let url = URL(string: url) {
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            session.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    guard error == nil else {
                        failure(.failedRequest)
                        return
                    }
                    
                    guard response != nil else {
                        failure(.invalidResponse)
                        return
                    }
                    
                    guard let data = data else {
                        failure(.emptyData)
                        return
                    }
                    
                    success(data)
                }
            }.resume()
        } else {
            failure(.notFoundUrl)
        }
    }
}
