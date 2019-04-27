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
    
    public var finishFlow: (() -> Void)?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        showMain()
    }
    
    public func endOnboarding() {
        finishFlow?()
    }
    
}

extension MainCoordinator {
    
    private func showMain() {
        let vc = MainVC()
        navigationController.viewControllers = [vc]
        
        window.rootViewController(navigationController)
            .makeKeyAndVisibleWindow()
    }
}

