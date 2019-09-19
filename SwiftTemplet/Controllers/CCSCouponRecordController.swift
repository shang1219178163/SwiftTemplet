//
//  CCSCouponRecordController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/9/18.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class CCSCouponRecordController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "优惠券"
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        
        createBtnBarItem("Next") { (reco, view, idx) in
            self.phoneView.show();
        }
        
    }
    
    
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
     
//        let cell = UITableViewCellZero.cellWithTableView(tableView) as! UITableViewCellZero;
        let cell = UITableViewCellCoupon.cellWithTableView(tableView) as! UITableViewCellCoupon;
//        cell.labelLeft.text = "金融优惠券"
        cell.labelTop.text = "$2 (满20可以)"
        cell.labelMid.text = "发放时间: 2019-08-12 12:00:00"
        cell.labelBom.text = "发放时间: 2019-08-12 12:00 ~ 2019-09-12 12:00"
        cell.labelLeft.backgroundColor = UIColor.theme;
        cell.btn.addTarget(self, action: #selector(handleActionSender(_:)), for: .touchUpInside);
        cell.btn.addActionHandler({ (control) in
            guard let sender = control as? UIButton else { return }
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
    @objc func handleActionSender(_ sender: UIButton) -> Void {

    }

    //MARK: -lazy
    @objc lazy var tableView: UITableView = {
        var table = UIView.createTableView(self.view.bounds, style: .grouped, rowHeight: 80)
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
        view.block({ (phoneView, idx) in
            DDLog(idx);
        })
        return view;
    }()
}
