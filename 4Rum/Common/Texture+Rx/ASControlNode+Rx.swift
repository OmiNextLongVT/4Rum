//
//  ASControlNode+Rx.swift
//  4Rum
//
//  Created by Ominext on 7/17/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import AsyncDisplayKit

extension Reactive where Base: ASControlNode {
    /// Bindable sink for `enabled` property.
    public var isEnabled: UIBindingObserver<Base, Bool> {
        return UIBindingObserver(UIElement: self.base) { control, value in
            control.isEnabled = value
        }
    }
    
    /// Bindable sink for `selected` property.
    public var isSelected: UIBindingObserver<Base, Bool> {
        return UIBindingObserver(UIElement: self.base) { control, selected in
            control.isSelected = selected
        }
    }
    
    /// Reactive wrapper for target action pattern.
    ///
    /// - parameter controlEvents: Filter for observed event types.
    public func controlEvent(_ controlEvents: ASControlNodeEvent) -> ControlEvent<Void> {
        let source: Observable<Void> = Observable.create { [weak control = self.base] observer in
            MainScheduler.ensureExecutingOnScheduler()
            
            guard let control = control else {
                observer.on(.completed)
                return Disposables.create()
            }
            
            let controlTarget = ASControlTarget(control: control, controlEvents: controlEvents) {
                _ in
                observer.on(.next(()))
            }
            
            return Disposables.create(with: controlTarget.dispose)
            }.takeUntil(deallocated)
        
        return ControlEvent(events: source)
    }
    
    /// This is internal convenience method
    /// https://github.com/ReactiveX/RxSwift/issues/681
    /// In case similar behavior is externally needed, one can use the following snippet
    ///
    /// ```swift
    /// extension ASControlNode {
    ///     static func valuePublic<T, ControlType: ASControlNode>(_ control: ControlType, getter:  @escaping (ControlType) -> T, setter: @escaping (ControlType, T) -> ()) -> ControlProperty<T> {
    ///        let values: Observable<T> = Observable.deferred { [weak control] in
    ///            guard let existingSelf = control else {
    ///                return Observable.empty()
    ///            }
    ///
    ///            return (existingSelf as ASControlNode).rx.controlEvent([.allEditingEvents, .valueChanged])
    ///                .flatMap { _ in
    ///                    return control.map { Observable.just(getter($0)) } ?? Observable.empty()
    ///                }
    ///                .startWith(getter(existingSelf))
    ///        }
    ///        return ControlProperty(values: values, valueSink: UIBindingObserver(UIElement: control) { control, value in
    ///            setter(control, value)
    ///        })
    ///    }
    ///}
    ///```
    static func value<C: ASControlNode, T>(_ control: C, getter: @escaping (C) -> T, setter: @escaping (C, T) -> Void) -> ControlProperty<T> {
        let source: Observable<T> = Observable.create { [weak weakControl = control] observer in
            guard let control = weakControl else {
                observer.on(.completed)
                return Disposables.create()
            }
            
            observer.on(.next(getter(control)))
            
            let controlTarget = ASControlTarget(control: control, controlEvents: [.allEvents, .valueChanged]) { _ in
                if let control = weakControl {
                    observer.on(.next(getter(control)))
                }
            }
            
            return Disposables.create(with: controlTarget.dispose)
            }
            .takeUntil((control as NSObject).rx.deallocated)
        
        let bindingObserver = UIBindingObserver(UIElement: control, binding: setter)
        
        return ControlProperty<T>(values: source, valueSink: bindingObserver)
    }
}
