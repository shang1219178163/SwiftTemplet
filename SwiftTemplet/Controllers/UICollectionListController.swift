//
//  UICollectionListController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/11.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import HandyJSON
import MJRefresh

class UICollectionListController: UIViewController{

    //MARK: -lazy
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .grouped, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var list: [[[String]]] = {
        return [
            [["UICollectionMultipleSectionController", "多布局展示", ],
            ["NNCollectionViewHorizontalController", "重构", ],
            ["UICollectionViewCardController", "卡片样式", ],
            ["UICollectionDispalyController", "UICollectionView展示", ],
            ["UICollectionBatchUpdateController", "UICollectionView批量更新", ],
            ["UICollectionTagsController", "tags", ],
            ],
        ]
    }()
    

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        edgesForExtendedLayout = []
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .action, action: { item in
            UIApplication.shared.openURL(URL(string: "wx.parkingwang.com://")!)
        })
        
        let btn = UIButton(type: .custom)
        btn.setTitle("Next", for: .normal)
        btn.addActionHandler { (control) in
            DDLog(control)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        
        view.addSubview(tableView)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
                
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    

    
    // MARK: -funtions


}

extension UICollectionListController: UITableViewDataSource, UITableViewDelegate{
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
        
//        if #available(iOS 10.0, *) {
//            let circleSize = CGSize(width: tableView.rowHeight - 10, height: tableView.rowHeight - 10)
//            let renderer = UIGraphicsImageRenderer(bounds: CGRect(x: 0, y: 0, width: circleSize.width, height: circleSize.height))
//
//            let circleImage = renderer.image{ ctx in
//                UIColor.red.setFill()
//                ctx.cgContext.setFillColor(UIColor.random.cgColor)
//                ctx.cgContext.addEllipse(in: CGRect(x: 0, y: 0, width: circleSize.width, height: circleSize.height))
//                ctx.cgContext.drawPath(using: .fill)
//            }
//            cell.imageView?.image = circleImage
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
        return 10;
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
