//
//  InboxNavigator.swift
//  4Rum
//
//  Created by Ominext on 7/10/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit

protocol InboxNavigator {
    func toInbox()
}
class DefaultInboxNavigator: InboxNavigator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toInbox() {
        let vc = InboxViewController()
        self.navigationController.pushViewController(vc, animated: true)
    }
}
