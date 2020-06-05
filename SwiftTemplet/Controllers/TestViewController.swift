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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(tbView);
//        setupData();
        var list:[String] = []
        for i in 0...6 {
            list.append("\(i)")
        }
        
        itemView.frame = CGRect(x: 20, y: 20, width: kScreenWidth - 40.0, height: 120)
        itemView.items = list
        view.addSubview(itemView)
        
        parkGroupView.frame = CGRect(x: 20, y: itemView.maxY + 20, width: kScreenWidth - 40.0, height: 35)
//        parkGroupView.items = ["异常出车", "无入场记录", "长时为出"]
        let items = ["异常出车", "无入场记录", "长时为出"]
        parkGroupView.createItems(items)
        
        parkGroupView.selectedIdxList = [0]
        view.addSubview(parkGroupView)
        
        let urlArray = ["http://upload-images.jianshu.io/upload_images/1714291-6c664d526b380115.jpg",                        "http://img.parkingwang.com/6100000074/629906_1.jpg",                            "http://upload-images.jianshu.io/upload_images/3580598-482508548410c111.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
        
        let rect = CGRect(x: 20, y: parkGroupView.maxY + 20, width: kScreenWidth - 40.0, height: (kScreenWidth - 40.0)/urlArray.count.toCGFloat)
        let photosView = createGroupView(rect, list: urlArray, numberOfRow: 3, padding: 10, type: 1) { (tap, itemView, idx) in
            DDLog(idx)
            let value = urlArray[idx];
//            (itemView as! UIImageView).sd_setImage(with: URL(string: value), placeholderImage: UIImageNamed("img_failedDefault_S"))

//            (itemView as! UIImageView).showImageEnlarge()
            (itemView as! UIImageView).showPictureView(urlArray, index: itemView.tag)

        }
        view.addSubview(photosView)
                
        pictureView.frame = CGRect(x: 20, y: photosView.maxY + 20, width: kScreenWidth - 40.0, height: (kScreenWidth - 40.0))
        pictureView.list = urlArray
        view.addSubview(pictureView)

//        DDLog(pictureView.backgroundColor)

        DDLog(DateFormatter.queryDate())

        view.getViewLayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
//        tbView.reloadData()
        
        
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
    
    /// [源]GroupView创建
    func createGroupView(_ rect: CGRect = CGRect.zero, list: [String], numberOfRow: Int = 4, padding: CGFloat = kPadding, type: Int = 0, action: ((UITapGestureRecognizer?, UIView, NSInteger)->Void)? = nil) -> UIView {
        
        let rowCount: Int = list.count % numberOfRow == 0 ? list.count/numberOfRow : list.count/numberOfRow + 1;
        let itemWidth = (rect.width - CGFloat(numberOfRow - 1)*padding)/CGFloat(numberOfRow)
        let itemHeight = (rect.height - CGFloat(rowCount - 1)*padding)/CGFloat(rowCount)
        
        let backView = UIView(frame: rect);
        for (i,value) in list.enumerated() {
            let x = CGFloat(i % numberOfRow) * (itemWidth + padding);
            let y = CGFloat(i / numberOfRow) * (itemHeight + padding);
            let rect = CGRect(x: x, y: y, width: itemWidth, height: itemHeight);
            
            let imgView = UIImageView(frame: rect);
            imgView.isUserInteractionEnabled = true;
            imgView.contentMode = .scaleAspectFit;
            imgView.image = UIImage(named: value);
            imgView.tag = i;
            DDLog(value)
            imgView.sd_setImage(with: URL(string: value), placeholderImage: UIImageNamed("img_failedDefault_S"))

            if action != nil {
                imgView.addActionClosure(action!)
            }
            backView.addSubview(imgView);
        }
        return backView;
    }
    
    func showTip() {
        let alertVC = UIAlertController(title: "Add your photo", message: "Add your photoAdd your photoAdd your photo", preferredStyle: .alert)

        let imageAction = UIAlertAction(title: "", style: .default) { (action) in
            print(action.title)
        }

        let image = UIImage(named: "bug.png")
        let left = alertVC.view.frame.size.width/5
        let edge = UIEdgeInsets(top: 0, left: -left, bottom: 0, right: 0)
        let centeredTopoImage = image?.withAlignmentRectInsets(edge).withRenderingMode(.alwaysOriginal)
        imageAction.setValue(centeredTopoImage, forKey: "image")

        let uploadAction = UIAlertAction(title: "Upload", style: .default, handler: nil)
        let laterAction = UIAlertAction(title: "Add Later", style: .cancel, handler: nil)

        alertVC.addAction(imageAction)
        alertVC.addAction(uploadAction)
        alertVC.addAction(laterAction)
        alertVC.view.getViewLayer()
        self.present(alertVC, animated: true, completion: nil)
    }
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
    
    lazy var itemView: NNGroupView = {
        var view = NNGroupView(frame: .zero)
        view.padding = 10;
        view.numberOfRow = 3;
        view.isMutiChoose = true;
        view.showType = .line
        view.showType = .backgroud
        view.block({ (itemsView, sender) in
            if let btn = sender as? UIButton {
                print(btn.titleLabel?.text as Any, itemsView.selectedList.count, itemsView.selectedIdxList.count)

            }
        })
        return view;
    }()
    
    lazy var parkGroupView: NNButtonGroupView = {
        var view = NNButtonGroupView(frame: .zero)
        view.padding = 15;
        view.numberOfRow = 3;
        view.isMutiChoose = false;
        view.block({ (groupView, sender) in
            print(sender.currentTitle ?? "", groupView.selectedIdxList)
        })
        return view;
    }()
    
    lazy var pictureView: NNPictureView = {
        var view = NNPictureView(frame: .zero)
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
        
        let cell = UITableViewCellFour.dequeueReusableCell(tableView)
        
        cell.labelLeft.text = String(format: "section_%d,row_%d", indexPath.section,indexPath.row);
        cell.type = 1
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
        view.imgViewLeft.image = UIImageNamed(foldModel.image)
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
        return tableView.sectionView(viewForSection: section, title: nil, isHeader: false);
    }
        
}
