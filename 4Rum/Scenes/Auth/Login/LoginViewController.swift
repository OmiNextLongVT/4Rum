//
//  LoginViewController.swift
//  4Rum
//
//  Created by Ominext on 7/12/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import RxSwift
import RxCocoa

class LoginViewController: BaseViewController {
    private let disposeBag = DisposeBag()
    var containerNode : LoginViewControllerNode!
    var viewModel : LoginViewModel!
    init() {
        let container = LoginViewControllerNode()
        super.init(node: container)
        self.containerNode = container
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapRegisterButton = self.containerNode.registerButton.rx.tap.asDriver()
        //create input
        let input = LoginViewModel.Input(registerTrigger: tapRegisterButton)
        //create output
        let ouput = viewModel.transform(input: input)
        
        //Connect to UI
        ouput.toRegisterScene.drive().disposed(by: disposeBag)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
