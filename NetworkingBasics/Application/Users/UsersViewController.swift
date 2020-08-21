//
//  UsersViewController.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

final class UsersViewController: BaseViewController {
    
    // MARK: - Views -
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Attributes -
    private var users: [User] = []

    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Users"
        
        configureTableView()
        loadUsers()
    }
    
    // MARK: - Configuration -
    private func configureTableView() {
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Data Fetching -
    private func loadUsers() {
        NetworkingManager.getUsers { (result: Result<[User], Error>) in
            switch result {
            case .success(let users):
                self.users = users
                self.tableView.reloadData()
            case .failure:
                self.showAlert(
                    title: "Error fetching users",
                    message: "Please, reopen the app"
                )
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource -
extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell") as! UserTableViewCell
        cell.configure(for: users[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        let viewController = PostsViewController(user: user)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UserTableViewCell.height
    }
}
