//
//  ViewController.swift
//  GitHubUserAPI
//
//  Created by David Kuo on 2021/8/7.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = GitHubUserListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = "User"

        viewModel.fetchUserListFor(page: 0) {
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? GitHubUserListTableViewCell {
            let user = viewModel.userList.value[indexPath.row]
            cell.setupDataBind(viewModel: user)
            return cell
        } else {
            fatalError()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(viewModel.userList.value[indexPath.row].imageUrl.value)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let nowDataTotal = viewModel.userList.value.count
        if (indexPath.row + 5) == nowDataTotal {
            viewModel.fetchUserListFor(page: viewModel.lastedID.value) {
                self.tableView.reloadData()
            }
        }
    }
}

