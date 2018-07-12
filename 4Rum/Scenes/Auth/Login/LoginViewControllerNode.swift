//
//  LoginViewControllerNode.swift
//  4Rum
//
//  Created by Ominext on 7/12/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class LoginViewControllerNode: ASDisplayNode {
    var titleNode = ASTextNode()
    var emailTitleNode = ASTextNode()
    var emailSubTitleNode = ASTextNode()
    var emailBottomLine = ASDisplayNode()
    var passwordTitleNode = ASTextNode()
    var passwordSubTitleNode = ASTextNode()
    var passwordBottomLine = ASDisplayNode()
    
    var emailTextField : ASDisplayNode {
        let tf = ASDisplayNode { () -> UIView in
            let textField = UITextField()
            return textField
        }
        return tf
    }
    var passwordTextField : ASDisplayNode {
        let tf = ASDisplayNode { () -> UIView in
            let textField = UITextField()
            return textField
        }
        return tf
    }
    
    var passwordUnCoverButton = ASButtonNode()
    var loginButton = ASButtonNode()
    var registerButton = ASButtonNode()
}
