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
    
    fileprivate lazy var userTextField: UITextField = {
        let userTextField = UITextField()
        userTextField.placeholder = "请输入用户名"
        return userTextField
    }()
    
    fileprivate lazy var pwdTextField: UITextField = {
        let pwdTextField = UITextField()
        pwdTextField.placeholder = "请输入密码"
        return pwdTextField
    }()
    
    fileprivate lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("登录", for: .normal)
        loginButton.backgroundColor = UIColor.orange
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
    
    func setup() -> Void {
        
        setNavgation()
        
        setUI()
    }
    
    func setNavgation() -> Void {
        navigationItem.title = "登录"
        view.backgroundColor = UIColor.white
    }
    
    func setUI() -> Void {
        view.addSubview(userTextField)
        view.addSubview(pwdTextField)
        view.addSubview(loginButton)
    }
    
    func setConstraints() -> Void {
        userTextField.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(kNavHeight + kTopMargin)
            make.left.equalTo(view).offset(kTopMargin)
            make.right.equalTo(view).offset(-kTopMargin)
        }
        
        pwdTextField.snp.makeConstraints { (make) in
            make.left.right.equalTo(userTextField)
            make.top.equalTo(userTextField.snp.bottom).offset(kTopMargin)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(pwdTextField.snp.bottom).offset(40)
            make.left.equalTo(view).offset(40)
            make.right.equalTo(view).offset(-40)
            make.height.equalTo(44)
        }
    }
    
    
}
