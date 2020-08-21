//
//  AppDelegate.swift
//  NetworkingBasics
//
//  Created by Macbook on 12/08/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame:UIScreen.main.bounds)
        
        window.rootViewController = UINavigationController(rootViewController: UsersViewController())
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }

}

