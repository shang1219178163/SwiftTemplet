//
//  FirstViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import Then

import HandyJSON
import MJRefresh

class FirstViewController: UIViewController{

    //MARK: -lazy
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var tipView: NNNetWorkOfflineView = {
        let view = NNNetWorkOfflineView(frame: .zero)
        return view
    }()
    
    lazy var annAlertView: NNAnnouncementAlertView = {
        let view = NNAnnouncementAlertView(frame: .zero)
        view.label.text = "关于增值功能免费升级及相关奖励 政策说明"
        view.labelSub.text = "2020-12-12 12:00:00"
        view.block = { annoView, sender in
            DDLog(sender.currentTitle)
        }
        return view
    }()
    
    
    lazy var list: [[[String]]] = {
        var array: [[[String]]] = [
            [["NNButtonStudyController", "Swift 按钮封装", ],
             ["NNButtonDispalyController", "OC 按钮封装", ],
             ["TextFieldViewController", "OC TextField下拉列表", ],
             ["PropertyWrapperController", "PropertyWrapper", ],            
             ["CryptoKitController", "Crypto加密", ],
             ["ProtocolChainController", "ProtocolChain", ],
             ["OptionWrappedController", "OptionWrapped", ],
             ["NavigationBarColorChangeController", "BaColorrChange", ],
             
            ],
            [["UITableViewCellOneListController", "列表滑动隐藏导航栏", ],
             ["PageDemoController", "PageDemo", ],
             ["CKShareDemoController", "CKShareDemo", ],
             ["PickerDemoController", "PickerDemo", ],
             ["DateDemoController", "DateTimeFormatter", ],


             ["AlertSheetStudyController", "AlertSheet自定义", ],
             ["ShowActivityController", "ShowActivity", ],
             ["GXSegmentPageViewExampleController", "GXSegmentPageView", ],
             ["QRCodeViewController", "二维码", ],
             ["TestScrollViewController", "TestScrollViewController", ],
             ["NNCellDefaultViewController", "NNCellDefaultView", ],
             ["UICollectionFlowStyleController", "FlowLayoutStyle", ],
             ["ConstraintArrayDSLController", "Snapkit 扩展", ],
             ["ChatInputController", "聊天输入框", ],
             ["NNInstructionViewController", "NNInstructionView", ],
             ["FoldSectionListController", "Swift折叠列表", ],
             ["NNLeftRightTableViewController", "Swift极简左右联动", ],
             ["LeftRightTableViewController", "极简左右联动", ],
             ["ExampleViewController", "Banner通知视图", ],
             ["PopoverViewExampleController", "PopoverView", ],
             ["ScrollLabelController", "ScrollLabel", ],
             ["AddShadowViewController", "addShadow", ],
             ["FourthViewController", "FourthView", ],
             ["TitleViewController", "TitleView", ],
             ["MainViewController", "Main", ],
             ],
            [["GreenViewController", "转场动画缩放", ],
             ["RedViewController", "转场动画下拉上推", ],
             ["SwipeRightToPopViewController", "左滑返回", ],
             ],
            [["TableSectionCornerListController", "OC section 圆角", ],
             ["TestWebViewController", "TestWebView", ],
             ["FeedbackGeneratorDemoController", "触感反馈", ],
             ["ForExampleController", "For stride", ],

            ]
        ]
        return array
    }()
    

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupExtendedLayout()
        edgesForExtendedLayout = [];
        view.backgroundColor = .white;

        createBarItem( .action, isLeft: true) { (sender: AnyObject) in
//            UIApplication.openURLString("wx.parkingwang.com://")
//            self.annAlertView.urlString = "http://h5-kop.dev.irainone.com/#/pages/SystemMsgDetails/Index"
//            self.annAlertView.show()
                        
            let vc = UIViewController()
            vc.view.backgroundColor = .lightOrange
            vc.view.addGestureTap { (reco) in
                vc.dismiss(animated: false, completion: nil)
            }
//            self.present(vc, animated: true) {
//                DDLog("A", self.presentingViewController, self.presentedViewController)
//                DDLog("B", vc.presentingViewController, vc.presentedViewController)
//            }
            
            guard let keyWindow = UIApplication.shared.keyWindow,
                  let rootVC = keyWindow.rootViewController
                  else { return }

            vc.present(true) {
                DDLog("vc", vc.presentingViewController, vc.presentedViewController)
                DDLog("B", rootVC.presentingViewController, rootVC.presentedViewController)
                
                vc.present()
            }

        }
        
