//
//  PhoneValidationVC.swift
//  CoordinatorDemo
//
//  Created by TING YEN KUO on 2019/4/27.
//  Copyright © 2019 TING YEN KUO. All rights reserved.
//

import UIKit
import SnapKit

final class PhoneValidationVC: UIViewController {
    
    lazy var phoneTextField: UITextField = {
        var tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 24)
        tf.placeholder = "  Please input your phone number..."
        return tf
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
        guard let phoneNumber = phoneTextField.text, !phoneNumber.isEmpty else {
            return
        }
        
        coordinator?.phoneNumber = phoneNumber
        coordinator?.showPhoneCodeValidation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title("Phone Validattion")
        view.backgroundColor(.white)
        
        setupViews()
    }
    
    func setupViews() {
        
        view.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints { (make) in
            make.center.equalTo(view)
            make.height.equalTo(25)
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

