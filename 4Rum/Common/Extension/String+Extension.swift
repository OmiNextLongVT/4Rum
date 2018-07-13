//
//  String+Extension.swift
//  4Rum
//
//  Created by Ominext on 7/13/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit

extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
