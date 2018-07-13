//
//  Application.swift
//  4Rum
//
//  Created by Ominext on 7/10/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit

final class Application {
    static let shared = Application()
    
    func configureMainScenes(in window: UIWindow) {
        
        //home
        let homeNavigationController = AppNavigationController()
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home",
                                          image: UIImage(named: "tab_home"),
                                          selectedImage: nil)
        let homeNavigator = DefaultHomeNavigator(navigationController: homeNavigationController)
        //following
        let followingNavigationController = AppNavigationController()
        followingNavigationController.tabBarItem = UITabBarItem(title: "Following",
                                                           image: UIImage(named: "tab_following"),
                                                           selectedImage: nil)
        let followingNavigator = DefaultFollowingNavigator(navigationController: followingNavigationController)
        //Inbox
        let inboxNavigationController = AppNavigationController()
        inboxNavigationController.tabBarItem = UITabBarItem(title: "Inbox",
                                                           image: UIImage(named: "tab_inbox"),
                                                           selectedImage: nil)
        let inboxNavigator = DefaultInboxNavigator(navigationController: inboxNavigationController)
        //Profile
        let profileNavigationController = AppNavigationController()
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile",
                                                           image: UIImage(named: "tab_profile"),
                                                           selectedImage: nil)
        let profileNavigator = DefaultProfileNavigator(navigationController: profileNavigationController)
        
        let tabBarViewController = AppTabBarController()
        tabBarViewController.viewControllers = [homeNavigationController,
                                                followingNavigationController,
                                                inboxNavigationController,
                                                profileNavigationController]
        window.rootViewController = tabBarViewController
        homeNavigator.toHome()
        followingNavigator.toFollowing()
        inboxNavigator.toInbox()
        profileNavigator.toProfile()
    }
    
    func setLoginScene(in window: UIWindow) {
        let loginVC = LoginViewController()
        let nav = AppNavigationController(rootViewController: loginVC)
        window.rootViewController = nav
    }
}
