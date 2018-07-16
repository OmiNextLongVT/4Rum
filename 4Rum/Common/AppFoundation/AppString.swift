//
//  AppString.swift
//  4Rum
//
//  Created by Ominext on 7/12/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit

struct Text {
    enum TextType {
        case Logo
        case Header
        case Title
        case SubTitle
        case Content
    }
    
    var type: TextType
    var color: UIColor
    var text: String
    init(type: TextType, color: UIColor, text: String) {
        self.type = type
        self.color = color
        self.text = text
    }
    
    var instance : NSAttributedString {
        let font : UIFont!
        switch self.type {
        case .Logo:
            font = Font(.installed(.RobotoBold),
                        size: .custom(32)).instance
        case .Header:
            font = Font(.installed(.RobotoBold),
                        size: .standard(.h1)).instance
        case .Title:
            font = Font(.installed(.OpenSansSemiBold),
                        size: .standard(.h3)).instance
        case .SubTitle:
            font = Font(.installed(.OpenSansRegular),
                        size: .standard(.h6)).instance
        case .Content:
            font = Font(.installed(.OpenSansRegular),
                        size: .standard(.h4)).instance
        }
        
        return NSAttributedString(string: text, attributes: [NSAttributedStringKey.foregroundColor : color,
                                                               NSAttributedStringKey.font : font])
    }
}
