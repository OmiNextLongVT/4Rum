//
//  AppDelegate.swift
//  4Rum
//
//  Created by Ominext on 7/6/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        Application.shared.configureMainScenes(in: window)
        self.window = window
        return true
    }

}

