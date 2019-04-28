//
//  MainCoordinator.swift
//  CoordinatorDemo
//
//  Created by TING YEN KUO on 2019/4/24.
//  Copyright © 2019 TING YEN KUO. All rights reserved.
//

import UIKit

final class MainCoordinator: BaseCoordinator {
    
    private let tabBarVC: UITabBarController
    private let window: UIWindow
    private var afterOnboarding = false
    
    let coordinator1: TabBarOneCoordinator
    let coordinator2: TabBarTwoCoordinator
    let coordinator3: TabBarThreeCoordinator
    let coordinator4: TabBarFourCoordinator
    
    public var finishFlow: (() -> Void)?
    
    init(window: UIWindow) {
        self.window = window
        self.tabBarVC = UITabBarController()
        
        let oneNVC = UINavigationController()
        let twoNVC = UINavigationController()
        let threeNVC = UINavigationController()
        let fourNVC = UINavigationController()
        
        self.coordinator1 = TabBarOneCoordinator(navigationController: oneNVC)
        self.coordinator2 = TabBarTwoCoordinator(navigationController: twoNVC)
        self.coordinator3 = TabBarThreeCoordinator(navigationController: threeNVC)
        self.coordinator4 = TabBarFourCoordinator(navigationController: fourNVC)
        
        coordinator1.start()
        coordinator2.start()
        coordinator3.start()
        coordinator4.start()
        
        tabBarVC.viewControllers = [
            oneNVC, twoNVC,
            threeNVC, fourNVC
        ]
    }
    
    override func start() {
        
        if afterOnboarding {
            pushMain()
        } else {
            showMain()
        }
    }
    
}

extension MainCoordinator {
    
    private func showMain() {
        window.rootViewController(tabBarVC)
            .makeKeyAndVisible()
    }
    
    private func pushMain() {
        window.swapRootViewControllerWithAnimation(newViewController: tabBarVC,
                                                   animationType: SwapRootVCAnimationType.push)
    }
}

extension MainCoordinator {
    
    @discardableResult
    public func afterOnboarding(_ afterOnboarding: Bool) -> Self {
        self.afterOnboarding = afterOnboarding
        return self
    }
}

// ----------------------------------------------------------------------------------
/// Coordinators
// MARK: - Coordinators
// ----------------------------------------------------------------------------------

final class TabBarOneCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let vc = MainVC()
        vc.coordinator = self
        vc.view.backgroundColor(.white)
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.featured, tag: 0)
        navigationController.pushViewController(vc, animated: false)
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

final class TabBarTwoCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let vc = UIViewController()
        vc.view.backgroundColor(.yellow)
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.downloads, tag: 0)
        navigationController.pushViewController(vc, animated: false)
    }
}

final class TabBarThreeCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let vc = UIViewController()
        vc.view.backgroundColor(.green)
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.contacts, tag: 0)
        navigationController.pushViewController(vc, animated: false)
    }
}

final class TabBarFourCoordinator: BaseCoordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let vc = UIViewController()
        vc.view.backgroundColor(.blue)
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.bookmarks, tag: 0)
        navigationController.pushViewController(vc, animated: false)
    }
}


