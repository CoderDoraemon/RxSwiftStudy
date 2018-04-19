//
//  LDHomeVM.swift
//  RxSwiftStudy
//
//  Created by Apple on 2018/4/19.
//  Copyright © 2018年 文刂Rn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Moya
import NSObject_Rx
import PKHUD

protocol LDViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

enum LDRefreshStatus {
    case none
    case beingHeaderRefresh
    case endHeaderRefresh
    case beingFooterRefresh
    case endFooterRefresh
    case noMoreData
}

class LDHomeVM: NSObject {
    
    let models = Variable<[LDHomeModel]>([])
    
    var index: Int = 1
    
    let networkTool = MoyaProvider<LDNetworkTool>()
    
}


extension LDHomeVM: LDViewModelType {
    
    typealias Input = LDInput
    typealias Output = LDOutput
    
    struct LDInput {
        let category: LDNetworkTool.LDNetworkToolCategory
        
        init(category: LDNetworkTool.LDNetworkToolCategory) {
            self.category = category
        }
        
    }
    
    struct LDOutput {
        let sections: Driver<[LDSectionModel]>
        let requestCommond = PublishSubject<Bool>()
        let refreshStatus = Variable<LDRefreshStatus>(.none)
        
        init(sections: Driver<[LDSectionModel]>) {
            self.sections = sections
        }
    }
    
    func transform(input: LDHomeVM.LDInput) -> LDHomeVM.LDOutput {
        
        let sections = models.asObservable().map { (models) -> [LDSectionModel] in
            return [LDSectionModel(items: models)]
        }.asDriver(onErrorJustReturn: [])
        
        let output = LDOutput(sections: sections)
        
        output.requestCommond.subscribe(onNext: { [weak self] (isReloadData) in
            
            self?.index = isReloadData ? 1: (self?.index)! + 1
            
            networkTool.request(LDNetworkTool.data(type: input.category, size: 10, index: self?.index, callbackQueue: ConcurrentDispatchQueueScheduler, progress: nil, completion: <#T##Completion##Completion##(Result<Response, MoyaError>) -> Void#>)
            
        }).disposed(by: rx.disposeBag)
        return output
    }
}
