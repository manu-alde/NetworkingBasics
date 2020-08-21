//
//  CommentsViewController.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

final class CommentsViewController: BaseViewController {

    // MARK: - Views -
    @IBOutlet private weak var commentsTableView: UITableView!
    
    // MARK: - Attributes -
    private var post: Post
    private var comments: [Comment] = []
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = post.title
        
        configureTableView()
        loadPosts()
    }
    
    // MARK: - Init -
    init(post: Post){
        self.post = post
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration -
    private func configureTableView() {
        commentsTableView.register(UINib(nibName: "CommentTableViewCell", bundle: nil), forCellReuseIdentifier: "CommentTableViewCell")
        
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
    }
    
    // MARK: - Data Fetching -
    private func loadPosts() {
        NetworkingManager.getComments(for: post, completion: { (result: Result<[Comment], Error>) in
            switch result {
            case .success(let comments):
                self.comments = comments
                self.commentsTableView.reloadData()
            case .failure:
                self.showAlert(
                    title: "Error fetching comments",
                    message: "Please, reopen the app"
                )
            }
        })
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource -
extension CommentsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTableViewCell") as! CommentTableViewCell
        cell.configure(for: comments[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PostTableViewCell.height
    }
}
