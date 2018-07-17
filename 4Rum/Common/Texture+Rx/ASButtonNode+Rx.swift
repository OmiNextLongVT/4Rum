//
//  ASButtonNode+Rx.swift
//  4Rum
//
//  Created by Ominext on 7/17/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import AsyncDisplayKit

extension Reactive where Base: ASButtonNode {
    public var tap: ControlEvent<Void> {
        return controlEvent(.touchUpInside)
    }
}
