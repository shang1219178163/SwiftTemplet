//
//  FleetDetailNewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/24.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit

import SwiftExpand
import SDWebImage
import SnapKit

class FleetDetailNewController: UIViewController{
    
    let kTips_Fleet = "·请选择车场及出\\入口后,开启车队模式\n·该功能需要arm3.5.4.0以上版本支持\n·如有需要请联系运维人员升级"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if title == nil {
            title = self.controllerName;
        }
        
        view.addSubview(tbView);
        tbView.tableFooterView = footerView;
        
        setupData();
        
        let version = "3.3.5.0"
        let ver  = version.replacingOccurrences(of: ".", with: "")
        
        DDLog(version, ver.intValue)
        
        
//        version.replacingOccurrences(of: <#T##StringProtocol#>, with: <#T##StringProtocol#>)
        
        NSObject.hookInstanceMethod(of: #selector(handleActionOne), with: #selector(handleActionTwo))
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
        for sectionIdx in 0...3{
            
            let foldModel = NNFoldSectionModel()
            foldModel.isOpen = true
            foldModel.title = "sectionTtitle_\(sectionIdx)"
            switch sectionIdx {
            case 0:
                foldModel.dataList = [["选择车场:":"艾瑞停车场"]]
                //                foldModel.footerHeight = 10
                
            case 1:
                foldModel.title = "全部入口"
                foldModel.dataList = ["入        口1","入        口2"]
                foldModel.headerHeight = 60
                //                foldModel.footerHeight = 10
                
                foldModel.headerColor = .white
                
            case 2:
                foldModel.title = "全部出口"
                foldModel.dataList = ["出        口A","出        口B"]
                foldModel.headerHeight = 60
                //                foldModel.footerHeight = 10
                
                foldModel.headerColor = .white
                
            case 3:
                foldModel.dataList = ["开始时间:","结束时间:","操作用户:","状        态:"]
                foldModel.headerHeight = 0.01
//                foldModel.footerHeight = 120
                
            default:
                print("出错")
                
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
        var view = NNTableFooterView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 160))
        view.label.text = kTips_Fleet;
        view.label.textAlignment = .left
        view.btn.setTitleColor(.theme, for: .normal)
        view.btn.addActionHandler({ (sender: UIControl) in
            let obj = sender as! UIButton
            
            DDLog(obj.tag)
        }, for: .touchUpInside)
        return view
    }()
    
}

extension FleetDetailNewController: UITableViewDataSource, UITableViewDelegate{
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

        let cell = UITableViewCellOne.dequeueReusableCell(tableView)
        cell.labelLeft.text = String(format: "section_%d,row_%d", indexPath.section,indexPath.row);
        cell.labelRight.text = "990" + "\(indexPath.row)";
//        let imgUrl = imgList.randomElement()!;
//        cell.imgViewLeft.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: kIMG_defaultPortrait))
        
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
            cell.separatorInset = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
        } else {
            cell.separatorInset = .zero
        }
        //        cell.getViewLayer();
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        DDLog(indexPath.string);

        handleActionOne()
        
        
        let controller = UICtrFromString("DetailViewController");
//        navigationController?.pushViewController(controller, animated: true);
        
        UIView.transition(with: (self.navigationController?.view)!, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.navigationController?.pushViewController(controller, animated: false);
        }, completion: { (finish) in
            
        })
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let foldModel = dataList[section] as! NNFoldSectionModel
        return foldModel.headerHeight;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let foldModel = dataList[section] as! NNFoldSectionModel

        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: foldModel.headerHeight))
        
        contentView.addSubview(contentView.lineTop);
        contentView.addSubview(contentView.lineBottom);

        contentView.backgroundColor = UIColor.background
        contentView.backgroundColor = foldModel.headerColor
//        contentView.backgroundColor = UIColor.random

        let label = UILabel(frame: .zero);
        label.frame = CGRect(x: 10, y: contentView.frame.midY - 25/2.0, width: contentView.frame.maxX - 20, height: 25)
        label.backgroundColor = foldModel.headerColor;
        label.text = foldModel.title;

        contentView.addSubview(label)
        if [1,2].contains(section) {
            contentView.addActionClosure { (tap:UITapGestureRecognizer?, view:UIView, idx:Int) in
                if foldModel.isCanOpen == true {
                    foldModel.isOpen = !foldModel.isOpen
                    tableView.reloadSections([section], with: .fade)
                }
            }
            return contentView;
        }
        return UIView();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let foldModel = dataList[section] as! NNFoldSectionModel
        return foldModel.footerHeight;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let foldModel = dataList[section] as! NNFoldSectionModel
        return UIView();
    }

}