        let btn = UIButton(type: .custom)
        btn.setTitle("Next", for: .normal)

        btn.sizeToFit()
        btn.frame = CGRectMake(0, 0, 80, 40)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        btn.addActionHandler { (sender) in
            DDLog(sender)
            sender.isSelected.toggle()
//            self.tipView.isHidden = control.isSelected
            if sender.isSelected {
                self.tipView.show()
            } else {
                self.tipView.dismiss()
            }
        }
        view.addSubview(tableView)
        
        navigationItem.rightBarButtonItems = UIBarButtonItem.createTitles(["黑色", "白色"], style: .plain, action: { (item) in
            if item.title == "黑色" {
                self.navigationController?.navigationBar.setColors(withTint: .lightText, background: .black)
                item.setTitleTextAttributes([NSAttributedString.Key.backgroundColor : UIColor.clear], for: .normal)
            } else {
                self.navigationController?.navigationBar.setColors(withTint: .black, background: .white)
                item.setTitleTextAttributes([NSAttributedString.Key.backgroundColor : UIColor.clear], for: .normal)
            }
        });
        
        
        let content = "分为两个界面，一个是部门架构，一个是公司 架构组织架构做了新的调整，分为两个界面，一个是部门架构，一个是公司架构组织架构做了新的调整，分为两个界面，一个是部门架构，一个是公司\n\t分为两个界面，一个是部门架构，一个是公司架构组织架构做了新的调整，分为两个界面，一个是部门架构，一个是公司架构组织架构做了新的调整，分为两个界面，一个是部门架构，一个是公司\n\t分为两个界面，一个是部门架构，一个是公司 架构组织架构做了新的调整，分为两个界面，一个是部门架构，一个是公司架构组织架构做了新的调整，分为两个界面，一个是部门架构，一个是公司\n\t分为两个界面，一个是部门架构，一个是公司架构组织架构做了新的调整，分为两个界面，一个是部门架构，一个是公司架构组织架构做了新的调整，分为两个界面，一个是部门架构，一个是公司\n\t"
        annAlertView.htmlString = content
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
            
        let layout = UICollectionViewFlowLayout().then {
            $0.minimumLineSpacing = 1
            $0.minimumInteritemSpacing = 2
            $0.itemSize = CGSize(width: 1, height: 2)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
//        DDLog("viewWillAppear")
        
        let z = (UIColor.white.cgColor == navigationController?.navigationBar.barTintColor?.cgColor)
        DDLog(z, UIColor.white, navigationController?.navigationBar.barTintColor)
        DDLog(z, UIColor.white.isDark, navigationController?.navigationBar.barTintColor?.isDark, navigationController?.navigationBar.tintColor?.isDark)
        
//        let string = "[[\"\\u9655A91D6P\"]]";
//        let obj = JSONSerialization.jsonObjectFromString(string);
//        DDLog(obj)
//        9.printChengfaBiao()
//        tableView.nextResponder(UIWindow.self, isPrint: true)
        
//        let image = UIImage(color: .white)
//        DDLog(image.cgImage)
        
//        let encryptText = NSString.encryptAES(withPlainText: "AABBCC测试数据")
//        let decryptText = NSString.decryptAES(withCipherText: encryptText)
//        DDLog(decryptText)
//        let encryptText = NSString.encryptAES256(withPlainText: "AABBCC测试数据")
//        let decryptText = NSString.decryptAES256(withCipherText: "AAAAQVFWRldSbGRTYkdSVFlrZFNWRmxyWkZOV1JteHk=")
//        DDLog(decryptText)
        
        
        let cal = Calculator()
        cal.add(5).add(8).print().multiply(2).print().divide(3).print()
//        cal.add(5).add(8).printResult().sub(2).printResult().clear().printResult();
        
//        Calculator.zz_makeCalcuclate { (make) in
//            make.add(10).sub(3).add(2).add(198).printResult;
//        }
        
//        view.nn_borderColor(UIColor.red).nn_borderWidth(5)

        let date = Date()
        let a = date.timeIntervalSince1970
        let b = Int(date.timeIntervalSince1970)
        DDLog(addTo(10)(1))
        
//        test()
//        print(buildString())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -funtions
    func addTo(_ value: Int) -> (Int) -> Int{
        return { num  in
            return num + value
        }
    }
    
    func test() {
        var dic = ["a": ["1", "2", "3",],]
        
        var list = dic["a"]
        list!.remove(at: 0)
        DDLog(list)
        DDLog(dic)
        
        dic["a"]!.remove(at: 0)
        DDLog(dic)
    }
    
    
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "cell1", style: .subtitle)

        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.textColor = .theme;

        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.textColor = .gray;
        cell.accessoryType = .disclosureIndicator;
        
