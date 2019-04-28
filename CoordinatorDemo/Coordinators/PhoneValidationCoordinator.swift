//
//  PhoneValidationCoordinator.swift
//  CoordinatorDemo
//
//  Created by TING YEN KUO on 2019/4/27.
//  Copyright © 2019 TING YEN KUO. All rights reserved.
//

import UIKit

final class PhoneValidationCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    var finishFlow: (() -> Void)?
    
    var phoneNumber: String = ""
    var phonePincode: String = ""
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let vc = PhoneValidationVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    public func showPhoneCodeValidation() {
        let vc = PhoneCodeValidationVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    public func showPhoneValidationDone() {
        let vc = PhoneValidationDoneVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    public func endPhoneValidation() {
        finishFlow?()
    }
}

