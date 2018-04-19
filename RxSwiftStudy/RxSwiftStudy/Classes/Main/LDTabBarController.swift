//
//  LDTabBarController.swift
//  RxSwiftStudy
//
//  Created by Apple on 2018/4/19.
//  Copyright © 2018年 文刂Rn. All rights reserved.
//

import UIKit

class LDTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(childController: LDHomeViewController(), title: "主页")
        
        addChildViewController(childController: LDLoginViewController(), title: "登录")
        
    }
    
    func addChildViewController(childController: UIViewController, title: String) {
        
        childController.navigationItem.title = title
        
        let nav: LDNavigationController = LDNavigationController(rootViewController: childController)
        
        nav.tabBarItem.title = title;
        
        addChildViewController(nav)
    }
}


