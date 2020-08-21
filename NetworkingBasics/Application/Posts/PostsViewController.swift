//
//  PostsViewController.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

final class PostsViewController: BaseViewController {

    // MARK: - Views -
    @IBOutlet private weak var postsTableView: UITableView!
    
    // MARK: - Attributes -
    private var user: User
    private var posts: [Post] = []
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Post"
        
        configureTableView()
        loadPosts()
    }
    
    // MARK: - Init -
    init(user: User){
        self.user = user
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration -
    private func configureTableView() {
        postsTableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        
        postsTableView.delegate = self
        postsTableView.dataSource = self
    }
    
    // MARK: - Data Fetching -
    private func loadPosts() {
        NetworkingManager.getPosts(for: user, completion: { (result: Result<[Post], Error>) in
            switch result {
            case .success(let posts):
                self.posts = posts
                self.postsTableView.reloadData()
            case .failure:
                self.showAlert(
                    title: "Error fetching posts",
                    message: "Please, reopen the app"
                )
            }
        })
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource -
extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
        cell.configure(for: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        let viewController = CommentsViewController(post: post)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PostTableViewCell.height
    }
}
