
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
    
    lazy var segmentTitleView: NNSegmentTitleView = {
        let rect = CGRectMake(0, 0, 240, 44)
        let view = NNSegmentTitleView(frame: rect)
        view.lineColor = UIColor.red
        view.titleColor = UIColor.gray
        view.selectedTitleColor = UIColor.white
        view.items = ["昨天", "今天", "明天"]

        return view
    }()
    
    lazy var segmentTitleViewOne: NNSegmentTitleView = {
        let view = NNSegmentTitleView(frame: .zero)
        view.lineColor = UIColor.theme
        view.titleColor = UIColor.gray
        view.selectedTitleColor = UIColor.theme
        view.indicatorType = .box
        view.items = ["过去", "现在", "未来"]

        return view
    }()
        
    var progress: CGFloat = 0.0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.titleView = segmentTitleView
//        DDLog(segmentTitleView)
//        segmentTitleView.getViewLayer()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "present", style: .plain, target: self, action: #selector(handleActionItem(_:)))
        
        createGroupView();

        view.addSubview(segmentTitleViewOne)

        let list: [String] = ["1", "2", "3", "4", "5", "6",]
        let listOne = list.map { $0 + "_item" }
        DDLog(listOne)
        
        goodsToolView.titles = ["扩容", "减配", "续费"]
        view.addSubview(goodsToolView)
        
        view.addSubview(orderPayView)

        let amount = "¥\(227.00)"
        let string = "支付金额: \(amount)"
        
        let nsrange = (string as NSString).range(of: "¥227.00")
//        orderPayView.label.attributedText = NSAttributedString.attString(string, nsRange: nsrange, font: 18, textColor: UIColor.red)
        orderPayView.label.attributedText = NSAttributedString.attString(string, textTaps: ["¥227.00"], font: 14, tapFont: 18, color: UIColor.textColor3, tapColor: UIColor.red, alignment: .left)

//        view.getViewLayer()
        return;
  
        view.addSubview(clockView);
        
        
        progressView.frame = CGRect(x: 20, y: clockView.frame.maxY + 20, width: 100, height: 100)
        view.addSubview(progressView)
        
        view.getViewLayer();

        //元组
        let score = (java: 12.01, Swift: 34, c:"abcde", oc: 98)
        DDLog(score.java, score.Swift);
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        orderPayView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(50);
        }
        
        segmentTitleViewOne.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.bottom.equalTo(orderPayView.snp.top).offset(-10);
            make.height.equalTo(40);
        }
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
//        NNProgressHUD.showLoading(kNetWorkRequesting);
//        NNProgressHUD.showSuccess("success");
//        NNProgressHUD.showErrorText("fail");

    }

    @objc func handleActionItem(_ sender: UIBarButtonItem) {
    

    }
    
    @objc func showPopoverButtonAction(_ sender: UIButton) {

        /* 2 */
        //Configure the presentation controller
        let popoverContentVC = PopoverViewController()
        popoverContentVC.preferredContentSize = CGSize(width: kScreenWidth - 20, height: 400)
//        popoverContentVC.modalPresentationStyle = .popover
//        guard let popoverPresentationVC = popoverContentVC.popoverPresentationController else { return }
//        popoverPresentationVC.permittedArrowDirections = .up
//        popoverPresentationVC.sourceView = self.view
//        popoverPresentationVC.sourceRect = sender.frame
//        popoverPresentationVC.delegate = self
//        present(popoverContentVC, animated: true, completion: nil)        
        
        presentPopover(popoverContentVC, sender: sender, arrowDirection: .up, completion: nil)
    }
    
    lazy var goodsToolView: IOPGoodsToolView = {
        var view = IOPGoodsToolView(frame: .zero)
        view.padding = 10;
        view.numberOfRow = 5;

        return view;
    }()
    
    lazy var orderPayView: IOPOrderPayView = {
        var view = IOPOrderPayView(frame: .zero)

        return view;
    }()
    
    func createGroupView() {
        let list = Array<String>.itemPrefix(prefix: "按钮_", count: 16, type: 0);
        
        let rect = CGRect(x: 20, y: 20, width: kScreenWidth - 20.0*2, height: kScreenWidth - 20.0*2);
        let groupView = UIButton.createGroupView(rect, list: list!, numberOfRow: 4, padding: 5) { (control) in
            DDLog(control.tag);
            self.showPopoverButtonAction(control as! UIButton)
        }

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
    
    lazy var datePicker: NNDatePicker = {
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

extension FourthViewController: UIPopoverPresentationControllerDelegate {

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
     
    func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        setAlphaOfBackgroundViews(1)
    }

    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        setAlphaOfBackgroundViews(0.7)
    }
}
