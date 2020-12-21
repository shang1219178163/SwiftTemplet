//
//	PKParkDetailBottomView.swift
//	MacTemplet
//
//	Created by shang on 2020/07/24 15:08
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol PKParkDetailBottomViewDelegate{
    @objc func parkdetailbottomview(_ view: PKParkDetailBottomView, sender: UIButton)
    
}
        
///
@objcMembers class PKParkDetailBottomView: UIView {

    weak var delegate: PKParkDetailBottomViewDelegate?

    typealias ViewClick = (PKParkDetailBottomView, Int) -> Void;
    var viewBlock: ViewClick?;
    
    
    let leftTitles = ["周边", "收藏", "分享", ]
    let rightTitles = ["路线", "导航"]
                
    var interitemSpacing: CGFloat = 10{
        willSet{
            setNeedsLayout()
        }
    }

    var inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10){
        willSet{
            setNeedsLayout()
        }
    }
    
    var btnCollect: NNButton {
        return self.items.filter { $0.tag == 1 }.first!
    }
        
    lazy var items: [NNButton] = {
        return self.updateItems(self.leftTitles.count + self.rightTitles.count, type: NNButton.self) {
            $0.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
            switch $0.tag {
            case 0:
                $0.direction = .top
                $0.labelHeight = 17

                $0.titleLabel?.font = UIFont.systemFont(ofSize: 10)
                $0.setTitleColor(.textColor6, for: .normal)
                $0.setTitle("周边", for: .normal)
                $0.setImage(UIImage(named: "icon_search"), for: .normal)
            case 1:
                $0.direction = .top
                $0.labelHeight = 17

                $0.titleLabel?.font = UIFont.systemFont(ofSize: 10)
                $0.setTitleColor(.textColor6, for: .normal)

                $0.setTitle("收藏", for: .normal)
                $0.setImage(UIImage(named: "icon_collect_no"), for: .normal)
                $0.setImage(UIImage(named: "icon_collect_yes"), for: .selected)

            case 2:
                $0.direction = .top
                $0.labelHeight = 17

                $0.titleLabel?.font = UIFont.systemFont(ofSize: 10)
                $0.setTitleColor(.textColor6, for: .normal)
                $0.setTitle("分享", for: .normal)
                $0.setImage(UIImage(named: "icon_share"), for: .normal)

            case 3:
                $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
                $0.setTitle("路线", for: .normal)
                $0.setTitleColor(.systemBlue, for: .normal)
                $0.layer.borderColor = UIColor.systemBlue.cgColor
                $0.layer.borderWidth = 1
                
            case 4:
                $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
                $0.setTitle("导航", for: .normal)
                $0.setTitleColor(.white, for: .normal)
                $0.setBackgroundImage(UIImage(color: .systemBlue), for: .normal)

            default:
                break
            }
        }
    }()
    
    @objc func handleAction(_ sender: UIButton) {
        delegate?.parkdetailbottomview(self, sender: sender)
    }
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 0.0 {
            return;
        }

        let leftItems: [UIButton] = items.filter { $0.tag <= 2}
        let rightItems: [UIButton]  = items.filter { $0.tag > 2 }

        leftItems.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: interitemSpacing, leadSpacing: inset.left, tailSpacing: bounds.midX)
        leftItems.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top)
            make.bottom.equalToSuperview().offset(-inset.bottom)
        }
        
        rightItems.snp.distributeViewsAlong(axisType: .horizontal, fixedSpacing: interitemSpacing, leadSpacing: bounds.midX + kPadding, tailSpacing: inset.right)
        rightItems.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top)
            make.bottom.equalToSuperview().offset(-inset.bottom)
        }
        
        let rightItemHeight = bounds.height - inset.top - inset.bottom
        rightItems.forEach { (sender) in
            sender.layer.cornerRadius = rightItemHeight*0.5
            sender.layer.masksToBounds = true
        }
    }
    
    // MARK: - funtions
    func block(_ action: @escaping ViewClick) {
        self.viewBlock = action;
    }
    
        
    //MARK: -lazy
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
        
        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "请选择";
        view.textColor = .lightGray;
        view.textAlignment = .center;
        return view;
    }();
    
    lazy var btnSure: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 1;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(.systemBlue, for: .normal);
        view.addActionHandler({ (sender) in
                
            self.viewBlock?(self, sender.tag);
        }, for: .touchUpInside)
        return view;
    }();
}
