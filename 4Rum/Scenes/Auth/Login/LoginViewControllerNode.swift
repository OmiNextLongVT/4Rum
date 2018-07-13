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
    
    
    override init() {
        super.init()
        self.backgroundColor = Color.background.value
        automaticallyManagesSubnodes = true
        //title
        titleNode.attributedText = Text.init(type: Text.TextType.Header, color: Color.darkText.value, text: "4Rum").instance
        //email title
        emailTitleNode.attributedText = Text.init(type: Text.TextType.Title, color: Color.lightText.value, text: "email".localized).instance
        (emailTextField.view as? UITextField)?.attributedPlaceholder = Text.init(type: Text.TextType.Content, color: Color.lightText.value, text: "email@mail.com").instance
        emailBottomLine.backgroundColor = Color.theme.value
        emailBottomLine.style.height = ASDimensionMake(1)
        //password
        passwordTitleNode.attributedText = Text.init(type: Text.TextType.Title, color: Color.lightText.value, text: "password".localized).instance
        (passwordTextField.view as? UITextField)?.attributedPlaceholder = Text.init(type: Text.TextType.Content, color: Color.lightText.value, text: "••••••").instance
        emailBottomLine.backgroundColor = Color.theme.value
        passwordBottomLine.style.height = ASDimensionMake(1)
        passwordUnCoverButton.setImage(UIImage(named: "ic_uncover_password"), for: .normal)
        
        loginButton.setAttributedTitle(Text.init(type: Text.TextType.Title, color: Color.theme.value, text: "login".localized).instance, for: .normal)
        loginButton.style.height = ASDimensionMake(52)
        loginButton.cornerRadius = 4.0
        
        registerButton.setAttributedTitle(Text.init(type: Text.TextType.Title, color: Color.theme.value, text: "register".localized).instance, for: .normal)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let emailStack = ASStackLayoutSpec()
        emailStack.direction = .vertical
        emailStack.justifyContent = .spaceBetween
        emailStack.alignItems = .stretch
        emailStack.spacing = 5
        emailStack.children = [emailTitleNode, emailTextField, emailBottomLine]
        
        let passwordTextFieldStack = ASStackLayoutSpec()
        emailStack.direction = .horizontal
        emailStack.justifyContent = .spaceBetween
        emailStack.alignItems = .start
        emailStack.spacing = 5
        emailStack.children = [passwordTextField, passwordUnCoverButton]
        
        let passwordStack = ASStackLayoutSpec()
        passwordStack.direction = .vertical
        passwordStack.justifyContent = .spaceBetween
        passwordStack.alignItems = .stretch
        passwordStack.spacing = 5
        passwordStack.children = [passwordTitleNode, passwordTextFieldStack, passwordBottomLine]
        
        let bottomStack = ASStackLayoutSpec()
        bottomStack.direction = .vertical
        bottomStack.justifyContent = .spaceBetween
        bottomStack.alignItems = .stretch
        bottomStack.spacing = 12
        bottomStack.children = [emailStack, passwordStack, loginButton, registerButton]
        registerButton.style.alignSelf = .start
        
        let stack = ASStackLayoutSpec()
        stack.direction = .vertical
        stack.justifyContent = .spaceBetween
        stack.alignItems = .stretch
        stack.spacing = 24
        stack.children = [titleNode, bottomStack]
        titleNode.style.alignSelf = .start
        
        let inset = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(30, 24, CGFloat.greatestFiniteMagnitude, 24), child: stack)
        return inset
    }
    
    
   
    
}
