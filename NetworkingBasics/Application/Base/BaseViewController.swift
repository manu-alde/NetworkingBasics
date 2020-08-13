//
//  ViewController.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Init -
    init() {
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: - Utils -
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(
            title: "Ok",
            style: .cancel,
            handler: nil
        ))
        present(alertController, animated: true, completion: nil)
    }
}
