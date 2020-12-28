//
//  PKAppAbountController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/16.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKit

class PKAppAbountController: UIViewController {

    lazy var tableView: UITableView = {
        guard let tableView = view.findSubView(UITableView.self) as? UITableView else {
            let view = UITableView.create(self.view.bounds, style: .plain, rowHeight: 50)
            view.dataSource = self
            view.delegate = self
            return view
        }
        return tableView
    }()
    
    lazy var headerView: NNTableHeaderView = {
//        let view = NNTableHeaderView.create(title: "提交成功", topPadding: 25, height: 180)
        let view = NNTableHeaderView(frame: CGRectMake(0, 0, UIScreen.sizeWidth, 180))
        view.topPadding = 40;
        view.btn.setTitle("版本号: v\(UIApplication.appVer)", for: .normal)
        view.btn.setTitleColor(.textColor3, for: .normal)
        view.btn.addActionHandler({ (sender) in
            DDLog(sender)
            
        }, for: .touchUpInside)
        view.imgView.image = UIApplication.appIcon
        view.imgView.backgroundColor = .systemBlue
        return view
    }()
    
    lazy var rightsView: NNCopyrightView = {
        let view = NNCopyrightView(frame: .zero)
        return view
    }()
    
    @objc func handleAction(_ sender: UIButton) {
        view.endEditing(true)

    }
    
    lazy var list: [[[String]]] = {
        let array: [[[String]]] = [
            [["官方网址", "UITableViewCell", "50.0", "", "seller_bank_account", ],
             ["客服电话", "UITableViewCell", "50.0", "", "seller_bank_account", ],
             ["用户协议", "UITableViewCell", "50.0", "", "seller_bank_account", ],
             ["隐私政策", "UITableViewCell", "50.0", "", "seller_bank_account", ],
            ],
        ]
        return array
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        title = "关于应用"
        tableView.tableHeaderView = headerView;
        view.addSubview(tableView)
        view.addSubview(rightsView)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        rightsView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(200);
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalTo(rightsView.snp.top).offset(0);
        }
    }

}

extension PKAppAbountController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = list[section]
        return sections.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = list[indexPath.section]
        let itemList = sections[indexPath.row]
        let value0 = itemList[0]
        
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellValue1", style: .value1)
        cell.textLabel?.textColor = UIColor.textColor3
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.detailTextLabel?.textColor = UIColor.theme
        cell.accessoryType = .disclosureIndicator

        cell.textLabel?.text = value0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

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
