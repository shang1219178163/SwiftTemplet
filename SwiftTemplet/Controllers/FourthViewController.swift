
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
    
    lazy var rightBtn: UIButton = {
        let button = UIButton.create(.zero, title: "展示", imgName: nil, type: 1)
        button.sizeToFit()
        button.addActionHandler({ (control) in
            self.showPopoverAction(control as! UIButton)
            
        }, for: .touchUpInside)
        return button
    }()
    
    lazy var itemView: NNItemsView = {
        var view = NNItemsView(frame: .zero)
        
        var list: [String] = []
        for i in 0...4 {
            list.append("\(i)")
        }
        view.items = list
        view.showStyle = .topRightToLeft
        
        view.block({ (itemsView, sender) in
            guard let btn = sender as? UIButton else { return }
            print(btn.titleLabel?.text as Any)
            self.showPopoverAction(btn)

        })
        return view;
    }()
    
    lazy var processingView: NNProcessingView = {
        var view = NNProcessingView(frame: .zero)
        
        var list: [String] = []
        for i in 0...2 {
            list.append("\(i)")
        }
        view.items = ["昨天", "今天", "明天"]
        view.contentInset = UIEdgeInsetsMake(0, 50, 0, 50)
        view.padding = 60
        view.index = 1
        return view;
    }()
    
    lazy var segmentCtl: NNSegmentedControl = {
        let rect = CGRectMake(0, 0, 240, 44)
        let view = NNSegmentedControl(frame: rect)
        view.showStyle = .bottomLine
        view.normalColor = .gray
        view.selectedColor = .white
        view.itemList = ["昨天", "今天", "明天"]
        view.addActionHandler({ (control) in
            guard let sender = control as? UISegmentedControl else { return }
            DDLog(sender)
            self.fliterView.show()

        }, for: .valueChanged)
        return view;
    }()
    
    lazy var fliterView: IOPCouponFliterDropView = {
        let view = IOPCouponFliterDropView(frame: self.view.bounds)
        view.parController = self;
//        view.delegate = self;
        
        let model0 = NNSectionDataModel()
        model0.title = "券类别"
        model0.items = ["全部", "自定义", "预定义"]
        model0.cellHeight = 50
        
        let model1 = NNSectionDataModel()
        model1.title = "券类型"
        model1.items = ["全部", "时长", "金额", "次数", "时间段", "折扣"]
        model1.cellHeight = 100

        view.list = [model0, model1]
        return view;
    }()
    
    lazy var pickView: NNPopListView = {
        var view = NNPopListView(frame: .zero)
        view.title = "请选择"
//        view.tips = "新年快乐!"
        view.itemList = [["11111", "123"],
                        ["22222", "234"],
                        ["33333", "456"],
                    ]
        view.block({ (view, indexP) in
            DDLog(indexP.string)
            let cellItem = view.itemList![indexP.row]
            
        })
        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero)
        view.addLongPressMenuItems()
//        UIMenuController.shared.menuItems = menuItems
        view.text = "这是一调测试信息"
        
        view.backgroundColor = UIColor.background
        return view
    }()
    
    let menuItems: [UIMenuItem] = [
        UIMenuItem(title: "One", action: Selector(("oneMethod:"))),
        UIMenuItem(title: "Two", action: Selector(("twoMethod:"))),
        UIMenuItem(title: "Three", action: Selector(("threeMethod:")))
    ]
        
    var progress: CGFloat = 0.0;

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        navigationItem.titleView = segmentCtl
                
//        createGroupView();

        view.addSubview(itemView)
        view.addSubview(processingView)

        view.addSubview(goodsToolView)
        view.addSubview(orderPayView)

        view.addSubview(fliterView)
        
        view.addSubview(label)

//        processingView.isHidden = true

        let amount = "¥\(227.00)"
        let string = "支付金额: \(amount)"
        
//        let nsrange = (string as NSString).range(of: "¥227.00")
//        orderPayView.label.attributedText = NSAttributedString.attString(string, nsRange: nsrange, font: 18, textColor: UIColor.red)
        orderPayView.label.attributedText = NSAttributedString.attString(string, textTaps: ["¥227.00"], font: 14, tapFont: 18, color: UIColor.textColor3, tapColor: UIColor.red, alignment: .left)

