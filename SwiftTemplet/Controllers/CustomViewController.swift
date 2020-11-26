//
//  CustomViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/19.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand
import Photos

class CustomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var list:[String] = []
        for i in 0...16 {
            list.append("\(i)")
        }
        
        itemView.frame = CGRect(x: 20, y: 20, width: kScreenWidth - 40.0, height: kScreenWidth - 40.0)
        itemView.items = list
        view.addSubview(itemView)
        
        var listNew:[String] = []
        for i in 0...12 {
            listNew.append("\(i)")
        }
        itemView.items = listNew
        
        var rect = CGRect.make(20, itemView.maxY+20, 80, 60)
//        rect = CGRect(x: 20, y: itemView.maxY+20, width: 60, height: 40)
        rect = CGRectMake(120, itemView.maxY+20, 80, 60)
        let btn = UIButton.create(.zero, title: "自定义", textColor: .white, backgroundColor: .clear)
        btn.setTitleColor( .white, for: .normal)
        btn.setBackgroundImage(UIImage(color: .theme), for: .normal)
        btn.setBackgroundImage(UIImage(color: .lightGray), for: .disabled)
        
        btn.addActionHandler({ (sender) in
            if let button = sender as? UIButton {
                DDLog(button.titleLabel?.text as Any)
                
                if self.operationView.type < 6 {
                    self.operationView.type += 1;

                } else {
                    self.operationView.type = 0
                    
                }
            }
        }, for: .touchUpInside)
        view.addSubview(btn)
        
//        btn.setBackgroundImage(UIImage(color:  .theme), for: .normal)

        view.addSubview(self.tipsView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tipsView.label.text = ""
        }
        
        view.addSubview(self.defaultView)
        view.addSubview(self.defaultViewFail)


        self.expandView.frame = CGRectMake(kX_GAP, defaultView.frame.maxY+20, UIScreen.sizeWidth - kX_GAP*2, 35)
        view.addSubview(self.expandView)
        
//        self.operationView.frame = CGRectMake(kX_GAP, view.bounds.maxY - 180 - kY_GAP, UIScreen.sizeWidth - kX_GAP*2, 180)
        view.addSubview(operationView)

        view.getViewLayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        operationView.type = Int(arc4random() % 6)

        DDLog(operationView.type)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        operationView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(kX_GAP)
            make.right.bottom.equalToSuperview().offset(-kX_GAP)
            make.height.equalTo(180)
        }
    }
    
    
    lazy var itemView: NNItemsView = {
        var view = NNItemsView(frame: .zero)
        view.padding = 10;
        view.numberOfRow = 4;
        view.block({ (itemsView, sender) in
            if let btn = sender as? UIButton {
                print(btn.titleLabel?.text as Any)

            }
        })
        return view;
    }()
    
    lazy var tipsView: NNTipsView = {
        let view = NNTipsView(frame: .zero)
        view.label.text = "无网络连接"
        return view
    }()
    
    lazy var expandView: NNExpandView = {
        let view = NNExpandView(frame: .zero)
        return view
    }()
    
    lazy var defaultView: NNCellSubtitleView = {
        let rect = CGRectMake(kX_GAP, kY_GAP, UIScreen.sizeWidth - kX_GAP*2, 70)
        let view = NNCellSubtitleView(frame: rect)
        //        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.labelLeft.font = UIFont.systemFont(ofSize: 15)
        view.labelSub.font = UIFont.systemFont(ofSize: 13)
        view.labelLeft.textColor = .white
        view.labelSub.textColor = .white
        
        view.imgViewLeft.image = UIImage(named: "img_meetStandard")
        view.labelLeft.text = "已达到补贴标注"
        view.labelSub.text = "请直接前往: T2地上车场/1号入口"
        //        view.backgroundColor = UIColor.green.withAlphaComponent(0.8)
        
        view.layer.cornerRadius = kPadding
        view.layer.masksToBounds = true
        
//        view.gradientLayer.colors = [UIColor.red.cgColor, UIColor.green.cgColor]
//        view.gradientLayer.colors = [UIColor.hex("#999999").withAlphaComponent(0.8).cgColor, UIColor.hex("#999999").cgColor]

        return view
    }()
    
    lazy var defaultViewFail: NNCellSubtitleView = {
        let rect = CGRectMake(kX_GAP, kY_GAP+150, UIScreen.sizeWidth - kX_GAP*2, 70)
        let view = NNCellSubtitleView(frame: rect)
        //        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.labelLeft.font = UIFont.systemFont(ofSize: 15)
        view.labelSub.font = UIFont.systemFont(ofSize: 13)
        view.labelLeft.textColor = .white
        view.labelSub.textColor = .white
        
        view.imgViewLeft.image = UIImage(named: "icon_fail")
        view.labelLeft.text = "未达到补贴标注"
        view.labelSub.text = "里程/用时不符合补贴标准"
        //        view.backgroundColor = UIColor.green.withAlphaComponent(0.8)
        
        view.layer.cornerRadius = kPadding
        view.layer.masksToBounds = true
        
        view.type = 0        
        return view
    }()
    
    lazy var operationView: NNOperationStateView = {
        let view = NNOperationStateView(frame: .zero)
        view.type = 0;
        
        return view
    }()
    
    
}
