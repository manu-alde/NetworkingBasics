//
//  PhotosViewController.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

final class PhotosViewController: BaseViewController {
    
    // MARK: - Views -
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Attributes -
    private let album: Album
    private var photos: [Photo] = []

    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Photos"
        
        configureCollectionView()
        loadPhotos()
    }
    
    // MARK: - Init -
    init(album: Album) {
        self.album = album
        super.init()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Configuration -
    private func configureCollectionView() {
        collectionView.register(
            UINib(
                nibName: "PhotoCollectionViewCell",
                bundle: nil
            ),
            forCellWithReuseIdentifier: "PhotoCollectionViewCell"
        )
        
        let layout = UICollectionViewFlowLayout()
        let itemWidth = UIScreen.main.bounds.width / 4.0
        layout.itemSize = CGSize(
            width: itemWidth,
            height: itemWidth
        )
        layout.minimumInteritemSpacing = CGFloat.leastNonzeroMagnitude
        layout.minimumLineSpacing = CGFloat.leastNonzeroMagnitude
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Data Fetching -
    private func loadPhotos() {
        NetworkingManager.getPhotos(in: album) { (result: Result<[Photo], Error>) in
            switch result {
            case .success(let photos):
                self.photos = photos
                self.collectionView.reloadData()
            case .failure:
                self.showAlert(
                    title: "Error fetching photos",
                    message: "Please, reopen the screen"
                )
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource -
extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        cell.configure(for: photos[indexPath.row])
        return cell
    }
}
