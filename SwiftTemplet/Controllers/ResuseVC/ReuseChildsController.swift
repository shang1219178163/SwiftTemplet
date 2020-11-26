//
//  ReuseChildsController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/29.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class ReuseChildsController: UIViewController {

    //MARK: - layz
    lazy var tableView: UITableView = {
        let table = UITableView(frame:self.view.bounds, style:.plain);
        table.rowHeight = 60
        table.dataSource = self;
        table.delegate = self;

        return table;
    }();
    
    lazy var list: [[[String]]] = {
        let array: [[[String]]] = [[
            ["NNCycleController", "NNCycleController", ],
            ["NNCycleStyle1Controller", "NNCycleStyle1Controller", ],
            ["NNCycleTabbarController", "NNCycleTabbar", ],
            ["NNPageSegmentViewController", "NNPageSegmentView", ],
            ["NNPageSegmentedControlController", "NNPageSegmentedControl", ],
            
            ["NNPageTitleViewController", "NNPageTitleView", ],
            
            ["NNScrollViewController", "NNScrollViewController", ],            
            ["PageTmpController", "继承NNPageController", ],
            ["NNParentTwoController", "HHTabBarController子类极简实现", ],
            ["NNParentController", "UUTabBarController子类极简实现", ],
            ["UUSementedController", "分段组件", ],
            ["NNParentOneController", "UUSementedController子类极简实现", ],
            ["UUTabBarController", "UUTabBarController", ],
            ["OOTabBarController", "OOTabBar", ],
            ["PlateNumMainController", "NNTabController组件", ],

            ],
        ]
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(tableView)
    }
    
}

extension ReuseChildsController: UITableViewDataSource, UITableViewDelegate{
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
        
        if ["SystemColorShowController"].contains(itemList.first!) {
            UIAlertController.showAlert(message: "@available(iOS 13.0, *)")
            return
        }
        
        let controller = UICtrFromString(itemList.first!)
        controller.title = itemList.last!
        navigationController?.pushViewController(controller, animated: true);
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if sectionTitles.count > section {
//            return kBlankOne + sectionTitles[section]
//        }
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
