//
//  NNTableViewAlertController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/11/2.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import MJRefresh

///
@objcMembers class NNTableViewAlertController: UIViewController{
        
    var dataList = NSMutableArray()

    lazy var rightBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("Next", for: .normal)

        view.addActionHandler({ (sender) in
//            let controller = UIViewController()
//            self.navigationController?.pushViewController(controller, animated: true)
            
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        return view
    }()
        
    var message: String?
        
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        title = ""
        setupUI()
        
        tableView.mj_header?.beginRefreshing()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - funtions
    func setupUI() {
        edgesForExtendedLayout = []
        view.backgroundColor = .white

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)

        view.addSubview(tableView)
    }

}
        
extension NNTableViewAlertController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellSubtitle", style: .subtitle)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.text = "--"
        cell.textLabel?.textColor = UIColor.textColor3;

        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.text = "--"
        cell.detailTextLabel?.textColor = UIColor.textColor6;
        cell.accessoryType = .disclosureIndicator;
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let model = dataList[indexPath.row] as? IOPParkModel else { return }
//        let controller = IOPParkDetailController()
//        controller.parkModel = model
//        navigationController?.pushViewController(controller, animated: true)
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

