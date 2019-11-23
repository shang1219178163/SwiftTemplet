
//
//  FourthViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class FourthViewController: UIViewController {
    
//    var progressView:UIAnnularProgress?
    
    var progress: CGFloat = 0.0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        createGroupView();
        view.getViewLayer()
        
        createBtnBarItem("测试按钮", isLeft: false) { (reco, view, tag) in
            DDLog(view)

        }
        
        
        let list: [String] = ["1", "2", "3", "4", "5", "6",]
        let listOne = list.map { $0 + "_item" }
        DDLog(listOne)
        
        return;
  
        view.addSubview(clockView);
        
        
        progressView.frame = CGRect(x: 20, y: clockView.frame.maxY + 20, width: 100, height: 100)
        view.addSubview(progressView)
        
        view.getViewLayer();

        //元组
        let score = (java: 12.01, Swift: 34, c:"abcde", oc: 98)
        DDLog(score.java, score.Swift);
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        let names = ["Paula", "Elena", "Zoe"];
        var lastNameEndingInA: String?
        for name in names.reversed() where name.hasSuffix("a") {
            lastNameEndingInA = name
            break
        }
//        lastNameEndingInA;// Optional("Elena")”
//        NNProgressHUD.showText("111");
//        NNProgressHUD.showLoadingText(kNetWorkRequesting);
//        NNProgressHUD.showSuccessText("success");
//        NNProgressHUD.showErrorText("fail");

    }
    
    func createGroupView() {
        let list = Array<Any>.itemPrefix(prefix: "按钮_", count: 16, type: 0);
        
        let rect = CGRect(x: 20, y: 20, width: kScreenWidth - 20.0*2, height: kScreenWidth - 20.0*2);
        let groupView = UIView.createGroupView(rect, list: (list as! [String]), numberOfRow: 4, padding: 5, type: 2) { (tap, itemView, idx) in
       
            DDLog(idx);
           
        };
        
        view.addSubview(groupView);
    }
    
    lazy var clockView: NNClockView = {
        var view = NNClockView(frame: CGRect(x: 20, y: 20, width: kScreenWidth - 40, height: kScreenWidth - 40));
        view.itemList = ["111","222","333","444","555","666","777","888",];
        view.backgroundColor = .random;
        view.image = UIImage(named: "beach");
        
        view.aniDuration = 12;
        view.animRotation(isClockwise: true, duration: view.aniDuration!, repeatCount: MAXFLOAT, key: nil);
        view.layoutIfNeeded();//激活子视图动画
        
        view.layer.cornerRadius = view.frame.width/2.0;
        view.layer.masksToBounds = true;
        
        view.addActionClosure { (tap, sender, idx) in
            DDLog(sender);
            
        }
        return view
    }()
    
    
    lazy var progressView: NNAnnularProgress = {
        let progressView = NNAnnularProgress(frame: CGRect(x:50,y:kScreenWidth/2+40,width:100,height:100));
        progressView.backgroundColor = .cyan;
        return progressView;
    }();
    
    
    lazy var datePicker:NNDatePicker = {
        let view = NNDatePicker();
        view.block({ (sender, idx) in
            if idx == 1 {
                DDLog(view,sender.datePicker.date,idx);
                
            }
        })
        return view;
    }();
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        progress += 0.1
        if progress >= 1.0 {
            progress = 0
        }
        progressView.setProgress(progress: progress, time:0.6, animate: true)
        
    }
}
