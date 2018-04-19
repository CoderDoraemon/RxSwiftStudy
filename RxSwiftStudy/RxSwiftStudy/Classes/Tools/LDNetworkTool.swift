//
//  LDNetworkTool.swift
//  RxSwiftStudy
//
//  Created by Apple on 2018/4/19.
//  Copyright © 2018年 文刂Rn. All rights reserved.
//

import Foundation
import Moya
import RxSwift




enum LDNetworkTool {
    
    enum LDNetworkToolCategory: String {
        case all     = "all"
        case android = "Android"
        case ios     = "iOS"
        case welfare = "福利"
    }
    case data(type: LDNetworkToolCategory, size: Int, index: Int)
}

extension LDNetworkTool: TargetType {
    
    var baseURL: URL {
        return URL(string: "http://gank.io/api/data/")!
    }
    
    var path: String {
        switch self {
        case .data(let type, let size, let index):
            return "\(type.rawValue)/\(size)/\(index)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
        
    var parameters: [String: Any]? {
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var sampleData: Data {
        return "测试数据".utf8Encoded
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}


// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}

