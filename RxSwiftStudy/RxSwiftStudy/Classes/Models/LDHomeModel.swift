//
//  LDHomeModel.swift
//  RxSwiftStudy
//
//  Created by Apple on 2018/4/19.
//  Copyright © 2018年 文刂Rn. All rights reserved.
//

import UIKit
import HandyJSON
import RxDataSources

struct LDHomeModel: HandyJSON {
    
    var _id         = ""
    var createdAt: String   = ""
    var desc: String        = ""
    var publishedAt: String = ""
    var source: String      = ""
    var type: String        = ""
    var url: String        = ""
    var used: String        = ""
    var who: String         = ""
    
}

struct LDSectionModel {
    var items: [Item]
}

extension LDSectionModel: SectionModelType {
    
    typealias Item = LDHomeModel
    
    init(original: LDSectionModel, items: [LDSectionModel.Item]) {
        self = original
        self.items = items
    }
}


