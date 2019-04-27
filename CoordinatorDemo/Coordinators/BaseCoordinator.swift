//
//  BaseCoordinator.swift
//  CoordinatorDemo
//
//  Created by TING YEN KUO on 2019/4/24.
//  Copyright © 2019 TING YEN KUO. All rights reserved.
//

import Foundation

enum DeepLinkOption {
    case onboarding
    case main
}

protocol Coordinator: class {
    func start()
    func start(with option: DeepLinkOption?)
}

class BaseCoordinator: Coordinator {
    
    private var childCoordinators: [Coordinator] = []
    
    public func start() {
        start(with: nil)
    }
    
    public func start(with option: DeepLinkOption?) {
        // for sub-class imp
    }
    
    public func addDependency(_ coordinator: Coordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }
    
    public func removeDependency(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false, let coordinator = coordinator else { return }
        
        // clear child-coordinators
        if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter { $0 !== coordinator }
                .forEach { coordinator.removeDependency($0) }
        }
        
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}


