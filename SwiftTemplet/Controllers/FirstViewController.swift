//
//  FirstViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import HandyJSON
import MJRefresh

class FirstViewController: UIViewController{

    //MARK: -lazy
    lazy var tableView: UITableView = {
        let view: UITableView = UITableView.create(self.view.bounds, style: .plain, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var tipView: NNNetWorkOfflineView = {
        let view = NNNetWorkOfflineView(frame: .zero)
        return view
    }()
    
    lazy var list: [[[String]]] = {
        var array: [[[String]]] = [
            [["UITableViewCellOneListController", "列表滑动隐藏导航栏", ],
             ["UICollectionFlowStyleController", "FlowLayoutStyle", ],
             ["ConstraintArrayDSLController", "Snapkit 扩展", ],
             ["ChatInputController", "聊天输入框", ],
             ["NNInstructionViewController", "NNInstructionView", ],
             ["FoldSectionListController", "Swift折叠列表", ],
             ["NNLeftRightTableViewController", "Swift极简左右联动", ],
             ["LeftRightTableViewController", "极简左右联动", ],
             ["AlerSheetStudyController", "AlerSheet自定义", ],
             ["ExampleViewController", "Banner通知视图", ],
             ["PopoverViewExampleController", "PopoverView", ],
             ["ScrollLabelController", "ScrollLabel", ],
             ["AddShadowViewController", "addShadow", ],
             ],
            [["GreenViewController", "转场动画缩放", ],
             ["RedViewController", "转场动画下拉上推", ],
             ],
            [["TableSectionCornerListController", "OC section 圆角", ],
             ],
        ]
        return array
    }()
    

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        view.backgroundColor = .white;

        createBarItem( .action, isLeft: true) { (sender: AnyObject) in
            UIApplication.shared.openURL(URL(string: "wx.parkingwang.com://")!)
        }
        
        let btn = UIButton.create(title: "next", textColor: .white, backgroundColor: .theme)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        btn.addActionHandler { (control) in
            DDLog(control)
            control.isSelected.toggle()
//            self.tipView.isHidden = control.isSelected
            if control.isSelected {
                self.tipView.show()
            } else {
                self.tipView.dismiss()
            }
        }
        view.addSubview(tableView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
//        DDLog("viewWillAppear")

//        let string = "[[\"\\u9655A91D6P\"]]";
//        let obj = JSONSerialization.jsonObjectFromString(string);
//        DDLog(obj)
//        NSObject.printChengfaBiao()
//        tableView.nextResponder(UIWindow.self, isPrint: true)
        
//        let image = UIImage(color: .white)
//        DDLog(image.cgImage)
        
        let encryptText = NSString.encryptAES(withPlainText: "AABBCC测试数据")
        let decryptText = NSString.decryptAES(withCipherText: encryptText)
        DDLog(decryptText)
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

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        let controller = CellListController()
//        navigationController?.pushViewController(controller, animated: true);
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -funtions
    func addTo (adder: Int) -> (Int) -> Int{
        return { num  in
            return num + adder
        }
    }
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "cell1", style: .subtitle);
        cell.textLabel!.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel!.textColor = UIColor.theme;

        cell.textLabel!.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.textColor = UIColor.gray;
        cell.accessoryType = .disclosureIndicator;
        
        let itemList = list[indexPath.section][indexPath.row]
        cell.textLabel!.text = itemList[1]
//        cell.textLabel!.text = NSLocalizedString(itemList[1], comment: "")
        cell.textLabel!.text = Bundle.localizedString(forKey: itemList[1])

        cell.detailTextLabel?.text = itemList[0];
        
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
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0.01;
//    }
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
}


//@objc public extension UITableView{
//    
//    func addSectionRoundCorner(_ radius: CGFloat = 10, cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cell.selectionStyle = .none;
//        cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
//        // 设置cell 背景色为透明
//        cell.backgroundColor = UIColor.clear
//        
////        // 圆角角度
////        let radius: CGFloat = 10
//        // 获取显示区域大小
//        let bounds: CGRect = cell.bounds.insetBy(dx: 10, dy: 0)
//        // 获取每组行数
//        let rowNum: Int = self.numberOfRows(inSection: indexPath.section)
//        // 贝塞尔曲线
//        var bezierPath: UIBezierPath?
//        if rowNum == 1 {
//            // 一组只有一行（四个角全部为圆角）
//            bezierPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: radius, height: radius))
//            
//        } else {
//            if indexPath.row == 0 {
//                // 每组第一行（添加左上和右上的圆角）
//                bezierPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: radius, height: radius))
//            } else if indexPath.row == rowNum-1 {
//                // 每组最后一行（添加左下和右下的圆角）
//                bezierPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: radius, height: radius))
//            } else {
//                // 每组不是首位的行不设置圆角
//                bezierPath = UIBezierPath(rect: bounds)
//            }
//        }
//
//        // 创建两个layer
//        let normalLayer = CAShapeLayer()
//        let selectLayer = CAShapeLayer()
//        // 把已经绘制好的贝塞尔曲线路径赋值给图层，然后图层根据path进行图像渲染render
//        normalLayer.path = bezierPath?.cgPath
//        selectLayer.path = bezierPath?.cgPath
//        
//        // 设置填充颜色
//        normalLayer.fillColor = UIColor.white.cgColor
//        normalLayer.strokeColor = UIColor.white.cgColor
//        cell.layer.insertSublayer(normalLayer, at: 0)
//    }
//}
