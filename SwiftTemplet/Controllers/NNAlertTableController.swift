//
//  NNAlertTableController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/11/2.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class NNAlertTableController: NNAlertController {

    lazy var tableView: UITableView = {
        let view = UITableView.create(self.view.bounds, style: .plain, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        view.isScrollEnabled = false
        return view
    }()
    
    
    lazy var list = ["img_merchant_license_example", "营业执照示例图", "img_company_check_example","企查查示例图"]
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "企业信息"
        customView = tableView
        message = "营业执照主体必须和第三项公司公户信息主体保持一致；清晰的复印件需加盖贵司鲜章"
        
//        view.getViewLayer()
    }

}

extension NNAlertTableController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let info = list[indexPath.row]
        let isImg = info.hasPrefix("img_")
        return isImg ? 120 : 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.text = "--"
        cell.textLabel?.textColor = UIColor.textColor3;
        cell.textLabel?.textAlignment = .center
        
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.text = "--"
        cell.detailTextLabel?.textColor = UIColor.textColor6;
//        cell.accessoryType = .disclosureIndicator;
        
        let info = list[indexPath.row]
        let isImg = info.hasPrefix("img_")
            
        let inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        cell.contentView.createSubTypeView(UIImageView.self, tag: 100, inset: inset) {
            $0.image = UIImage(named: info)
            $0.isHidden = !isImg
        }
 
        cell.textLabel?.text = info
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01;
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

