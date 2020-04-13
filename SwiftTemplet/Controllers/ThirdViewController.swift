
//
//  ThirdViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import HandyJSON
import Moya
import MJRefresh

class ThirdViewController: UIViewController{

    //MARK: -lazy
    lazy var list: [[[String]]] = {
        var array: [[[String]]] = [
            [["UISearchStylesController", "搜索🔍样式", ],
             ["UIStackViewController", "UIStackView", ],
             ["NNPictureViewController", "全屏图册", ],
             ["UIModalPresentationStyleController", "控制器呈现效果", ],
             ["NNPlateKeyboardController", "自定义车牌键盘重构", ],
             ["PlateKeybordController", "自定义车牌键盘", ],
             ["EntryViewController", "通用录入界面", ],
             ["CellListController", "自定义Cell界面", ],
             ["TitleViewController", "导航栏下拉菜单", ],
             ["NNButtonStudyController", "按钮研究", ],
             ["UICollectionDispalyController", "UICollectionView展示", ],
             ["UICollectionBatchUpdateController", "UICollectionView批量更新", ],
             ["PlateNumMainController", "NNTabController组件", ],
             ["NNTabViewController", "NNTabView组件", ],
             ["CustomViewController", "自定义View", ],
             ["CalendarViewController", "CalenderView", ],
             ["PickerViewController", "PickerView", ],
             ["PhotosViewController", "PictureView", ],
             ["ScrollHorizontalController", "重构", ],
             ["ScrollViewController", "分段组件", ],
             ["CCSCouponRecordController", "优惠券列表", ],
             ["NNFormViewController", "表单视图", ],
             ],
            [["TableViewPrefetchRowController", "image预先载入", ],
            ["AppIconChangeController", "App图标更换", ],
             ["NNUserLogInController", "RxSwift函数响应型编程", ],
             ["UIRecognizerUpdateController", "手势集合升级", ],
             ["UIRecognizerController", "手势集合", ],
             ["KeyBoardViewController", "KeyBoardView", ],
             ["TimerViewController", "Timer", ],
             ["ObserveViewController", "Observe", ],
             ["TestViewController", "新想法测试", ],
             ["IOPInvoiceCreateController", "折叠", ],
             
            ],
        ]
        return array
    }()
    
    var sectionTitles = ["视图相关", "其他"]
    
    let serialQueue = DispatchQueue(label: "Decode queue")
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBarItem( .action, isLeft: true) { (sender: AnyObject) in
            self.goController("FleetDetailControllerNew", obj: nil, objOne: nil)
        }
        
        createBarItem( .done, isLeft: false) { (sender: AnyObject) in
            self.goController("IOPAuthDetailController", obj: nil, objOne: nil)
        }
        
        tbViewGrouped.rowHeight = 50;
        view.addSubview(tbViewGrouped)
        tbViewGrouped.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.requestInfo()

        })
        tbViewGrouped.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {
            self.requestInfo()

        });
        
        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        let string = "[[\"\\u9655A91D6P\"]]";
        let obj = JSONSerialization.jsonObjectFromString(string);
        DDLog(obj)
//        NSObject.printChengfaBiao()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
                
//        let controller = CellListController()
//        navigationController?.pushViewController(controller, animated: true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -funtions
    func requestInfo() {
        NNProgressHUD.showLoading("努力加载中")
        let updateAPi = NNCheckVersApi()
        updateAPi.startRequest(success: { (manager, dic, error) in
            
            let data: Data! = try? JSONSerialization.data(withJSONObject: dic as Any, options: []);
            let jsonString: String! = String(data: data, encoding: .utf8);
            let string: String! = jsonString.replacingOccurrences(of: "\\", with: "")
            DDLog(string as Any)
//            if let response = NNCheckVersRootClass.deserialize(from: dic) {
            if let response = ESCheckVersRootClass.deserialize(from: dic) {
                DDLog(response)
            }
            NNProgressHUD.showSuccess("请求成功");
            self.tbViewGrouped.mj_header!.endRefreshing()
            self.tbViewGrouped.mj_footer!.endRefreshing()
        }) { (manager, dic, error) in
            DDLog(error! as Any)
            
        }

    }
    

    
}

extension ThirdViewController: UITableViewDataSource, UITableViewDelegate{
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
        
        if #available(iOS 10.0, *) {
            let circleSize = CGSize(width: tableView.rowHeight - 10, height: tableView.rowHeight - 10)
            let renderer = UIGraphicsImageRenderer(bounds: CGRect(x: 0, y: 0, width: circleSize.width, height: circleSize.height))

            let circleImage = renderer.image{ ctx in
                UIColor.red.setFill()
                ctx.cgContext.setFillColor(UIColor.random.cgColor)
                ctx.cgContext.addEllipse(in: CGRect(x: 0, y: 0, width: circleSize.width, height: circleSize.height))
                ctx.cgContext.drawPath(using: .fill)
            }
            cell.imageView?.image = circleImage
        }
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
        return 25;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if sectionTitles.count > section {
            return kBlankOne + sectionTitles[section]
        }
        return ""
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UIView();
//    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero);
        //        label.backgroundColor = .green;
        //        label.text = "header\(section)";
        return label;
    }
    
}

extension ThirdViewController: UITableViewDataSourcePrefetching{
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            serialQueue.async {
//                ///大图下采样
//                let downsampledImage = UIImage.downsample(images[indexPath.row])
//                DispatchQueue.main.async {
//                    self.update(at: indexPath, with: downsampledImage)
//                }
            }
        }
    }
    
}
