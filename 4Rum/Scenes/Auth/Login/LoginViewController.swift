//
//  LoginViewController.swift
//  4Rum
//
//  Created by Ominext on 7/12/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class LoginViewController: BaseViewController {
    var containerNode : LoginViewControllerNode!
    
    init() {
        let container = LoginViewControllerNode()
        super.init(node: container)
        self.containerNode = container
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
