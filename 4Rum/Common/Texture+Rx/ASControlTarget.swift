//
//  ASControlTarget.swift
//  4Rum
//
//  Created by Ominext on 7/17/18.
//  Copyright © 2018 mobile. All rights reserved.
//
import Foundation
import RxSwift
import RxCocoa
import AsyncDisplayKit

typealias Control = ASControlNode
typealias ControlEvents = ASControlNodeEvent
final class ASControlTarget: RxASTarget {
    typealias Callback = (Control) -> Void
    
    let selector: Selector = #selector(ASControlTarget.eventHandler(_:))
    
    weak var control: Control?
    let controlEvents: ControlEvents
    var callback: Callback?
    init(control: Control, controlEvents: ASControlNodeEvent, callback: @escaping Callback) {
        MainScheduler.ensureExecutingOnScheduler()
        
        self.control = control
        self.controlEvents = controlEvents
        self.callback = callback
        
        super.init()
        
        control.addTarget(self, action: selector, forControlEvents: controlEvents)
        
        let method = self.method(for: selector)
        if method == nil {
            fatalError("Can't find method")
        }
    }
    
    @objc func eventHandler(_ sender: Control!) {
        if let callback = self.callback, let control = self.control {
            callback(control)
        }
    }
    
    override func dispose() {
        super.dispose()
        self.control?.removeTarget(self, action: self.selector, forControlEvents: self.controlEvents)
        self.callback = nil
    }
}
