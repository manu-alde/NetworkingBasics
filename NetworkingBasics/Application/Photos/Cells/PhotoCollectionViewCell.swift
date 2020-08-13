//
//  PhotoCollectionViewCell.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit
import Kingfisher

final class PhotoCollectionViewCell: UICollectionViewCell {
    // MARK: - Views -
    @IBOutlet private weak var photoImageView: UIImageView!
    
    // MARK: - Life cycle -
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.kf.cancelDownloadTask()
    }
    
    // MARK: - Configuration -
    func configure(for photo: Photo) {
        guard let url = URL(string: photo.url ?? "") else {
            return
        }
        
        photoImageView.kf.setImage(
            with: ImageResource(downloadURL: url),
            placeholder: nil,
            options: [.transition(.fade(0.3))]
        )
    }
}
