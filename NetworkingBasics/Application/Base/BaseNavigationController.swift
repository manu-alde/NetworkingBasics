//
//  BaseNavigationController.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.tintColor = UIColor.white
        navigationBar.barTintColor = UIColor.systemGreen
        navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 18.0)
        ]
    }
}
