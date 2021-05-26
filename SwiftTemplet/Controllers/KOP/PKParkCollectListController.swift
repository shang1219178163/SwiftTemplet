//
//	PKParkCollectListController.swift
//	MacTemplet
//
//	Created by shang on 2020/07/20 10:03
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand
        
/// 列表
@objcMembers class PKParkCollectListController: UIViewController{
    
    /// 数据请求返回
    var dataModel = NSObject()

    var dataList = NSMutableArray()

    // MARK: - lazy
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 75)
        view.dataSource = self
        view.delegate = self

        view.headerRefresh {
            DispatchQueue.main.after(1) {
                view.endRefreshing()
            }
        }
        
        view.footerRefresh {
            DispatchQueue.main.after(1) {
                view.endRefreshing()
            }
        }
        
        return view
    }()
        
    lazy var rightBtn: UIButton = {
        let button = UIButton.create(.zero, title: "保存", textColor: .theme, backgroundColor: .clear)
        button.isHidden = true;
        button.sizeToFit()
        button.addActionHandler({ (sender) in
            
        }, for: .touchUpInside)
        return button
    }()
    
    @objc func handleAction(_ sender: UIButton) {
        
    }
    
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar.create(CGRectMake(0, 0, kScreenWidth - 70, 50))
        view.layer.cornerRadius = 0;
        view.showsCancelButton = false;
        view.backgroundColor = .white
        view.textField?.placeholder = "请输入名称搜索";
        view.textField?.backgroundColor = UIColor.background
        view.textField?.layer.cornerRadius = 5;
        view.textField?.layer.masksToBounds = true;

        view.delegate = self;
        return view
    }()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        title = "我的收藏"
        setupUI()
        
        tableView.beginHeaderRefreshing()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if searchBar.isHidden {
            return;
        }
        
        searchBar.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.height.equalTo(50);
        }
                
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom).offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
        }
        
        searchBar.lineBottom.sizeWidth = kScreenWidth
        searchBar.addSubview(searchBar.lineBottom)
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
        view.backgroundColor = UIColor.white

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
        view.addSubview(searchBar);
        view.addSubview(tableView);
        
        searchBar.isHidden = true
    }

    func requestForSearch(_ searchbar: UISearchBar) {
        tableView.beginHeaderRefreshing()
    }


}

extension PKParkCollectListController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count > 0 ? dataList.count : 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellSubtitle", style: .subtitle)
//        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
//        cell.textLabel?.text = "--"
//        cell.textLabel?.textColor = UIColor.textColor3;
//
//        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
//        cell.detailTextLabel?.text = "--"
//        cell.detailTextLabel?.textColor = UIColor.textColor6;
//        cell.accessoryType = .disclosureIndicator;
        
        let cell = UITableViewCellCollect.dequeueReusableCell(tableView)
        cell.assoryView(NNButton.self, size: CGSize(width: 54, height: 39)) { (sender) in
            sender.labelHeight = 15
            sender.direction = .top
            sender.setTitleColor(.textColor3, for: .normal)
            sender.setImage(UIImage(named: "icon_map_route_black"), for: .normal)
            sender.titleLabel?.font = UIFont.systemFont(ofSize: 11)
            sender.setTitle("距离-", for: .normal)
        }
        
//        guard let model = dataList[indexPath.row] as? IOPParkModel else { return cell; }
//        cell.textLabel?.text = model.name
//        cell.detailTextLabel?.text = model.statusDes
//        cell.detailTextLabel?.textColor = model.statusDes == "已接入" ? UIColor.theme : UIColor.textColor9;

        cell.getViewLayer()
        return cell;
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

extension PKParkCollectListController: UISearchBarDelegate{
    // MARK: -UISearchBar
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool{
        return true;
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count < 3 {
            return;
        }
        requestForSearch(searchBar)
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        searchBar.showsCancelButton = !(searchBar.text!.count == 1 && text == "")
        return true;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        requestForSearch(searchBar)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
}


//extension PKParkCollectListController: PKParkCollectListViewModelDelegate{
//
//    func request(with model: PKParkCollectListRootModel, isRefresh: Bool, hasNextPage: Bool) {
//
//        DispatchQueue.global().async {
//            self.dataModel = model;
//            if isRefresh == true {
//                self.dataList.removeAllObjects()
//            }
////            self.dataList.addObjects(from: self.dataModel.records)
//            DispatchQueue.main.async {
//                IOPProgressHUD.dismiss()
//                self.tableView.mj_header.endRefreshing();
//                self.tableView.mj_footer.endRefreshing();
//                self.tableView.mj_footer.isHidden = !hasNextPage;
//                self.tableView.isHidden = (self.dataList.count <= 0);
//                self.tableView.reloadData();
//            }
//        }
//    }
//}
