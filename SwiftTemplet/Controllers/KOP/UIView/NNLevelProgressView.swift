//
//	NNLevelProgressView.swift
//	MacTemplet
//
//	Created by shang on 2020/08/11 15:12
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol NNLevelProgressViewDelegate{
    @objc func levelSliderView(_ view: NNLevelProgressView)
    
}
        
///
@objcMembers class NNLevelProgressView: UIView {

    weak var delegate: NNLevelProgressViewDelegate?

    typealias ViewClick = (NNLevelProgressView, Int) -> Void;
    var viewBlock: ViewClick?;
    
    var inset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

    //MARK: -lazy
    lazy var progress: UIProgressView = {
        let view: UIProgressView = UIProgressView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: 2))
        view.progressTintColor = .systemGreen
        view.trackTintColor = .white
        return view
    }()
    
    lazy var labelBegin: UILabel = {
        let view = UILabel(frame: .zero);
        view.font = UIFont.systemFont(ofSize: 13)
        view.text = "Lv.11";
        view.textColor = .lightGray;
        view.textAlignment = .left;
        return view;
    }()
    
    lazy var labelEnd: UILabel = {
        let view = UILabel(frame: .zero);
        view.font = UIFont.systemFont(ofSize: 13)
        view.text = "Lv.15";
        view.textColor = .lightGray;
        view.textAlignment = .right;
        return view;
    }()
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(progress)
        addSubview(labelBegin)
        addSubview(labelEnd)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10 {
            return;
        }
        
        progress.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalToSuperview().offset(-inset.right);
            make.height.equalTo(2);
        }
        
        labelBegin.snp.makeConstraints { (make) in
            make.top.equalTo(progress.snp.bottom).offset(0);
            make.left.equalTo(progress).offset(0);
            make.bottom.equalToSuperview().offset(-inset.bottom);
            make.width.equalTo(progress).multipliedBy(0.5)
        }
        
        labelEnd.snp.makeConstraints { (make) in
            make.top.equalTo(labelBegin).offset(0);
            make.left.equalTo(labelBegin.snp.right).offset(0);
            make.right.equalTo(progress).offset(0);
            make.bottom.equalTo(labelBegin).offset(0);
        }
        
    }
    
    // MARK: - funtions
    func block(_ action: @escaping ViewClick) {
        self.viewBlock = action;
    }
    
}
