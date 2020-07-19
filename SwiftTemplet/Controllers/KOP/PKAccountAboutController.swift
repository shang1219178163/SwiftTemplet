//
//  PKSettingsController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/16.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class PKAccountAboutController: UIViewController {

    lazy var tableView: UITableView = {
        guard let tableView = view.subView(UITableView.self) as? UITableView else {
            let view = UITableView.create(self.view.bounds, style: .plain, rowHeight: 50)
            view.dataSource = self
            view.delegate = self
            return view
        }
        return tableView
    }()
    
    lazy var footerView: NNTableFooterView = {
        let view = NNTableFooterView.create("退出当前账号", topPadding: 30);
        view.btn.setBackgroundColor(.systemRed, for: .normal)
        view.btn.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
//        view.label.text = """
//        · 请确认空车位无误后再修改.
//        · 修改空车位会影响车场饱和度数据统计.
//        · 部分车场空车位为0后车场将不能进车.
//        """
        return view
    }()
    
    @objc func handleAction(_ sender: UIButton) {
        view.endEditing(true)

    }
    
    lazy var list: [[[String]]] = {
        var array: [[[String]]] = [
            [["手机号", "UITableViewCell", "50.0", "", "",],
            ],
            [["微信账号", "UITableViewCellTextField", "50.0", "", "ti_number", ],
            ],
        ]
        return array
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "设置"
//        tableView.tableFooterView = footerView;
        view.addSubview(tableView)
    }
    


}
extension PKAccountAboutController: UITableViewDataSource, UITableViewDelegate{
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
        let value1 = itemList[1]
        let value2 = itemList[2]
        let value3 = itemList[3]
        let value4 = itemList[4]

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
