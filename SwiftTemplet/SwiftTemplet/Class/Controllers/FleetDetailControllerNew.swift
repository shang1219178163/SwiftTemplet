//
//  FleetDetailControllerNew.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/24.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit

import SwiftExpand
import SDWebImage
import SnapKit


class FleetDetailControllerNew: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    let kTips_Fleet = "·请选择车场及出\\入口后,开启车队模式\n·该功能需要arm3.5.4.0以上版本支持\n·如有需要请联系运维人员升级"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if title == nil {
            title = self.controllerName;
        }
        
        view.addSubview(tableView);
        
        for sectionIdx in 0...3{

            let foldModel = BNFoldSectionModel()
            foldModel.isOpen = true
            foldModel.title = "sectionTtitle_\(sectionIdx)"
            switch sectionIdx {
            case 0:
                foldModel.dataList = [["选择车场:":"艾瑞停车场"]]
                foldModel.footerHeight = 10

            case 1:
                foldModel.title = "全部入口"
                foldModel.dataList = ["入        口1","入        口2"]
                foldModel.headerHeight = 60
                foldModel.footerHeight = 10
                
                foldModel.headerColor = .white

            case 2:
                foldModel.title = "全部出口"
                foldModel.dataList = ["出        口1","出        口2"]
                foldModel.headerHeight = 60
                foldModel.footerHeight = 10
                
                foldModel.headerColor = .white

            case 3:
                foldModel.dataList = ["开始时间:","结束时间:","操作用户:","状        态:"]
                foldModel.headerHeight = 0.01
                foldModel.footerHeight = 300

            default:
                print("出错")
                
            }
            dataList.add(foldModel)
            
        }
        tableView.reloadData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
//        DDLog(dataList);
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

        let cell = UITableViewCellOne.cellWithTableView(tableView) as! UITableViewCellOne;
        
        cell.labelLeft.text = String(format: "section_%d,row_%d", indexPath.section,indexPath.row);
        cell.labelRight.text = "990" + "\(indexPath.row)";
        //            let imgUrl = imgList.randomElement()!;
        //            cell.imgViewLeft.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: kIMG_defaultPortrait))
        cell.imgViewRight.isHidden = true;
        
        let data = foldModel.dataList[indexPath.row]
        if let obj = data as? Dictionary<String, String>{
            cell.labelLeft.text = Array(obj.keys)[indexPath.row]
            cell.labelRight.text = obj[cell.labelLeft.text!]

        } else if let obj = data as? Array<Any> {
            cell.labelLeft.text = (obj[indexPath.row] as! String)

        } else {
            cell.labelLeft.text = (data as! String)

        }
        
        //界面配置
        cell.type = 1;
        cell.labelRight.textAlignment = .center
        if [1,2].contains(indexPath.section) {
            cell.separatorInset = UIEdgeInsetsMake(0, 100, 0, 0)
        }
        //        cell.getViewLayer();
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

        let containView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: foldModel.headerHeight))
        containView.backgroundColor = UIColor.background
        containView.backgroundColor = foldModel.headerColor

        let label = UILabel(frame: .zero);
        label.frame = CGRect(x: 10, y: containView.frame.midY - 25/2.0, width: containView.frame.maxX - 20, height: 25)
        label.backgroundColor = foldModel.headerColor;
        label.text = foldModel.title;

        containView.addSubview(label)
//        label.snp.makeConstraints { (make) in
//            make.top.left.equalToSuperview().offset(kY_GAP)
//            make.bottom.right.equalToSuperview().offset(-kY_GAP)
//
//        }
        if [1,2].contains(section) {
            containView.addActionHandler { (tap:UITapGestureRecognizer?, view:UIView, idx:Int) in
                foldModel.isOpen = !foldModel.isOpen
                tableView.reloadSections([section], with: .fade)

//                self.dataList.forEach({ (obj:Any) in
//                    let model:BNFoldSectionModel = obj as! BNFoldSectionModel
//                    DDLog(model.isOpen)
//                })
            }
            return containView;
        }
        return UIView();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let foldModel = dataList[section] as! BNFoldSectionModel
        return foldModel.footerHeight;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let foldModel = dataList[section] as! BNFoldSectionModel
        if section == dataList.count - 1 {
            footerView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 300)
            return footerView;
        }
        return UIView();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    ///MARK: -lazy
    lazy var footerView: BNTableFooterView = {
        var view = BNTableFooterView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 240))
        view.label.text = kTips_Fleet;
        view.btn.addActionHandler({ (sender:UIControl) in
            let obj = sender as! UIButton
            
            DDLog(obj.tag)
        }, for: .touchUpInside)
        return view
    }()
    
}



