//
//  LDHomeCell.swift
//  RxSwiftStudy
//
//  Created by Apple on 2018/4/19.
//  Copyright © 2018年 文刂Rn. All rights reserved.
//

import UIKit
import Kingfisher

class LDHomeCell: UITableViewCell {

    
    /// MARK 图片
    fileprivate var iconImageView: UIImageView = {
        
        let iconImageView = UIImageView()
        return iconImageView
    }()
    
    
    /// MARK 标题
    fileprivate var titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        return titleLabel
    }()
    
    
    /// MARK 子标题
    fileprivate var detailLabel: UILabel = {
        
        let detailLabel = UILabel()
        detailLabel.font = UIFont.systemFont(ofSize: 12)
        return detailLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /// MARK 数据模型
    var model: LDHomeModel? {
        didSet {
            iconImageView.kf.setImage(with: URL(string: (model?.url)!))
            titleLabel.text = "描述：\(String(describing: model?.desc))"
            detailLabel.text = "来源：\(String(describing: model?.source))"
        }
    }
    
}

extension LDHomeCell {
    
    func setup() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(detailLabel)
        
        setConstraints()
    }
    
    func setConstraints() {
        iconImageView.snp.makeConstraints { (make) in
            make.top.left.equalTo(contentView).offset(15)
            make.width.equalTo(contentView.snp.height)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(iconImageView.snp.right).offset(15)
            make.top.equalTo(iconImageView)
        }
        
        detailLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.bottom.equalTo(contentView)
        }
    }
}
