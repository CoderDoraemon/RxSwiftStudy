//
//  LDRegisterVM.swift
//  RxSwiftStudy
//
//  Created by Apple on 2018/4/19.
//  Copyright © 2018年 文刂Rn. All rights reserved.
//

import UIKit
import Action
import RxSwift

class LDRegisterVM: NSObject {
    
    // 输入框
    let phoneNumber = Variable<String>("")
    let codeNumber = Variable<String>("")
    
    let disposeBag = DisposeBag()
    
    // 倒计时
    lazy var countNumberAction: Action<String, String> = {
        return Action<String, String> { input in
            return Observable<Int>.timer(0, period: 1, scheduler: MainScheduler.instance)
            .take(60)
                .map({ (pass) -> Int in
                    59 - pass
                })
                .map({ (remain) -> String in
                    return remain == 0 ? "获取验证码" : "重新获取 \(remain)"
                })
        }
    }()
    
    // 获取验证码
    

}
