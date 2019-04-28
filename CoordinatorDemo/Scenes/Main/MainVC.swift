//
//  MainVC.swift
//  CoordinatorDemo
//
//  Created by TING YEN KUO on 2019/4/24.
//  Copyright © 2019 TING YEN KUO. All rights reserved.
//

import UIKit

final class MainVC: UIViewController {
    
    lazy var settingItem: UIBarButtonItem = {
        var item = UIBarButtonItem(title: "pwd forget", style: UIBarButtonItem.Style.plain, target: self, action: #selector(settingItemTapped))
        return item
    }()
    
    weak var coordinator: TabBarOneCoordinator?
    
    @objc func settingItemTapped() {
        coordinator?.showPhoneValidation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title("Main Content")
        navigationItem.rightBarButtonItem(settingItem)
        
        view.backgroundColor(.white)
    }
}
