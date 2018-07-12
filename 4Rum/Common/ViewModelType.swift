//
//  ViewModelType.swift
//  4Rum
//
//  Created by Ominext on 7/12/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

