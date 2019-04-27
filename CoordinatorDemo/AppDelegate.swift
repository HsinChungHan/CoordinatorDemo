//
//  AppDelegate.swift
//  CoordinatorDemo
//
//  Created by TING YEN KUO on 2019/4/24.
//  Copyright © 2019 TING YEN KUO. All rights reserved.
//

import UIKit
import ChainsKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        runApplication()
        
        return true
    }
}

extension AppDelegate {
    
    private func runApplication() {
        let window = UIWindow()
        appCoordinator = AppCoordinator(window: window)
        appCoordinator.start()
        
        self.window = window
    }
}

