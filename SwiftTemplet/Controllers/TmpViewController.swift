
//
//  TmpViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/9/18.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class TmpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(btn)
        btn.frame = CGRectMake(10, 10, 100, 45);
//        addLineDashLayer(color: UIColor.theme, width: 1, cornerRadius: 0, view:btn)
        
        view.addSubview(couponView)
        couponView.frame = CGRectMake(10, 60, 100, 45);
        couponView.setNeedsLayout();
        
        itemView.items = NSArray.range(0, 2, 1).map({ (index) in
            "\(index)"
        })

        
        itemViewOne.items = NSArray.range(0, 8, 1).map({ (index) in
            "\(index)"
        })

        view.addSubview(containView)
        createBtnBarItem("Next") { (reco, view, idx) in
            self.emergencyOpenView.show();
        }
        
        view.getViewLayer()
    }
    /// 增加虚线边框
    @objc func getLineCGPath(view: UIView, type:Int = 0) -> CGPath {
        assert(CGRect.zero.equalTo(view.bounds) == false);
        
//        let ctx = UIGraphicsGetCurrentContext()
//        ctx?.beginPath()
        let mutablePath = CGMutablePath()

        switch type {
        case 1://左
//            ctx?.move(to: view.bounds.origin)
//            ctx?.addLine(to: CGPoint(x: 0, y: view.bounds.height))
            mutablePath.move(to: view.bounds.origin)
            mutablePath.addLine(to:  CGPoint(x: 0, y: view.bounds.height))

        case 2://下
//            ctx?.move(to: CGPoint(x: view.bounds.height, y: 0))
//            ctx?.addLine(to: CGPoint(x: view.bounds.width, y: 0))
            mutablePath.move(to: CGPoint(x: view.bounds.height, y: 0))
            mutablePath.addLine(to: CGPoint(x: view.bounds.width, y: 0))

        case 3://右
//            ctx?.move(to: CGPoint(x: view.bounds.width, y: 0))
//            ctx?.addLine(to: CGPoint(x: view.bounds.width, y: view.bounds.height))
            mutablePath.move(to: CGPoint(x: view.bounds.width, y: 0))
            mutablePath.addLine(to: CGPoint(x: view.bounds.width, y: view.bounds.height))
        default://上
//            ctx?.move(to: view.bounds.origin)
//            ctx?.addLine(to: CGPoint(x: view.bounds.width, y: 0))
            mutablePath.move(to: view.bounds.origin)
            mutablePath.addLine(to: CGPoint(x: view.bounds.width, y: 0))
        }

//        ctx?.closePath();
        return mutablePath;
    }
//    @objc func addLineDashLayer(color: UIColor = UIColor.red, width: CGFloat = 1, dashPattern: [NSNumber] = [NSNumber(4), NSNumber(2)], cornerRadius: CGFloat = 0, view: UIView) {
//        assert(CGRect.zero.equalTo(view.bounds) == false);
//
//        view.layer.borderColor = UIColor.clear.cgColor;
//        view.layer.borderWidth = 0;
//
//        let shapeLayer = CAShapeLayer();
//        shapeLayer.strokeColor = color.cgColor;
//        shapeLayer.fillColor = UIColor.clear.cgColor;
//
//        shapeLayer.frame = view.bounds;
//        shapeLayer.path = UIBezierPath(roundedRect: shapeLayer.frame, cornerRadius: cornerRadius).cgPath;
//
//        shapeLayer.lineWidth = width;
//        shapeLayer.lineDashPattern = dashPattern;
//        shapeLayer.lineCap = .square;
//        if cornerRadius > 0 {
//            view.layer.cornerRadius = cornerRadius;
//            view.layer.masksToBounds = true;
//        }
//        view.layer.addSublayer(shapeLayer);
//    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        btn.snp.makeConstraints { (make) in
//            make.top.equalToSuperview().offset(10);
//            make.left.equalToSuperview().offset(10);
//            make.width.equalTo(100);
//            make.height.equalTo(45);
//        }
        
        containView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(144);
            make.left.equalToSuperview().offset(36);
            make.right.equalToSuperview().offset(-36);
            make.bottom.equalToSuperview().offset(-160);
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
        
        btnCancel.snp.makeConstraints { (make) in
            make.left.equalToSuperview();
            make.width.equalToSuperview().multipliedBy(0.5);
            make.bottom.equalToSuperview();
            make.height.equalTo(50);
        }
        
        btnSure.snp.makeConstraints { (make) in
            make.left.equalTo(btnCancel.snp_right);
            make.width.equalToSuperview().multipliedBy(0.5);
            make.bottom.equalToSuperview();
            make.height.equalTo(50);
        }
        
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(openLab.snp_bottom).offset(5);
            make.left.equalTo(itemView);
            make.right.equalTo(itemView);
            make.bottom.equalTo(btnCancel.snp_top).offset(-5);
        }
        
        let itemViewOneH = itemViewOne.itemViewHeight();
        scrollView.contentSize = CGSize(width: itemView.sizeWidth, height: itemViewOneH)
        itemViewOne.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height)

//        DDLog(itemView.frame,scrollView.frame, scrollView.contentSize, itemViewOne.frame)
    }
    // MARK: -funtions

    //MRAK: - funtion
    @objc func handleActionControl(_ sender: UIButton) {
        DDLog(sender.titleLabel?.text as Any);
        if sender.titleLabel?.text == kTitleSure {
            
        }
    }
    
    //MARK: - layz
    lazy var containView: UIView = {
        let view = UIView(frame: .zero);
//        let view = UIView(frame: CGRect(x: 36, y: 144, width: UIScreen.sizeWidth - 36*2, height: UIScreen.sizeHeight - 144*2));
//        view.backgroundColor = UIColorRGBA(230, 230, 230, 1);
        
        view.addSubview(topLab)
        view.addSubview(plateLab)
        view.addSubview(itemView)
        view.addSubview(scrollView)
        view.addSubview(openLab)
        view.addSubview(btnCancel)
        view.addSubview(btnSure)
        
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
        btn.setTitle(kTitleCancell, for: .normal);
        btn.setTitleColor(UIColor.gray, for: .normal);
        btn.addTarget(self, action: #selector(handleActionControl(_:)), for:.touchUpInside);
        btn.tag = 1;

        return btn;
    }();
    
    lazy var btnSure: UIButton = {
        let btn = UIButton(type: .custom);
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        btn.setTitle(kTitleSure, for: .normal);
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
        view.isMutiChoose = true;
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
    
    lazy var emergencyOpenView: CCSEmergencyOpenView = {
        let view = CCSEmergencyOpenView(frame: .zero)
        view.block({ (openView, idx) in
            DDLog(idx);
        })
        return view;
    }()
    
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .custom);
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        btn.setTitle("测试按钮", for: .normal);
        btn.setTitleColor(UIColor.theme, for: .normal);
        return btn;
    }();
    
    lazy var couponView: NNLineDashView = {
        let view = NNLineDashView(frame: CGRectMake(10, 60, 100, 45));

        return view;
    }();
}
