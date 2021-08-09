//
//  GitHubService.swift
//  GitHubUserAPI
//
//  Created by David Kuo on 2021/8/7.
//

import Foundation

class GitHubService: BaseService {
    private let scheme = "https"
    private let host = "api.github.com"
    private let userListPath = "/users"
    
    func getUserList(since: Int, success: @escaping ([GitHubUser]) -> (), failure: @escaping (BaseServiceError) -> ()) {
        var urlComponent = URLComponents()
        urlComponent.scheme = scheme
        urlComponent.host = host
        urlComponent.path = userListPath
        urlComponent.queryItems = [URLQueryItem(name: "since", value: String(since)), URLQueryItem(name: "per_page", value: String(20))]
        getJSON(from: urlComponent) { data in
            do {
                let decoder = JSONDecoder()
                let resultData = try decoder.decode([GitHubUser].self, from: data)
                if resultData.count > 0 {
                    success(resultData)
                } else {
                    failure(.emptyData)
                }
            } catch {
                failure(.failedRequest)
            }
        } failure: { error in
            failure(error)
        }
    }
    
    func getInfoFrom(userName: String, success: @escaping (GitHubUserInfo) -> (), failure: @escaping (BaseServiceError) -> ()) {
        var urlComponent = URLComponents()
        urlComponent.scheme = scheme
        urlComponent.host = host
        urlComponent.path = userListPath + "/\(userName)"
        getJSON(from: urlComponent) { data in
            do {
                let decoder = JSONDecoder()
                let resultData = try decoder.decode(GitHubUserInfo.self, from: data)
                success(resultData)
            } catch {
                failure(.failedRequest)
            }
        } failure: { error in
            failure(error)
        }
    }
}
