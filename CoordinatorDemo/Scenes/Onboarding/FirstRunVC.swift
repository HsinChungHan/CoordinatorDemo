//
//  FirstRunVC.swift
//  CoordinatorDemo
//
//  Created by TING YEN KUO on 2019/4/24.
//  Copyright © 2019 TING YEN KUO. All rights reserved.
//

import UIKit
import SnapKit

final class FirstRunVC: UIViewController {
    
    lazy var titleLabel: UILabel = {
        return UILabel()
            .font(UIFont.systemFont(ofSize: 24))
            .text("First Run！")
            .textColor(UIColor.white)
    }()
    
    lazy var startButton: UIButton = {
        return UIButton()
            .title("Start Now!", for: .normal)
            .backgroundColor(UIColor(rgb: 0x4d8fff))
            .cornerRadius(29)
            .clipsToBounds(true)
            .addTargetOnButton(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }()
    
    weak var coordinator: OnboardingCoordinator?
    
    @objc private func startButtonTapped() {
        startButton.isHidden(true)
        titleLabel.text("Please wait...")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.coordinator?.showRemoteNotificationPermission()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor(.darkGray)
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(400)
            make.centerX.equalTo(view)
        }
        
        view.addSubview(startButton)
        startButton.snp.makeConstraints { (make) in
            make.width.equalTo(207)
            make.height.equalTo(57)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).offset(-78)
        }
    }
}


