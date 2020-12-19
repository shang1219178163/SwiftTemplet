//
//  CCSCouponRecordController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/9/18.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class CCSCouponRecordController: UIViewController, UICallPhoneViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "优惠券"
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        
        let rightBtn = UIButton.createBtnBarItem("语音通话")
        rightBtn.addActionHandler({ (control) in
            self.phoneView.show();
        })
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)

//        tableView.holderView.isHidden = (tableView.visibleCells.count != 0)
//        tableView.setHolderView(for: .loading)
//        tableView.holderView.getViewLayer()
    }
       
    // MARK: -callPhoneViewDelegate
    func callPhoneView(_ view: UICallPhoneView, idx: Int) {
        DDLog(idx)
    }
 
    //MARK: -lazy
    @objc lazy var tableView: UITableView = {
        var table = UITableView.create(self.view.bounds, style: .grouped, rowHeight: 80)
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    lazy var list: NSMutableArray = {
        let list = NSMutableArray()
        list.addObjects(from: ["1", "2", "3", "4", "5", "6", "7"])
        return list;
    }()
    
    lazy var phoneView: UICallPhoneView = {
        let view = UICallPhoneView(frame: .zero)
        view.delegate = self;
        return view;
    }()
    
//    lazy var talkbackBtn: UIButton = {
//        let view = UIButton(type: .custom)
//        view.frame = CGRectMake(0, 0, 70, 70)
//        view.setTitleColor(UIColor.hexValue(0x39C179), for: .normal)
//        view.setTitle("00:00", for: .normal)
//        view.setImage(UIImage(named: "icon_phone_green"), for: .normal)
//        view.backgroundColor = UIColor.hexValue(0xdddddd)
//        view.adjustsImageWhenHighlighted = false;
//        view.layer.cornerRadius = 3.5;
//        view.layer.masksToBounds = true;
//        view.layoutButton(direction: 0)
//        view.addActionHandler({ (control) in
//            //            UIView.GCDTimerAdd((control as! UIButton).titleLabel, date: NSDate())
//            self.phoneView.show();
//
//        })
//        return view
//    }()
}

extension CCSCouponRecordController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
//        let cell = UITableViewCellZero.dequeueReusableCell(tableView)
        let cell = UITableViewCellCoupon.dequeueReusableCell(tableView)
//        cell.labelLeft.text = "金融优惠券"
        cell.labelTop.text = "$2 (满20可以)"
        cell.labelMid.text = "发放时间: 2019-08-12 12:00:00"
        cell.labelBom.text = "发放时间: 2019-08-12 12:00 ~ 2019-09-12 12:00"
        cell.labelLeft.backgroundColor = UIColor.theme;
        cell.btn.addTarget(self, action: #selector(handleActionSender(_:)), for: .touchUpInside);
        cell.btn.addActionHandler({ (sender) in
            
            DDLog(indexPath.section);
            

        }, for: .touchUpInside)
        
        cell.couponType = indexPath.section;
        if indexPath.section > 4 {
            cell.couponType = indexPath.section - 4;
            cell.couponStatus = indexPath.section - 4;
            DDLog("couponStatus_\(cell.couponStatus)");

        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UITableViewCellCoupon else { return }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero);
        //        label.backgroundColor = .green;
        //        label.text = "header\(section)";
        return label;
    }
    
    // MARK: -functions
    @objc func handleActionSender(_ sender: UIButton) {

    }
}

