//
//	PKPointsCenterHeaderView.swift
//	MacTemplet
//
//	Created by shang on 2020/08/14 15:32
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol PKPointsCenterHeaderViewDelegate{
    @objc func pointsCenterHeaderview(_ view: PKPointsCenterHeaderView, sender: UIButton)
    
}
        
///
class PKPointsCenterHeaderView: UIImageView {
        
    weak var delegate: PKPointsCenterHeaderViewDelegate?

    var inset = UIEdgeInsets(top: 20, left: 12, bottom: 20, right: 12)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = .systemBlue
        isUserInteractionEnabled = true
        backgroundColor = .clear
        contentMode = .scaleToFill
        image = UIImage(named: "bg_gradient_blue_one")
        
        addSubview(label)
        addSubview(labelPoints)
        addSubview(btn)

        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        
        labelPoints.font = UIFont.systemFont(ofSize: 50)
        labelPoints.textColor = .white

        btn.setBackgroundImage(UIImage(named: "bg_point_exchange"), for: .normal)
        
        labelPoints.text = "12590"
        
        getViewLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10.0 {
            return;
        }
        
//        let height: CGFloat = bounds.height - inset.top - inset.bottom
//        let btnHeight: CGFloat = 21

        btn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(-inset.right);
            make.width.equalTo(90);
            make.height.equalTo(27);
        }
        
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalTo(btn.snp.left).offset(-10);
            make.height.equalTo(14);
        }
                
        labelPoints.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(5);
            make.left.equalTo(label).offset(0);
            make.right.equalTo(btn.snp.left).offset(-10);
            make.bottom.equalToSuperview().offset(-inset.bottom);
        }

    }
    
    // MARK: - funtions
        
    //MARK: - lazy
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "我的积分";
        view.textColor = .lightGray;
        view.textAlignment = .left;
        return view;
    }()
    
    lazy var labelPoints: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "0";
        view.textColor = .lightGray;
        view.textAlignment = .left;
        return view;
    }()
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 1;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
//        view.setTitle(kTitleSure, for: .normal);
//        view.setTitleColor(.systemBlue, for: .normal);
        view.addActionHandler({ (control) in
            if let sender = control as? UIButton {
                self.delegate?.pointsCenterHeaderview(self, sender: sender)
            }

        }, for: .touchUpInside)
        return view;
    }();
        
}
