//
//	NNUserLevelInfoView.swift
//	MacTemplet
//
//	Created by shang on 2020/08/11 11:20
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol NNUserLevelInfoViewDelegate{
    @objc func userLevelInfoview(_ view: NNUserLevelInfoView)
    
}
        
///
@objcMembers class NNUserLevelInfoView: UIView {

    weak var delegate: NNUserLevelInfoViewDelegate?

    typealias ViewClick = (NNUserLevelInfoView, Int) -> Void;
    var viewBlock: ViewClick?
    
    var inset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)

    //MARK: -lazy
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
        view.contentMode = .scaleAspectFit

        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "王小懒";
        view.textColor = .lightGray;
        view.textAlignment = .left;
        view.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return view;
    }()
    
    lazy var labelSub: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "当前经验值：1156，距离Lv.16还差80经验值";
        view.textColor = .lightGray;
        view.textAlignment = .left;
        view.font = UIFont.systemFont(ofSize: 12, weight: .thin)

        return view;
    }()
    
    lazy var btnLevel: UIButton = {
        let view = UIButton(type: .custom);
        view.titleLabel?.font = UIFont.systemFont(ofSize: 11);
        view.setTitle("Lv.18 达人车侠", for: .normal);
        view.setTitleColor(UIColor.hexValue(0x814f0b), for: .normal);
        view.setBackgroundImage(UIImage(named: "bg_level_desc"), for: .normal)
        view.addActionHandler({ (control) in
            if let sender = control as? UIButton {
                self.viewBlock!(self,sender.tag);
            }

        }, for: .touchUpInside)
        return view;
    }()
    
    var levelValue: Int = 0
    var levelNext: Int = 1
    var levelAbsence: Int = 0
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imgView)
        addSubview(label)
        addSubview(labelSub)
        addSubview(btnLevel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10.0 {
            return;
        }
        
        let height = bounds.height - inset.top - inset.bottom
        imgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(inset.top);
            make.left.equalToSuperview().offset(inset.left);
            make.width.height.equalTo(height);
        }
        
        let labelSize = label.sizeThatFits(.zero)
        label.snp.remakeConstraints { (make) in
            make.top.equalTo(imgView).offset(10);
            make.left.equalTo(imgView.snp.right).offset(10);
            make.width.equalTo(ceil(labelSize.width));
            make.height.equalTo(20);
        }
        
        let levelSize = btnLevel.sizeThatFits(.zero)
        btnLevel.snp.remakeConstraints { (make) in
            make.centerY.equalTo(label)
            make.left.equalTo(label.snp.right).offset(10);
            make.width.equalTo(ceil(levelSize.width));
            make.height.equalTo(18);
        }
        
        labelSub.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(10);
            make.left.equalTo(label).offset(0);
            make.right.equalToSuperview().offset(-inset.right)
            make.height.equalTo(label);
        }
        
    }
    
    // MARK: - funtions
    func block(_ action: @escaping ViewClick) {
        self.viewBlock = action;
    }

    ///更新等级描述
    func updateLevelDesc() {
        let taps = ["\(self.levelValue)", "\(self.levelAbsence)",]
        let text = "当前经验值：\(taps[0])，距离 Lv.\(self.levelNext) 还差 \(taps[1]) 经验值";
        let attString = NSAttributedString.attString(text, textTaps: taps, font: 12, tapFont: 12, color: UIColor.hexValue(0x7F808F), tapColor: UIColor.hexValue(0xF0C09B), alignment: .left)
        labelSub.attributedText = attString
    }
        

}
