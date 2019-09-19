//
//  CCSEmergencyOpenView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/9/18.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class CCSEmergencyOpenView: UIView {

    typealias ViewClick = (CCSEmergencyOpenView, Int) -> Void;
    var viewBlock: ViewClick?;
    
    var isDismissBlank = false;

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = UIScreen.main.bounds;
        
        itemView.items = NSArray.range(0, 2, 1).map({ (index) in
            "\(index)"
        })
        
        
        itemViewOne.items = NSArray.range(0, 8, 1).map({ (index) in
            "\(index)"
        })
        
        self.addSubview(containView);
        
        self.addActionClosure { (tap , view, idx) in
            if self.isDismissBlank == true {
                self.dismiss();
            }
        };
//        getViewLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        containView.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(170);
//            make.left.equalToSuperview().offset(36);
//            make.right.equalToSuperview().offset(-36);
//            make.bottom.equalToSuperview().offset(-160);
//        }
        
        containView.snp.makeConstraints { (make) in
            make.center.equalToSuperview();
            make.left.equalToSuperview().offset(36);
            make.right.equalToSuperview().offset(-36);
            make.height.equalTo((sizeWidth - 36*2)*1.2);
        }
        
        topLab.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(25);
        }
        
        plateLab.snp.makeConstraints { (make) in
            make.top.equalTo(topLab.snp_bottom).offset(10);
            make.left.equalTo(topLab);
            make.right.equalTo(topLab);
            make.height.equalTo(topLab);
        }
        
        let itemViewH = itemView.itemViewHeight();
        itemView.snp.makeConstraints { (make) in
            make.top.equalTo(plateLab.snp_bottom).offset(5);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(itemViewH);
        }
        
        openLab.snp.makeConstraints { (make) in
            make.top.equalTo(itemView.snp_bottom).offset(10);
            make.left.equalTo(topLab);
            make.right.equalTo(topLab);
            make.height.equalTo(topLab);
        }
        
        let btnWidth = (sizeWidth - 36*2 - 1)*0.5;
        btnCancel.snp.makeConstraints { (make) in
            make.left.equalToSuperview();
            make.width.equalTo(btnWidth);
            make.bottom.equalToSuperview();
            make.height.equalTo(45);
        }
        
        lineVer.snp.makeConstraints { (make) in
            make.left.equalTo(btnCancel.snp_right);
            make.bottom.equalToSuperview();
            make.width.equalTo(1);
            make.height.equalTo(btnCancel);
        }
        
        btnSure.snp.makeConstraints { (make) in
            make.left.equalTo(lineVer.snp_right);
            make.bottom.equalTo(btnCancel);
            make.width.height.equalTo(btnCancel);
        }
        
        lineHor.snp.makeConstraints { (make) in
            make.bottom.equalTo(btnCancel.snp_top).offset(-1);
            make.width.equalToSuperview();
            make.height.equalTo(1);
        }
        
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(openLab.snp_bottom).offset(5);
            make.left.equalTo(itemView);
            make.right.equalTo(itemView);
            make.bottom.equalTo(btnCancel.snp_top).offset(-5);
        }
        
        
        let itemViewOneH = itemViewOne.itemViewHeight();
        scrollView.contentSize = CGSize(width: sizeWidth - (36+10)*2, height: itemViewOneH)
        itemViewOne.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height)
       
