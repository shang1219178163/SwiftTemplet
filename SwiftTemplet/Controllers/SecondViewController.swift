
//
//  SecondViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

import Alamofire
import SwiftExpand
import SDWebImage
import SnapKit

class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    let url = "https://httpbin.org/get";
    let kTips_Fleet = "·请选择车场及出\\入口后,开启车队模式\n·该功能需要arm3.5.4.0以上版本支持\n·如有需要请联系运维人员升级"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView);
        
        setupData();

    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        tableView.reloadData()
        
    }
    
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let foldModel = dataList[section] as! BNFoldSectionModel
        let count = foldModel.isOpen == true ? foldModel.dataList.count : 0;
        return count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    };
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let foldModel = dataList[indexPath.section] as! BNFoldSectionModel
        let obj = foldModel.dataList[indexPath.row]
        
        let cell = UITableViewCellFour.cellWithTableView(tableView) as! UITableViewCellFour;
        
        cell.labelLeft.text = String(format: "section_%d,row_%d", indexPath.section,indexPath.row);
        cell.type = 1
        cell.btn.addActionHandler({ (sender) in
            cell.btn.isSelected = !cell.btn.isSelected
        }, for: .touchUpInside)
        
        cell.getViewLayer()
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        DDLog(NSStringFromIndexPath(indexPath));
    
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let foldModel = dataList[section] as! BNFoldSectionModel
        return foldModel.headerHeight;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let foldModel = dataList[section] as! BNFoldSectionModel
        
        let view = UITableHeaderFooterViewZero.viewWithTableView(tableView) as! UITableHeaderFooterViewZero
        view.isCanOpen = foldModel.isCanOpen
        view.isOpen = foldModel.isOpen
        view.labelLeft.text = foldModel.title
        view.labelRight.text = "\(foldModel.dataList.count)"
        view.imgViewLeft.image = UIImageNamed(foldModel.image)
        UIView.animate(withDuration: kDurationDrop, animations: {
            view.indicatorView.transform = view.isOpen == true ? (view.indicatorView.transform.rotated(by: CGFloat(Double.pi/2))) : .identity;
        })
        view.block { (headerView: UITableHeaderFooterViewZero) in
            foldModel.isOpen = !foldModel.isOpen
            tableView.reloadSections([section], with: .fade)
            
        }

        view.getViewLayer()
        return view
        
//        let containView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: foldModel.headerHeight))
//        containView.backgroundColor = UIColor.background
//        containView.backgroundColor = foldModel.headerColor
//
//        let label = UILabel(frame: .zero);
//        label.frame = CGRect(x: 10, y: containView.frame.midY - 25/2.0, width: containView.frame.maxX - 20, height: 25)
//        label.backgroundColor = foldModel.headerColor;
//        label.text = foldModel.title;
//
//        containView.addSubview(label)

//        if [1,2].contains(section) {
//            containView.addActionHandler { (tap:UITapGestureRecognizer?, view:UIView, idx:Int) in
//                if foldModel.isCanOpen == true {
//                    foldModel.isOpen = !foldModel.isOpen
//                    tableView.reloadSections([section], with: .fade)
//                }
//            }
//            return containView;
//        }
//        return UIView();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let foldModel = dataList[section] as! BNFoldSectionModel
        return foldModel.footerHeight;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let foldModel = dataList[section] as! BNFoldSectionModel
        return sectionView(tableView, viewForSection: section, title: nil, isHeader: false);
    }
    
    private func sectionView(_ tableView: UITableView, viewForSection section: Int, title: String?, isHeader: Bool) -> UIView?{
        let sectionView = UIView()
        if title == nil {
            return sectionView
        }
        let label = UILabel(frame: CGRect(x: kX_GAP, y: 0, width: tableView.frame.width - kX_GAP*2, height: tableView.rowHeight));
        label.backgroundColor = isHeader ? .green : .yellow;
        
        label.text = title
        label.numberOfLines = isHeader ? 1 : 0
        label.textColor = isHeader ? UIColor.black : UIColor.red
        sectionView.addSubview(label)
        return sectionView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -funtions
    func setupData() {
        let array = ["分组0","分组1","分组2","分组3","分组4","分组5","分组6","分组7","分组8","分组9"];

        for i in 0..<array.count{
            
            let foldModel = BNFoldSectionModel()
            foldModel.isOpen = true
            foldModel.isCanOpen = true
            foldModel.title = array[i]
            foldModel.image = "bug.png"
            foldModel.headerHeight = 60
            foldModel.footerHeight = 10
            foldModel.headerColor = .green
            foldModel.footerColor = .yellow

            for j in 0...i {
                let string = foldModel.title + "\(j)"
                foldModel.dataList.append(string)
            }
            dataList.add(foldModel)
            
        }
        tableView.reloadData()
    }
    
    
    @objc dynamic func handleActionOne() {
        DDLog(111)
    }
    
    @objc dynamic func handleActionTwo() {
        DDLog(222)
    }
    
    //MARK: -lazy
    lazy var footerView: BNTableFooterView = {
        var view = BNTableFooterView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 240))
        view.label.text = kTips_Fleet;
        view.label.textAlignment = .center
        view.btn.addActionHandler({ (sender:UIControl) in
            let obj = sender as! UIButton
            
            DDLog(obj.tag)
        }, for: .touchUpInside)
        return view
    }()
    
}
