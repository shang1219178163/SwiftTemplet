//
//	IOPFuntionListController.swift
//	MacTemplet
//
//	Created by shang on 2020/11/19 10:33
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand

/// 列表
@objcMembers class IOPFuntionListController: UIViewController{
    
    lazy var list: [[[String]]] = {
        let array: [[[String]]] = [
            [["NNExcelAlertViewController", "NNExcelAlertView", ],
             
            ],
        ]
        return array
    }()

    // MARK: - lazy
    lazy var tableView: UITableView = {
        let view = UITableView.create(self.view.bounds, style: .plain, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        return view
    }()
        
    lazy var rightBtn: UIButton = {
        let button = UIButton.create(.zero, title: "保存", textColor: .theme, backgroundColor: .clear)
//        button.isHidden = true;
        button.sizeToFit()
        button.addActionHandler({ (control) in
            DDLog(control)
        }, for: .touchUpInside)
        return button
    }()
    
    @objc func handleAction(_ sender: UIButton) {
        
    }
    
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "KOP功能"
        setupExtendedLayout()
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
//        pushVC(PKRegionParkListController.self, animated: false, block: nil)
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationController?.navigationBar.setBackgroudColor(.clear, for: .default)
        navigationController?.navigationBar.setTextColor(.systemGreen)
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - funtions
    func setupUI() {
        view.backgroundColor = UIColor.white

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
        view.addSubview(tableView);
    }


}

extension IOPFuntionListController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "cell1", style: .subtitle);
        cell.textLabel!.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel!.textColor = UIColor.theme;

        cell.textLabel!.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.textColor = UIColor.gray;
        cell.accessoryType = .disclosureIndicator;
        
        let itemList = list[indexPath.section][indexPath.row]
        cell.textLabel!.text = itemList[1]
//        cell.textLabel!.text = NSLocalizedString(itemList[1], comment: "")
        cell.textLabel!.text = Bundle.localizedString(forKey: itemList[1])

        cell.detailTextLabel?.text = itemList[0];

        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let itemList = list[indexPath.section][indexPath.row]
//        DDLog(itemList);
        
        let controller = UICtrFromString(itemList.first!)
        controller.title = itemList.last!
        navigationController?.pushViewController(controller, animated: true);
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
