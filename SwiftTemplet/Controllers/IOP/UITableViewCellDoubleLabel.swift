//
//  UITableViewCellDoubleLabel.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/20.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKit

class UITableViewCellDoubleLabel: UITableViewCell {

    
    public var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)

    public var fixedSpacing: CGFloat = 0
    
    // MARK: -life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);

        contentView.addSubview(stackView)
        stackView.addArrangedSubviews([labView, labView1, labView2, labView3, labView4, labView5,])
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        guard bounds.height > 20 else { return }
        stackView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview().inset(inset)
        }
    }
    // MARK: -lazy
    lazy var stackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.spacing = 0
        view.axis = .vertical
        //子视图的高度或宽度保持一致
//        view.distribution = .fillProportionally
        view.distribution = .fillEqually
        return view
    }()
    
    lazy var labView: NNDoubleLabelView = {
        let view = NNDoubleLabelView(frame: .zero)
        view.labelLeft.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        view.labelLeft.textColor = .textColor3
        
        view.labelRight.text = ""
        
        return view
    }()
    
    lazy var labView1: NNDoubleLabelView = {
        let view = NNDoubleLabelView(frame: .zero)
        view.labelLeft.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.labelLeft.textColor = .textColor6
        view.labelLeft.text = ""

        view.labelRight.font = UIFont.systemFont(ofSize: 12, weight: .regular)

        return view
    }()
    
    lazy var labView2: NNDoubleLabelView = {
        let view = NNDoubleLabelView(frame: .zero)
        view.labelLeft.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.labelLeft.textColor = .textColor6
        view.labelLeft.text = ""

        view.labelRight.font = UIFont.systemFont(ofSize: 12, weight: .regular)

        return view
    }()
    
    lazy var labView3: NNDoubleLabelView = {
        let view = NNDoubleLabelView(frame: .zero)
        view.labelLeft.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.labelLeft.textColor = .textColor6
        view.labelLeft.text = ""

        view.labelRight.font = UIFont.systemFont(ofSize: 12, weight: .regular)

        return view
    }()
    lazy var labView4: NNDoubleLabelView = {
        let view = NNDoubleLabelView(frame: .zero)
        view.labelLeft.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.labelLeft.textColor = .textColor6
        view.labelLeft.text = ""

        view.labelRight.font = UIFont.systemFont(ofSize: 12, weight: .regular)

        return view
    }()
    
    lazy var labView5: NNDoubleLabelView = {
        let view = NNDoubleLabelView(frame: .zero)
        view.labelLeft.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        view.labelLeft.textColor = .textColor6
        view.labelLeft.text = ""

        view.labelRight.font = UIFont.systemFont(ofSize: 12, weight: .regular)

        return view
    }()

}

///
@objcMembers class NNDoubleLabelView: UIView {


    var block: ((NNDoubleLabelView, Int) -> Void)?
    
    var inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(labelLeft)
        addSubview(labelRight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10.0 {
            return
        }
        
        if labelRight.isHidden {
            labelLeft.snp.makeConstraints { (make) in
                make.edges.equalToSuperview().inset(inset)
            }
            return
        }
        
        let labelRightSize = labelRight.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: 20))
        labelRight.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top)
            make.right.equalToSuperview().offset(-inset.right)
//            make.bottom.equalToSuperview().offset(-inset.bottom)
            make.size.width.equalTo(labelRightSize.width)
        }
        
        labelLeft.snp.remakeConstraints { (make) in
            make.top.bottom.equalTo(labelRight)
            make.left.equalToSuperview().offset(inset.left)
            make.right.equalTo(labelRight.snp.left).offset(-kPadding)
        }
    }
    
    // MARK: - funtions
        
    //MARK: -lazy
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
        
        return view;
    }()
    
    lazy var labelLeft: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "请选择"
        view.textAlignment = .left
        return view;
    }()
    
    lazy var labelRight: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "请选择"
        view.textColor = .lightGray
        view.textAlignment = .right
        return view;
    }()
    
}
