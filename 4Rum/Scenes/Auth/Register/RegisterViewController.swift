//
//  RegisterViewController.swift
//  4Rum
//
//  Created by Ominext on 7/17/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import RxSwift
import RxCocoa

class RegisterViewController: BaseViewController {
    
    var containerNode : RegisterViewControllerNode!
    init() {
        let container = RegisterViewControllerNode()
        super.init(node: container)
        self.containerNode = container
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
