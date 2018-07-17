//
//  RxAsTarget.swift
//  4Rum
//
//  Created by Ominext on 7/17/18.
//  Copyright © 2018 mobile. All rights reserved.
//
import Foundation
import RxSwift
import RxCocoa

class RxASTarget: NSObject, Disposable {
    
    private var retainSelf: RxASTarget?
    
    override init() {
        super.init()
        self.retainSelf = self
    }
    
    func dispose() {
        self.retainSelf = nil
    }
}
