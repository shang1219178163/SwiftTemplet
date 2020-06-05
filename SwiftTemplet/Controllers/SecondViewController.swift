
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

class SecondViewController: UIViewController{
    let url = "https://httpbin.org/get";
    let kTips_Fleet = "·请选择车场及出\\入口后,开启车队模式\n·该功能需要arm3.5.4.0以上版本支持\n·如有需要请联系运维人员升级"
    
    //MARK: -lazy
    lazy var footerView: NNTableFooterView = {
        var view = NNTableFooterView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 240))
        view.label.text = kTips_Fleet;
        view.label.textAlignment = .center
        view.btn.addActionHandler({ (sender: UIControl) in
            let obj = sender as! UIButton
            
            DDLog(obj.tag)
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var segmentCtl: NNSegmentedControl = {
        let rect = CGRectMake(0, 0, 240, 44)
        let view = NNSegmentedControl(frame: rect)
        view.showStyle = .bottomLine
        view.normalColor = .gray
        view.selectedColor = .white
        view.itemList = ["过去", "现在", "将来"]
        view.addActionHandler({ (control) in
            guard let sender = control as? UISegmentedControl else { return }
            DDLog(sender)
        }, for: .valueChanged)
        return view;
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.titleView = segmentCtl
        view.addSubview(tbView);
        
        setupData();

    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        tbView.reloadData()
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: -funtions
    func setupData() {
        let array = ["分组0","分组1","分组2","分组3","分组4","分组5","分组6","分组7","分组8","分组9"];

        for i in 0..<array.count{
            
            let foldModel = NNFoldSectionModel()
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
        tbView.reloadData()
    }
    
    @objc dynamic func handleActionOne() {
        DDLog(111)
    }
    
    @objc dynamic func handleActionTwo() {
        DDLog(222)
    }
    

}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate{
     //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let foldModel = dataList[section] as! NNFoldSectionModel
        let count = foldModel.isOpen == true ? foldModel.dataList.count : 0;
        return count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    };
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let foldModel = dataList[indexPath.section] as! NNFoldSectionModel
        let itemList = foldModel.dataList[indexPath.row]
        
        let cell = UITableViewCellFour.dequeueReusableCell(tableView)
        
        cell.labelLeft.text = String(format: "section_%d,row_%d", indexPath.section,indexPath.row);
        cell.type = 1
        cell.btn.addActionHandler({ (sender) in
            cell.btn.isSelected = !cell.btn.isSelected
        }, for: .touchUpInside)
        
//        cell.getViewLayer()
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        DDLog(indexPath.string);
    
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let foldModel = dataList[section] as! NNFoldSectionModel
        return foldModel.headerHeight;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let foldModel = dataList[section] as! NNFoldSectionModel
        
        let view = UITableHeaderFooterViewZero.dequeueReusableHeaderFooterView(tableView)
//        let view = tableView.dequeueReusableHeaderFooterView(for: UITableHeaderFooterViewZero.self)
        
        view.isCanOpen = foldModel.isCanOpen
        view.isOpen = foldModel.isOpen
        view.labelLeft.text = foldModel.title
        view.labelRight.text = "\(foldModel.dataList.count)"
        view.imgViewLeft.image = UIImageNamed(foldModel.image)
        view.contentView.backgroundColor = UIColor.white
        UIView.animate(withDuration: kDurationDrop, animations: {
            view.indicatorView.transform = view.isOpen == true ? (view.indicatorView.transform.rotated(by: CGFloat(Double.pi/2))) : .identity;
        })
        view.block { (headerView: UITableHeaderFooterViewZero) in
            foldModel.isOpen = !foldModel.isOpen
            tableView.reloadSections([section], with: .fade)
            
        }

//        view.getViewLayer()
        return view
        
//        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: foldModel.headerHeight))
//        contentView.backgroundColor = UIColor.background
//        contentView.backgroundColor = foldModel.headerColor
//
//        let label = UILabel(frame: .zero);
//        label.frame = CGRect(x: 10, y: contentView.frame.midY - 25/2.0, width: contentView.frame.maxX - 20, height: 25)
//        label.backgroundColor = foldModel.headerColor;
//        label.text = foldModel.title;
//
//        contentView.addSubview(label)

//        if [1,2].contains(section) {
//            contentView.addActionHandler { (tap:UITapGestureRecognizer?, view:UIView, idx:Int) in
//                if foldModel.isCanOpen == true {
//                    foldModel.isOpen = !foldModel.isOpen
//                    tableView.reloadSections([section], with: .fade)
//                }
//            }
//            return contentView;
//        }
//        return UIView();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let foldModel = dataList[section] as! NNFoldSectionModel
        return foldModel.footerHeight;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let foldModel = dataList[section] as! NNFoldSectionModel
        return tableView.sectionView(viewForSection: section, title: nil, isHeader: false);
    }
}