        let itemList = list[indexPath.section][indexPath.row]
        cell.textLabel!.text = itemList[1]
//        cell.textLabel!.text = NSLocalizedString(itemList[1], comment: "")
        cell.textLabel!.text = Bundle.localizedString(forKey: itemList[1])

        cell.detailTextLabel?.text = itemList[0];
        
//        let weights: [UIFont.Weight] = [.ultraLight, .thin, .regular, .medium, .semibold, .bold, .heavy, .black]
//        if indexPath.row < weights.count {
//            cell.detailTextLabel!.font = UIFont(name: "PingFang SC", size: UIFont.labelFontSize)
//            cell.detailTextLabel!.font = cell.detailTextLabel!.font.withWeight(weights[indexPath.row])
//            DDLog(cell.detailTextLabel!.font.fontName)
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemList = list[indexPath.section][indexPath.row]
//        DDLog(itemList);
        let controller = UICtrFromString(itemList.first!)
        controller.title = itemList.last!
        navigationController?.pushViewController(controller, animated: true);
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.01;
    }

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let sectionView = UIView()
//        return sectionView
//    }
//
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == tableView.numberOfSections - 1 ? 10 : 0.01;
    }
//
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let label = UILabel(frame: .zero);
//        //        label.backgroundColor = .green;
//        //        label.text = "header\(section)";
//        return label;
//    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.addSectionRoundCorner(cell: cell, forRowAt: indexPath)
    }
    
    
    // 左侧按钮自定义
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let leftAction = UIContextualAction(style: .normal, title: "左侧") { (action, view, finished) in
            DDLog(action.title)

            finished(true)
        }
        leftAction.backgroundColor = .lightOrange

        let leftAction1 = UIContextualAction(style: .normal, title: "左侧1") { (action, view, finished) in
            DDLog(action.title)

            finished(true)
        }
        leftAction1.backgroundColor = .lightGreen
        return UISwipeActionsConfiguration(actions: [leftAction, leftAction1])
    }
    
    // 右侧按钮自定义
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "删除") { (action, view, finished) in
            self.list[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)

            // 回调告知执行成功，否则不会删除此行！！！
            finished(true)
        }
        
        let archiveAction = UIContextualAction(style: .normal, title: "归档") { (action, view, finished) in
            DDLog(action.title)
        }
        archiveAction.backgroundColor = .lightBlue

        return UISwipeActionsConfiguration(actions: [deleteAction, archiveAction])
    }
}


protocol Container{
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}


struct Stack<Element: Equatable>: Container {
    // Stack<Element> 的原始实现部分
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // Container 协议的实现部分
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}


extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}


protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}


extension Stack: SuffixableContainer {
    func suffix(_ size: Int) -> Stack {
        var result = Stack()
        for index in (count-size)..<count {
            result.append(self[index])
        }
        return result
    }
    // Inferred that Suffix is Stack.
}



//@resultBuilder
//struct StringBuilder {
//    // buildBlock中将多个值构建为一个结果
//    static func buildBlock(_ strs: String...) -> String {
//        // 以换行符拼接多个字符串
//        strs.joined(separator: "\n")
//    }
//
//    // if逻辑分支
//    static func buildEither(first component: String) -> String {
//        return "if \(component)"
//    }
//
//    // else逻辑分支
//    static func buildEither(second component: String) -> String {
//        return "else \(component)"
//    }
//}
//
//@StringBuilder
//func buildString() -> String {
//    "静夜思"
//    "唐•李白"
//    "床前明月光，疑是地上霜。"
//    "举头望明月，低头思故乡。"
//
//    if Bool.random() {
//        "一首诗"
//    } else {
//        "一首词"
//    }
//}

