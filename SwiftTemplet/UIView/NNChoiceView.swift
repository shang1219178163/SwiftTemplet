//
//	NNChoiceView.swift
//	MacTemplet
//
//	Created by shang on 2020/06/08 11:29
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit

import SnapKit
        
///
class NNChoiceView: UIView {

    
    typealias ViewClick = (NNChoiceView, Int) -> Void;
    var viewBlock: ViewClick?;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label);
        addSubview(groupView);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10 {
            return;
        }
        if label.isHidden {
            groupView.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(10);
                make.left.equalToSuperview().offset(15);
                make.right.equalToSuperview().offset(-15);
                make.bottom.equalToSuperview().offset(-10);
            }
            return
        }
        
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5);
            make.left.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-10);
            make.height.lessThanOrEqualTo(25);
        }
        
        groupView.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(5);
            make.left.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-15);
            make.bottom.equalToSuperview().offset(-10);
        }
    }
    
    // MARK: - funtions
    func block(_ action: @escaping ViewClick) {
        self.viewBlock = action;
    }
    
        
    //MARK: - lazy
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "选择";
        view.textColor = .gray;
        view.font = UIFont.systemFont(ofSize: 12)
        
        view.numberOfLines = 1
        
        return view;
    }();
    
    lazy var groupView: NNButtonGroupView = {
        var view = NNButtonGroupView(frame: .zero)
        view.padding = 10;
        view.numberOfRow = 4;
        
        view.cornerRadius = 3.0
        view.fontSize = 12
        view.isMutiChoose = true;
        view.hasLessOne = true
        
        view.iconLocation = .rightBottom
        
        view.titleColor = .hexValue(0x999999)
        view.backgroudImage = UIImage(color: .hexValue(0xF3F3F3))

        view.selectedTitleColor = .systemBlue
        view.selectedBackgroudImage = UIImage(named: "btn_selected_multiple")!
        
        view.block({ (itemsView, sender) in
            if let btn = sender as UIButton? {
                print(btn.titleLabel?.text as Any, itemsView.selectedList.count, itemsView.selectedIdxList.count)

            }
        })
        return view;
    }()
}
