//
//  Theme.swift
//  4Rum
//
//  Created by Ominext on 7/10/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit

protocol Theme {
    func setThemeColor() -> UIColor
}

extension Theme {
    func setThemeColor() -> UIColor {
        return Color.theme.value
    }
}
