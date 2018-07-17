//
//  LoginNavigator.swift
//  4Rum
//
//  Created by Ominext on 7/17/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit

protocol LoginNavigator {
    func toRegister()
}

class DefaultLoginNavigator: LoginNavigator {
    private let navigationController: AppNavigationController
    
    init(navigationController: AppNavigationController) {
        self.navigationController = navigationController
    }
    
    func toRegister() {
        let vc = RegisterViewController()
        self.navigationController.pushViewController(vc, animated: true)
    }
}
