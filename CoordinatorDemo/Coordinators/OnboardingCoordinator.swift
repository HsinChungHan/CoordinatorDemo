//
//  OnboardingCoordinator.swift
//  CoordinatorDemo
//
//  Created by TING YEN KUO on 2019/4/24.
//  Copyright © 2019 TING YEN KUO. All rights reserved.
//

import UIKit

final class OnboardingCoordinator: BaseCoordinator {
    
    lazy var navigationController: UINavigationController = {
        var nvc = UINavigationController()
        nvc.isNavigationBarHidden = true
        return nvc
    }()
    
    private let window: UIWindow
    
    public var finishFlow: (() -> Void)?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        showOnboarding()
    }
    
    public func showLocationPermission() {
        let vc = LocationPermissionVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    public func showRemoteNotificationPermission() {
        let vc = RemoteNotificationPermissionVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    public func endOnboarding() {
        finishFlow?()
    }
    
}

extension OnboardingCoordinator {
    
    private func showOnboarding() {
        let vc = FirstRunVC()
        vc.coordinator = self 
        
        navigationController.viewControllers = [vc]
        
        window.rootViewController(navigationController)
            .makeKeyAndVisibleWindow()
    }
}
