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
    var emailTextField = ASEditableTextNode()
    var passwordTextField = ASEditableTextNode()
    var passwordUnCoverButton = ASButtonNode()
    var loginButton = ASButtonNode()
    var registerButton = ASButtonNode()
    
    
    override init() {
        super.init()
        self.backgroundColor = Color.background.value
        automaticallyManagesSubnodes = true
        //title
        titleNode.attributedText = Text.init(type: Text.TextType.Logo, color: Color.darkText.value, text: "4Rum").instance
        //email title
        emailTitleNode.attributedText = Text.init(type: Text.TextType.Title, color: Color.lightText.value, text: "email".localized).instance
        emailTextField.attributedPlaceholderText = Text.init(type: Text.TextType.Content, color: Color.lightText.value, text: "email@mail.com").instance
        emailTextField.style.height = ASDimensionMake(24)
        emailBottomLine.backgroundColor = Color.deviderGray.value
        emailBottomLine.style.height = ASDimensionMake(1)
        //password
        passwordTitleNode.attributedText = Text.init(type: Text.TextType.Title, color: Color.lightText.value, text: "password".localized).instance
        passwordTextField.attributedPlaceholderText = Text.init(type: Text.TextType.Content, color: Color.lightText.value, text: "••••••").instance
        passwordTextField.style.height = ASDimensionMake(24)
        passwordTextField.isSecureTextEntry = true
        passwordBottomLine.backgroundColor = Color.deviderGray.value
        passwordBottomLine.style.height = ASDimensionMake(1)
        passwordUnCoverButton.setImage(UIImage(named: "ic_uncover_password"), for: .normal)
        
        loginButton.setAttributedTitle(Text.init(type: Text.TextType.Title, color: Color.white.value, text: "login".localized).instance, for: .normal)
        loginButton.backgroundColor = Color.theme.value
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
        
        passwordTextField.style.flexGrow = 1.0
        let passwordTextFieldStack = ASStackLayoutSpec()
        passwordTextFieldStack.direction = .horizontal
        passwordTextFieldStack.justifyContent = .spaceBetween
        passwordTextFieldStack.alignItems = .start
        passwordTextFieldStack.spacing = 5
        passwordTextFieldStack.children = [passwordTextField, passwordUnCoverButton]
        
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
