//
//  MainCoordinator.swift
//  CoordinatorDemo
//
//  Created by TING YEN KUO on 2019/4/24.
//  Copyright © 2019 TING YEN KUO. All rights reserved.
//

import UIKit

final class MainCoordinator: BaseCoordinator {
    
    lazy var navigationController: UINavigationController = {
        var nvc = UINavigationController()
        nvc.isNavigationBarHidden = false
        return nvc
    }()
    
    private let window: UIWindow
    private var afterOnboarding = false
    
    public var finishFlow: (() -> Void)?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        
        if afterOnboarding {
            pushMain()
        } else {
            showMain()
        }
    }
    
    public func showPhoneValidation() {
        let coordinator = PhoneValidationCoordinator(navigationController: navigationController)
        
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.navigationController.popToRootViewController(animated: true)
            self?.removeDependency(coordinator)
        }
        
        addDependency(coordinator)
        coordinator.start()
    }
    
}

extension MainCoordinator {
    
    private func showMain() {
        let vc = MainVC()
        vc.coordinator = self
        navigationController.viewControllers = [vc]
        
        window.rootViewController(navigationController)
            .makeKeyAndVisibleWindow()
    }
    
    private func pushMain() {
        let vc = MainVC()
        vc.coordinator = self
        navigationController.viewControllers = [vc]
        window.swapRootViewControllerWithAnimation(newViewController: navigationController,
                                                   animationType: SwapRootVCAnimationType.present)
    }
}

extension MainCoordinator {
    
    @discardableResult
    public func afterOnboarding(_ afterOnboarding: Bool) -> Self {
        self.afterOnboarding = afterOnboarding
        return self
    }
}

