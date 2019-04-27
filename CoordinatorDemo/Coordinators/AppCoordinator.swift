//
//  AppCoordinator.swift
//  CoordinatorDemo
//
//  Created by TING YEN KUO on 2019/4/24.
//  Copyright © 2019 TING YEN KUO. All rights reserved.
//

import UIKit

fileprivate enum LaunchInstructor: String {
    case onboarding = "onboarding"
    case main = "main"
    
    static func configure() -> LaunchInstructor {
        if let appLaunchStateString = DB[.appLaunchState] as? String, appLaunchStateString == "main" {
            return .main
        } else {
            return .onboarding
        }
    }
}

final class AppCoordinator: BaseCoordinator {
    private let window: UIWindow
    
    private var instructor: LaunchInstructor {
        return LaunchInstructor.configure()
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start(with option: DeepLinkOption?) {
        
        if let option = option {
            switch option {
            case .onboarding: runOnboardingFlow()
            case .main: runMainFlow()
            }
        } else {
            switch instructor {
            case .onboarding: runOnboardingFlow()
            case .main: runMainFlow()
            }
        }
    }
}

extension AppCoordinator {
    
    private func runOnboardingFlow() {
        let coordinator = OnboardingCoordinator(window: window)
        
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.start(with: DeepLinkOption.main)
            self?.removeDependency(coordinator)
            
            DB[.appLaunchState] = LaunchInstructor.main.rawValue
        }
        
        addDependency(coordinator)
        coordinator.start()
    }
    
    private func runMainFlow() {
        let coordinator = MainCoordinator(window: window)
        
        addDependency(coordinator)
        coordinator.start()
    }
}
