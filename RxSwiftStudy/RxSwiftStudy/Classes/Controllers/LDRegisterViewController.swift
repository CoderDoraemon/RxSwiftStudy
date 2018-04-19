//
//  LDRegisterViewController.swift
//  RxSwiftStudy
//
//  Created by Apple on 2018/4/19.
//  Copyright © 2018年 文刂Rn. All rights reserved.
//

import UIKit
import SnapKit


class LDRegisterViewController: UIViewController {
    
    /// MARK 手机号码
    fileprivate lazy var phoneTextField: UITextField = {
        var phoneTextField = UITextField()
        phoneTextField.placeholder = "请输入手机号码"
        phoneTextField.borderStyle = .roundedRect
        phoneTextField.font = UIFont.systemFont(ofSize: 14)
        phoneTextField.keyboardType = .numberPad
        phoneTextField.clearButtonMode = .whileEditing
        return phoneTextField
    }()
    
    
    /// MARK 验证码
    fileprivate lazy var codeTextField: UITextField = {
        var codeTextField = UITextField()
        codeTextField.placeholder = "请输入验证码"
        codeTextField.borderStyle = .roundedRect
        codeTextField.font = UIFont.systemFont(ofSize: 14)
        codeTextField.keyboardType = .numberPad
        codeTextField.clearButtonMode = .whileEditing
        return codeTextField
    }()
    
    
    /// MARK 获取验证码
    fileprivate lazy var getCodeButton: UIButton = {
        var getCodeButton = UIButton()
        getCodeButton.setTitle("获取验证码", for: .normal)
        getCodeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        getCodeButton.setTitleColor(UIColor.blue, for: .normal)
        return getCodeButton
    }()
    
    /// MARK 注册
    fileprivate lazy var registerButton: UIButton = {
        var registerButton = UIButton()
        registerButton.setTitle("注册", for: .normal)
        registerButton.backgroundColor = UIColor.lightGray
        registerButton.isEnabled = false
        registerButton.layer.cornerRadius = 5;
        registerButton.layer.masksToBounds = true
        return registerButton
    }()
    
}

extension LDRegisterViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
}

extension LDRegisterViewController {
    
    func setup() {
        
        setNavgation()
        
        setUI()
        
        setConstraints()
    }
    
    func setNavgation() {
        navigationItem.title = "登录"
        view.backgroundColor = UIColor.white
    }
    
    func setUI() {
        view.addSubview(phoneTextField)
        view.addSubview(codeTextField)
        view.addSubview(getCodeButton)
        view.addSubview(registerButton)
    }
    
    func setConstraints() {
        phoneTextField.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(kNavHeight + kTopMargin)
            make.left.equalTo(view).offset(kTopMargin)
            make.right.equalTo(view).offset(-kTopMargin)
            make.height.equalTo(30)
        }
        
        getCodeButton.snp.makeConstraints { (make) in
            make.right.height.equalTo(phoneTextField)
            make.top.equalTo(phoneTextField.snp.bottom).offset(kTopMargin)
            make.width.equalTo(100)
        }
        
        codeTextField.snp.makeConstraints { (make) in
            make.left.height.equalTo(phoneTextField)
            make.centerY.equalTo(getCodeButton.snp.centerY)
            make.right.equalTo(getCodeButton.snp.left)
        }
        
        registerButton.snp.makeConstraints { (make) in
            make.top.equalTo(codeTextField.snp.bottom).offset(30)
            make.height.equalTo(44)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(150)
        }
    }
    
    
}
