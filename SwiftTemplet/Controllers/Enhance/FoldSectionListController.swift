//
//  FoldSectionListController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/1.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SDWebImage

class FoldSectionListController: UIViewController{
    var dataList: NSMutableArray = [];

    //MARK: -lazy

    lazy var segmentCtl: NNSegmentedControl = {
        let rect = CGRectMake(0, 0, 240, 44)
        let view = NNSegmentedControl(frame: rect)
        view.showStyle = .bottomLine
        view.normalColor = .gray
        view.selectedColor = .white
        view.items = ["过去", "现在", "将来"]
        view.addActionHandler({ (sender) in
            DDLog(sender.selectedSegmentIndex)
            
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
        
    }
        

    
    //MARK: -funtions
    func setupData() {
        let array = ["分组0", "分组1", "分组2", "分组3", "分组4", "分组5", "分组6", "分组7", "分组8", "分组9"];

        for i in 0..<array.count{
            let foldModel = NNFoldSectionModel()
            foldModel.isOpen = true
            foldModel.isCanOpen = true
            foldModel.title = array[i]
            foldModel.image = "bug.png"
            foldModel.headerHeight = 40
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

}

extension FoldSectionListController: UITableViewDataSource, UITableViewDelegate{
     //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let foldModel = dataList[section] as! NNFoldSectionModel
        let count = foldModel.isOpen == true ? foldModel.dataList.count : 0;
        return count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let foldModel = dataList[indexPath.section] as? NNFoldSectionModel else { return UITableViewCell()}
        let itemList = foldModel.dataList[indexPath.row]
        
        let cell = UITableViewCellRightBtn.dequeueReusableCell(tableView)
        
        cell.labelLeft.text = String(format: "section_%d,row_%d", indexPath.section,indexPath.row);
        cell.btn.addActionHandler({ (sender) in
            cell.btn.isSelected = !cell.btn.isSelected
        }, for: .touchUpInside)
        
//        cell.getViewLayer()
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        DDLog(indexPath.toString);
    
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let foldModel = dataList[section] as? NNFoldSectionModel else { return 0}
        return foldModel.headerHeight;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let foldModel = dataList[section] as? NNFoldSectionModel else { return nil}

        let view = UITableHeaderFooterViewZero.dequeueReusableHeaderFooterView(tableView)
//        let view = tableView.dequeueReusableHeaderFooterView(for: UITableHeaderFooterViewZero.self)
        view.backgroundView = UIView(frame: CGRectMake(0, 0, kScreenWidth, 55))
        view.backgroundView?.backgroundColor = UIColor.clear
        view.backgroundView?.backgroundColor = UIColor.background
        
        view.indicatorView.isHidden = true
        view.imgViewLeft.isHidden = true

        view.isCanOpen = foldModel.isCanOpen
        view.isOpen = foldModel.isOpen
        view.labelLeft.text = foldModel.title
        view.btn.setTitle("\(foldModel.dataList.count)个", for: .normal)
        view.imgViewLeft.image = UIImage(named: foldModel.image)
        view.contentView.backgroundColor = UIColor.white
        UIView.animate(withDuration: kDurationDrop, animations: {
            view.indicatorView.transform = view.isOpen == true ? (view.indicatorView.transform.rotated(by: CGFloat(Double.pi/2))) : .identity;
        })
        view.block = { headerView in
            foldModel.isOpen = !foldModel.isOpen
            tableView.reloadSections([section], with: .fade)
        }
        
//        view.getViewLayer()
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let foldModel = dataList[section] as? NNFoldSectionModel else { return 0}
        return foldModel.footerHeight;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let foldModel = dataList[section] as? NNFoldSectionModel else { return nil}
//        let foldModel = dataList[section] as! NNFoldSectionModel
        return tableView.createSectionViewLabel(foldModel.footerHeight) { (label) in
             label.text = "section\(section)"
             label.textAlignment = .left
         }
    }
}
