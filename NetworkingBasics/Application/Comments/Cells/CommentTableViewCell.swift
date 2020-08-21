//
//  CommentTableViewCell.swift
//  NetworkingBasics
//
//  Created by Infinixsoft on 21/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    // MARK: - Views -
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    
    // MARK: - Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Configuration -
    func configure(for comment: Comment) {
        self.nameLabel.text = comment.name
        self.emailLabel.text = comment.email
        self.bodyLabel.text = comment.body
    }
    
    // MARK: - Size -
    static var height: CGFloat {
        return 65.0
    }
}
