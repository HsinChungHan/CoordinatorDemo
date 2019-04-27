//
//  RemoteNotificationPermissionVC.swift
//  CoordinatorDemo
//
//  Created by TING YEN KUO on 2019/4/24.
//  Copyright © 2019 TING YEN KUO. All rights reserved.
//

import UIKit

final class RemoteNotificationPermissionVC: UIViewController {
    
    lazy var titleLabel: UILabel = {
        return UILabel()
            .font(UIFont.systemFont(ofSize: 24))
            .text("Please accept Push-Notification Access")
            .textColor(UIColor.black)
    }()
    
    lazy var okButton: UIButton = {
        return UIButton()
            .title("Yes", for: .normal)
            .backgroundColor(UIColor(rgb: 0x4d8fff))
            .cornerRadius(29)
            .clipsToBounds(true)
            .addTargetOnButton(self, action: #selector(okButtonTapped), for: .touchUpInside)
    }()
    
    weak var coordinator: OnboardingCoordinator?
    
    @objc private func okButtonTapped() {
        okButton.isHidden(true)
        titleLabel.text("Please wait...")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.coordinator?.showLocationPermission()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor(.white)
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(400)
            make.centerX.equalTo(view)
        }
        
        view.addSubview(okButton)
        okButton.snp.makeConstraints { (make) in
            make.width.equalTo(207)
            make.height.equalTo(57)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).offset(-78)
        }
    }
}
