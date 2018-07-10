//
//  FollowingNavigator.swift
//  4Rum
//
//  Created by Ominext on 7/10/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit

protocol FollowingNavigator {
    func toFollowing()
}
class DefaultFollowingNavigator: FollowingNavigator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toFollowing() {
        let vc = FollowingViewController()
        self.navigationController.pushViewController(vc, animated: true)
    }
}
