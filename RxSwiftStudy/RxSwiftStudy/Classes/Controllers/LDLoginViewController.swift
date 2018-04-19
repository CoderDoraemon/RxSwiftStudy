//
//  LDLoginViewController.swift
//  RxSwiftStudy
//
//  Created by 文刂Rn on 2018/4/18.
//  Copyright © 2018年 Apple. All rights reserved.
//

import UIKit
import SnapKit

let kNavHeight = 64

let kLiftMargin = 30
let kTopMargin = 30
let kLoginButtonHeight = 44


class LDLoginViewController: UIViewController {
    
    /// MARK 用户名
    fileprivate lazy var userTextField: UITextField = {
        var userTextField = UITextField()
        userTextField.placeholder = "请输入用户名"
        userTextField.borderStyle = .roundedRect
        userTextField.font = UIFont.systemFont(ofSize: 14)
        return userTextField
    }()
    
    
    /// MARK 密码
    fileprivate lazy var pwdTextField: UITextField = {
        var pwdTextField = UITextField()
        pwdTextField.placeholder = "请输入密码"
        pwdTextField.borderStyle = .roundedRect
        pwdTextField.font = UIFont.systemFont(ofSize: 14)
        return pwdTextField
    }()
    
    
    /// MARK 登录
    fileprivate lazy var loginButton: UIButton = {
        var loginButton = UIButton()
        loginButton.setTitle("登录", for: .normal)
        loginButton.backgroundColor = UIColor.lightGray
        loginButton.isEnabled = false
        loginButton.layer.cornerRadius = 5;
        loginButton.layer.masksToBounds = true
        return loginButton
    }()
    
    
    
}

extension LDLoginViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
}

extension LDLoginViewController {
    
    func setup() {
        
        setNavgation()
        
        setUI()
        
        setConstraints()
    }
    
    func setNavgation() {
        navigationItem.title = "登录"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(rightBarButtonItemClick))
        view.backgroundColor = UIColor.white
    }
    
    func setUI() {
        view.addSubview(userTextField)
        view.addSubview(pwdTextField)
        view.addSubview(loginButton)
    }
    
    func setConstraints() {
        userTextField.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(kNavHeight + kTopMargin)
            make.left.equalTo(view).offset(kTopMargin)
            make.right.equalTo(view).offset(-kTopMargin)
            make.height.equalTo(30)
        }
        
        pwdTextField.snp.makeConstraints { (make) in
            make.left.right.height.equalTo(userTextField)
            make.top.equalTo(userTextField.snp.bottom).offset(kTopMargin)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(pwdTextField.snp.bottom).offset(40)
            make.left.equalTo(view).offset(40)
            make.right.equalTo(view).offset(-40)
            make.height.equalTo(44)
        }
    }
    
    @objc func rightBarButtonItemClick() {
        navigationController?.pushViewController(LDRegisterViewController(), animated: true)
    }
}
