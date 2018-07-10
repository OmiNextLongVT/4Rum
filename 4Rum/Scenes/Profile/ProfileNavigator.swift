//
//  ProfileNavigator.swift
//  4Rum
//
//  Created by Ominext on 7/10/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit

protocol ProfileNavigator {
    func toProfile()
}
class DefaultProfileNavigator: ProfileNavigator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toProfile() {
        let vc = ProfileViewController()
        self.navigationController.pushViewController(vc, animated: true)
    }
}
