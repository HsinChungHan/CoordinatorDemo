//
//  PhoneValidationDoneVC.swift
//  CoordinatorDemo
//
//  Created by TING YEN KUO on 2019/4/27.
//  Copyright © 2019 TING YEN KUO. All rights reserved.
//

import UIKit
import SnapKit

final class PhoneValidationDoneVC: UIViewController {
    
    lazy var phoneLabel: UILabel = {
        var label = UILabel()
            .font(UIFont.systemFont(ofSize: 24))
            .text("\(coordinator?.phoneNumber ?? "unknown")")
        return label
    }()
    
    lazy var phonePincodeLabel: UILabel = {
        var label = UILabel()
            .font(UIFont.systemFont(ofSize: 24))
            .text("\(coordinator?.phonePincode ?? "unknown")")
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
            .font(UIFont.systemFont(ofSize: 24))
            .text("Validation done!")
        return label
    }()
    
    lazy var confirmButton: UIButton = {
        return UIButton()
            .title("Confirm", for: .normal)
            .backgroundColor(UIColor(rgb: 0x4d8fff))
            .cornerRadius(29)
            .clipsToBounds(true)
            .addTargetOnButton(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
    }()
    
    weak var coordinator: PhoneValidationCoordinator?
    
    @objc func confirmButtonTapped() {
        coordinator?.endPhoneValidation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title("Validation Done")
        view.backgroundColor(.white)
        
        setupViews()
    }
    
    func setupViews() {
        
        view.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.centerX.equalTo(view)
        }
        
        view.addSubview(phonePincodeLabel)
        phonePincodeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(phoneLabel.snp.bottom).offset(20)
            make.centerX.equalTo(view)
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(phonePincodeLabel.snp.bottom).offset(20)
            make.centerX.equalTo(view)
        }
        
        view.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { (make) in
            make.width.equalTo(207)
            make.height.equalTo(57)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view).offset(-78)
        }
    }
}




