//
//  UserTableViewCell.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

final class UserTableViewCell: UITableViewCell {
    
    // MARK: - Views -
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!

    // MARK: - Life Cycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Configuration -
    func configure(for user: User) {
        self.userNameLabel.text = user.name
        self.emailLabel.text = user.email
    }
    
    // MARK: - Size -
    static var height: CGFloat {
        return 65.0
    }
}