//        DDLog(itemView.frame, scrollView.frame, scrollView.contentSize, itemViewOne.frame)
  
        containView.layer.cornerRadius = 5;
        containView.layer.masksToBounds = true;
    }

    //MRAK: - funtion

    func show() -> Void {
        UIApplication.shared.keyWindow?.addSubview(self);
        
        containView.transform = containView.transform.scaledBy(x: 0.1, y: 0.1)
        UIView.animate(withDuration: 0.15, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.5);
            self.containView.transform = CGAffineTransform.identity;
            
        }, completion: nil);
    }
    
    func dismiss() -> Void {
        UIView.animate(withDuration: 0.15, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0);
            self.containView.transform = self.containView.transform.scaledBy(x: 0.1, y: 0.1)

        }) { (isFinished) in
            self.removeFromSuperview();
            
        }
    }
    
    @objc func handleActionControl(_ sender: UIButton) {
        DDLog(sender.titleLabel?.text as Any);
        self.dismiss();
        if self.viewBlock != nil {
            self.viewBlock!(self, sender.tag)
        }
        if sender.titleLabel?.text == kActionTitle_Sure {
            
        }
    }
    
    
    func block(_ action:@escaping ViewClick) -> Void {
        self.viewBlock = action;
    }
    
    //MARK: - layz
    lazy var containView: UIView = {
        let view = UIView(frame: .zero);
        //        let view = UIView(frame: CGRect(x: 36, y: 144, width: UIScreen.sizeWidth - 36*2, height: UIScreen.sizeHeight - 144*2));
        //        view.backgroundColor = UIColorRGBA(230, 230, 230, 1);
        view.backgroundColor = UIColor.white;
        view.addSubview(topLab)
        view.addSubview(plateLab)
        view.addSubview(itemView)
        view.addSubview(scrollView)
        view.addSubview(openLab)
        view.addSubview(btnCancel)
        view.addSubview(btnSure)
        view.addSubview(lineHor)
        view.addSubview(lineVer)

        return view;
    }();
    
    // MARK: -lazy
    lazy var topLab: UILabel = {
        let lab = UILabel()
        lab.text = "紧急开闸"
        lab.textAlignment = .center
        lab.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return lab;
    }()
    
    lazy var plateLab: UILabel = {
        let lab = UILabel()
        lab.text = "选择车牌:"
        lab.font = UIFont.systemFont(ofSize: 16)
        
        return lab;
    }()
    
    lazy var openLab: UILabel = {
        let lab = UILabel()
        lab.text = "开闸理由:"
        lab.font = UIFont.systemFont(ofSize: 16)
        return lab;
    }()
    
    lazy var btnCancel: UIButton = {
        let btn = UIButton(type: .custom);
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        btn.setTitle(kActionTitle_Cancell, for: .normal);
        btn.setTitleColor(UIColor.gray, for: .normal);
        btn.addTarget(self, action: #selector(handleActionControl(_:)), for:.touchUpInside);
        btn.tag = 0;
        
        return btn;
    }();
    
    lazy var btnSure: UIButton = {
        let btn = UIButton(type: .custom);
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        btn.setTitle(kActionTitle_Sure, for: .normal);
        btn.setTitleColor(UIColor.theme, for: .normal);
        btn.addTarget(self, action: #selector(handleActionControl(_:)), for:.touchUpInside);
        btn.tag = 1;
        
        return btn;
    }();
    
    lazy var itemView: NNItemsView = {
        var view = NNItemsView(frame: .zero)
        view.isMutiChoose = false;
        view.padding = 12;
        view.numberOfRow = 2;
        view.cornerRadius = 3;
        view.selectedIdxList = [0]

        view.block({ (itemsView, sender) in
            if let btn = sender as? UIButton {
                print(btn.titleLabel?.text as Any)
                
            }
        })
        return view;
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.addSubview(itemViewOne)
        return view;
    }()
    
    lazy var itemViewOne: NNItemsView = {
        var view = NNItemsView(frame: .zero)
        view.isMutiChoose = false;
        view.padding = 12;
        view.numberOfRow = 2;
        view.cornerRadius = 3;
        view.selectedIdxList = [0]
        view.block({ (itemsView, sender) in
            if let btn = sender as? UIButton {
                print(btn.titleLabel?.text as Any)
                
            }
        })
        return view;
    }()
    
    lazy var lineHor: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.line;
        return view;
    }()
    
    lazy var lineVer: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.line;
        return view;
    }()
}

