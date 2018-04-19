//
//  LDHomeViewController.swift
//  RxSwiftStudy
//
//  Created by Apple on 2018/4/19.
//  Copyright © 2018年 文刂Rn. All rights reserved.
//

import UIKit
import RxDataSources
import SnapKit
import Kingfisher
import RxSwift

let kCellIdentifier = "kCellIdentifier"


class LDHomeViewController: UIViewController {

    fileprivate lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView(frame: CGRect.zero, style: .plain)
        return tableView
    }()
    
    var dataSource: RxTableViewSectionedReloadDataSource<LDSectionModel>?
    
    
}

extension LDHomeViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        self.dataSource = RxTableViewSectionedReloadDataSource<LDSectionModel>(configureCell: { (ds, tv, ip, item) -> UITableViewCell in
            
            let cell = tv.dequeueReusableCell(withIdentifier:kCellIdentifier) as! LDHomeCell
            
            cell.model = item
            
            return cell
        })
        
        tableView.rx.setDelegate(self).disposed(by: DisposeBag())
    }
    
}

extension LDHomeViewController: UITableViewDelegate {
    
}