//        view.addSubview(clockView)
        
//        progressView.frame = CGRect(x: 20, y: clockView.frame.maxY + 20, width: 100, height: 100)
//        view.addSubview(progressView)
        
        view.getViewLayer();

        //元组
//        let score = (java: 12.01, Swift: 34, c:"abcde", oc: 98)
//        DDLog(score.java, score.Swift);
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height: CGFloat = 90
        
        if view.bounds.width < 400 {
            return
        }
        
        itemView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(height);
        }
        
        orderPayView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(50);
        }
        
        goodsToolView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.bottom.equalTo(orderPayView.snp.top).offset(-10);
            make.height.equalTo(40);
        }
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(itemView.snp.bottom).offset(20);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(40);
        }
        
//        DDLog(view.bounds, view.subviews)

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

    @objc func showPopoverAction(_ sender: UIButton) {
        let popoverContentVC = SimpleListController()
        popoverContentVC.preferredContentSize = CGSize(width: kScreenWidth - 20, height: 400)
        popoverContentVC.delegate = self
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
        view.titles = ["扩容", "减配", "续费"]
        view.delegate = self
        
        return view;
    }()
    
    lazy var orderPayView: IOPOrderPayView = {
        var view = IOPOrderPayView(frame: .zero)

        return view;
    }()
    
    func createGroupView() {
        let list = Array<String>.itemPrefix(prefix: "按钮_", count: 12, type: 0);
        
        let rect = CGRect(x: 20, y: 20, width: kScreenWidth - 20.0*2, height: kScreenWidth - 20.0*2);
        let groupView = UIButton.createGroupView(rect, list: list!, numberOfRow: 4, padding: 5) { (control) in
            DDLog(control.tag);
            self.showPopoverAction(control as! UIButton)
        }

        view.addSubview(groupView);
    }
        
    lazy var clockView: NNClockView = {
        var view = NNClockView(frame: CGRect(x: 20, y: 20, width: kScreenWidth - 40, height: kScreenWidth - 40));
        view.itemList = ["111","222","333","444","555","666","777","888",];
        view.backgroundColor = .random;
        view.image = UIImage(named: "beach");
        
        view.aniDuration = 12;
        view.animRotation(isClockwise: true, duration: view.aniDuration, repeatCount: MAXFLOAT, key: nil);
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
//        setAlphaOfBackgroundViews(1)
    }

    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
//        setAlphaOfBackgroundViews(0.7)
    }
}

extension FourthViewController: TableViewSelectDelegate {
    func tableViewSelect(_ tableView: UITableView, indexPath: IndexPath) {
        DDLog(indexPath.string)
    }
    

}

extension FourthViewController: IOPGoodsToolViewDelegate{
    
    func goodsToolView(_ sender: UIButton) {
        self.pickView.show()
    }
}

///编辑菜单谁响应谁实现响应的方法
@objc public extension UILabel{

    @objc func oneMethod(_ sender: UIMenuController) {
        DDLog("Action One")
    }

    @objc func twoMethod(_ sender: UIMenuController) {
      DDLog("Action Two")
    }

    @objc func threeMethod(_ sender: UIMenuController) {
      DDLog("Action Three")
    }
}


//@objc extension UIMenuItem {
//    /// UIControl 添加回调方式
//    public func create(title: String, action: @escaping ((UIMenuItem) -> Void)) -> UIMenuItem {
//        let item = UIMenuItem(title: title, action: #selector(p_handleAction(_:)))
//
//        objc_setAssociatedObject(self, RuntimeKeyFromSelector(self, aSelector: #function), action, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//        return item
//    }
//
//    /// 点击回调
//    private func p_handleAction(_ sender: UIMenuItem) {
//        guard let block = objc_getAssociatedObject(self, RuntimeKeyFromSelector(self, aSelector: #selector(create(title:action:)))) as? ((UIMenuItem) -> Void) else { return }
//        block(sender)
//    }
//
//    convenience init(title: String, block: @escaping ((UIMenuItem) -> Void)) {
//        self.init()
//        self.title = title
//        self.action = #selector(p_handleAction(_:))
//    }
//}
