//
//  HomeNavigator.swift
//  4Rum
//
//  Created by Ominext on 7/10/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit

protocol HomeNavigator {
    func toHome()
}

class DefaultHomeNavigator: HomeNavigator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toHome() {
        let vc = HomeViewController()
        self.navigationController.pushViewController(vc, animated: true)
    }
}
