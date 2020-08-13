//
//  AlbumsViewController.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

final class AlbumsViewController: BaseViewController {
    
    // MARK: - Views -
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Attributes -
    private let user: User
    private var albums: [Album] = []

    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Albums"
        
        configureTableView()
        loadAlbums()
    }
    
    // MARK: - Init -
    init(user: User) {
        self.user = user
        super.init()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Configuration -
    private func configureTableView() {
        tableView.register(UINib(nibName: "AlbumTableViewCell", bundle: nil), forCellReuseIdentifier: "AlbumTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Data Fetching -
    private func loadAlbums() {
        NetworkingManager.getAlbums(for: user) { (result: Result<[Album], Error>) in
            switch result {
            case .success(let albums):
                self.albums = albums
                self.tableView.reloadData()
            case .failure:
                self.showAlert(
                    title: "Error fetching albums",
                    message: "Please, reopen the screen"
                )
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource -
extension AlbumsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell") as! AlbumTableViewCell
        cell.configure(for: albums[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return AlbumTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let album = albums[indexPath.row]
        let viewController = PhotosViewController(album: album)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
