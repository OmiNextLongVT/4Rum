//
//  LoginViewModel.swift
//  4Rum
//
//  Created by Ominext on 7/16/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class LoginViewModel: ViewModelType {
    struct Input {
        let registerTrigger: Driver<Void>
    }
    
    struct Output {
        let error: Driver<Error>
        let toRegisterScene : Driver<Void>
    }
    
    private let navigator : DefaultLoginNavigator
    
    init(navigator: DefaultLoginNavigator) {
        self.navigator = navigator
        
    }
    
    func transform(input: LoginViewModel.Input) -> LoginViewModel.Output {
        let errorTracker = ErrorTracker()
        let toRegisterScene = input.registerTrigger.do(onNext: self.navigator.toRegister)
        return Output(error: errorTracker.asDriver(), toRegisterScene: toRegisterScene)
       
    }
}
