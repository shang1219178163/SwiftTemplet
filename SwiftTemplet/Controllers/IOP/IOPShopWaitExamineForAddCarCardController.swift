//
//  IOPShopWaitExamineForAddCarCardController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/10.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

///车辆认证资料
class IOPShopWaitExamineForAddCarCardController: UIViewController {

    // MARK: - lazy
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 60)
        view.dataSource = self
        view.delegate = self

        view.rowHeight = 216
        return view
    }()
    
    lazy var tuples: [(String, String, String)] = {
        return [
            ("1.驾照", "img_driver_license", "key"),
            ("2.行驶证", "img_driving_license", "key" ),
            ("3.车险证明", "img_car_insurance_certificate", "key"),
            ]
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = "认证资料"
        
        view.addSubview(tableView)
    }
    


}


extension IOPShopWaitExamineForAddCarCardController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tuples.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCellPhotoShow.dequeueReusableCell(tableView)
        cell.inset = UIEdgeInsets(top: 5, left: 10, bottom: 15, right: 10)
//        cell.lineView.isHidden = true
        
        let tuple = tuples[indexPath.row]
        cell.textLabel?.text = tuple.0
        cell.imageView?.image = UIImage(named: tuple.1)

        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let tuple = tuples[indexPath.row]
        DDLog(tuple.1);

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.01;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UILabel();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UILabel();
    }
}
