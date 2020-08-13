//
//  AlbumTableViewCell.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

final class AlbumTableViewCell: UITableViewCell {
    
    // MARK: - Views -
    @IBOutlet weak var albumTitleLabel: UILabel!

    // MARK: - Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    // MARK: - Configuration -
    func configure(for album: Album) {
        albumTitleLabel.text = album.title
    }
    
    // MARK: - Size -
    static var height: CGFloat {
        return 50.0
    }
}
