//
//	SimpleListController.swift
//	MacTemplet
//
//	Created by shang on 2020/04/23 08:28
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand
import SnapKit
        
/// 自定义协议
@objc protocol TableViewSelectDelegate{
    @objc func tableViewSelect(_ tableView: UITableView, indexPath: IndexPath)

}

/// 列表
@objcMembers class SimpleListController: UIViewController{
    
    weak var delegate: TableViewSelectDelegate?
    // MARK: - lazy
//    lazy var tableView: UITableView = {
//        let view = UITableView.create(self.view.bounds, style: .plain, rowHeight: 60)
//        view.backgroundColor = UIColor.white
//        view.dataSource = self
//        view.delegate = self
//
//        return view
//    }()
        
//    private var _tableView: UITableView?
//    lazy var tableView: UITableView = {
//        if _tableView == nil {
//            _tableView = UITableView.create(self.view.bounds, style: .plain, rowHeight: 50)
//            _tableView!.dataSource = self
//            _tableView!.delegate = self
//        }
//        return _tableView!
//    }()
    
//    lazy var tableView: UITableView = {
//        guard let tableView = view.findSubView(UITableView.self) as? UITableView else {
//            let view = UITableView.create(self.view.bounds, style: .plain, rowHeight: 50)
//            view.dataSource = self
//            view.delegate = self
//            return view
//        }
//        return tableView
//    }()
    
    lazy var tableView: UITableView = {
        if let tableView = view.findSubView(UITableView.self) as? UITableView {
            return tableView
        }
                
        let view = UITableView.create(self.view.bounds, style: .plain, rowHeight: 50)
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    lazy var rightBtn: UIButton = {
        let button = UIButton.create(.zero, title: "保存", textColor: .theme, backgroundColor: .clear)
        button.isHidden = true;
        button.sizeToFit()
        button.addActionHandler({ (control) in
            
        }, for: .touchUpInside)
        return button
    }()
            
    // MARK: - lazy
    lazy var label: UILabel = {
        let view = UILabel(frame: CGRectMake(0, 0, kScreenWidth, 50))
        view.backgroundColor = .systemGreen
        view.numberOfLines = 0
        return view
    }()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        title = "SimpleListController"
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
        }
        
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15);
            make.left.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-15);
            make.height.equalTo(225);
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        label.attributedText = AttrString.test()
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - funtions
    func setupUI() {
        view.backgroundColor = UIColor.red

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
                
//        tableView.tableHeaderView = searchBar
        view.addSubview(tableView);
        view.addSubview(label);
//        label.isHidden = true
    }

}

extension SimpleListController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.text = "--"
        cell.textLabel?.textColor = UIColor.textColor3;

        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.text = "--"
        cell.detailTextLabel?.textColor = UIColor.textColor6;
        cell.accessoryType = .disclosureIndicator;
        
        cell.textLabel?.text = indexPath.string

//        guard let model = dataList[indexPath.row] as? IOPParkModel else { return cell; }
//        cell.textLabel?.text = model.name
//        cell.detailTextLabel?.text = model.statusDes
//        cell.detailTextLabel?.textColor = model.statusDes == "已接入" ? UIColor.theme : UIColor.textColor9;

//        cell.getViewLayer()
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.tableViewSelect(tableView, indexPath: indexPath)
//        guard let model = dataList[indexPath.row] as? IOPParkModel else { return }
//        let controller = IOPParkDetailController()
//        controller.parkModel = model
//        navigationController?.pushViewController(controller, animated: true)
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

//extension SimpleListController: UIScrollViewDelegate{
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        DDLog(scrollView.contentOffset.y)
//        if scrollView.contentOffset.y < 0 {
//            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.y, 0)
//            return
//        }
//    }

//  func scrollViewDidScroll(_ scrollView: UIScrollView) {
//      let height = scrollView.frame.size.height;
//      let offsetY = scrollView.contentOffset.y;
//       let distanceFromBottom = scrollView.contentSize.height - offsetY;
//
//       btnSure.isEnabled = (distanceFromBottom <= height*1.1)
//  }
//}
