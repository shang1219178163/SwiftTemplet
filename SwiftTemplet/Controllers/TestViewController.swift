//
//  TestViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/8/20.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKit

import Alamofire
import SDWebImage

class TestViewController: UIViewController{

    
    let url = "https://httpbin.org/get";
    let kTips_Fleet = "·请选择车场及出\\入口后,开启车队模式\n·该功能需要arm3.5.4.0以上版本支持\n·如有需要请联系运维人员升级"
    var dataList: NSMutableArray = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        parkGroupView.items = ["异常出车", "无入场记录", "长时为出"]
        let items = ["异常出车", "无入场记录", "长时为出"]
        parkGroupView.items = items
        
        parkGroupView.selectedIdxList = [0]
        view.addSubview(parkGroupView)
        
        let urlArray = ["http://upload-images.jianshu.io/upload_images/1714291-6c664d526b380115.jpg",                        "http://img.parkingwang.com/6100000074/629906_1.jpg",                            "http://upload-images.jianshu.io/upload_images/3580598-482508548410c111.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
        pictureView.list = urlArray
        view.addSubview(pictureView)

        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        parkGroupView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20);
            make.left.equalToSuperview().offset(20);
            make.right.equalToSuperview().offset(-20);
            make.height.equalTo(35);
        }
        
        pictureView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20);
            make.right.equalToSuperview().offset(-20);
            make.bottom.equalToSuperview().offset(-20);
            make.height.equalTo(240);
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
                        
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
    
    //MARK: -lazy
    lazy var footerView: NNTableFooterView = {
        let view = NNTableFooterView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 240))
        view.label.text = kTips_Fleet;
        view.label.textAlignment = .center
        view.btn.addActionHandler({ (sender) in
            DDLog(sender.tag)
            
        }, for: .touchUpInside)
        return view
    }()

    
    lazy var parkGroupView: NNButtonGroupView = {
        let view = NNButtonGroupView(frame: .zero)
        view.padding = 15;
        view.numberOfRow = 3;
        view.isMutiChoose = false;
        view.block({ (groupView, sender) in
            print(sender.currentTitle ?? "", groupView.selectedIdxList)
        })
        return view;
    }()
    
    lazy var pictureView: NNPictureView = {
        let view = NNPictureView(frame: .zero)
        view.backgroundColor = .black
        return view;
    }()
    
    
}

extension TestViewController: UITableViewDataSource, UITableViewDelegate{

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
        let obj = foldModel.dataList[indexPath.row]
        
        let cell = UITableViewCellRightBtn.dequeueReusableCell(tableView)
        
        cell.labelLeft.text = String(format: "section_%d,row_%d", indexPath.section,indexPath.row);
        cell.btn.addActionHandler({ (sender) in
            cell.btn.isSelected = !cell.btn.isSelected
        }, for: .touchUpInside)
        
        cell.getViewLayer()
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
        
        let view = UITableHeaderFooterViewOne.dequeueReusableHeaderFooterView(tableView)
        //        let view = tableView.dequeueReusableHeaderFooterView(for: UITableHeaderFooterViewZero.self)
        
        view.isCanOpen = foldModel.isCanOpen
        view.isOpen = foldModel.isOpen
        view.labelLeft.text = foldModel.title
        view.labelRight.text = "\(foldModel.dataList.count)"
        view.imgViewLeft.image = UIImage(named: foldModel.image)
        UIView.animate(withDuration: kDurationDrop, animations: {
            view.imgViewRight.transform = view.isOpen == true ? (view.imgViewRight.transform.rotated(by: CGFloat(Double.pi/2))) : .identity;
        })
        view.block { (headerView: UITableHeaderFooterViewOne) in
            foldModel.isOpen = !foldModel.isOpen
            tableView.reloadSections([section], with: .fade)
            
        }
        
        view.getViewLayer()
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let foldModel = dataList[section] as! NNFoldSectionModel
        return foldModel.footerHeight;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let foldModel = dataList[section] as! NNFoldSectionModel
        return tableView.createSectionViewLabel(30) { (label) in
             label.text = "section\(section)"
             label.textAlignment = .left
         }
    }
        
}
