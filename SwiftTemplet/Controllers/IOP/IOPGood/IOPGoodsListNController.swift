////
////	IOPGoodsListNController.swift
////	MacTemplet
////
////	Created by Shang on 2021/08/16 10:32
////	Copyright © 2021 shang. All rights reserved.
////
//
//
//import UIKit
//import SwiftExpand
//
///// 列表
//@objcMembers class IOPGoodsListNController: UIViewController{
//    
//    /// 数据请求返回
//    var dataModel = NSObject()
//    
//    lazy var viewModel = NSObject()
//        
//    var dataList = NSMutableArray()
//
//    // MARK: - lazy
//    lazy var tableView: UITableView = {
//        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 60)
//        view.dataSource = self
//        view.delegate = self
//
////        view.mj_header = MJRefreshNormalHeader(refreshingBlock: {
////            self.viewModel.requestRefresh()
////        });
////
////        view.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {
////            self.viewModel.requestRefresh()
////        });
//        return view
//    }()
//        
//    
//    lazy var searchBar: UISearchBar = {
//        let view = UISearchBar(frame: CGRect(0, 0, kScreenWidth - 70, 50))
//        view.textField?.placeholder = "请输入名称搜索";
//
////        view.delegate = self
//        return view
//    }()
//    
//    // MARK: - lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setupUI()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated);
//        
//    }
//        
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    // MARK: - funtions
//    func setupUI() {
//        edgesForExtendedLayout = []
//        view.backgroundColor = .white
//        title = "列表"
//        navigationItem.rightBarButtonItems = ["Next"].map({
//            return UIBarButtonItem(obj: $0) { item in
//                DDLog(item.title)
//            }
//        })
//        
//
//        view.addSubview(tableView);
//        tableView.tableHeaderView = searchBar
//
////        searchBar.isHidden = true
//    }
//
//    func requestForSearch(_ searchbar: UISearchBar) {
////        viewModel.listAPI.name = searchBar.text!;
//        tableView.mj_header.beginRefreshing();
//    }
//
//    @objc func request(_ isRefresh: Bool) {
////        api.startRequest { (manager, jsonData) in
////            self.tableView.mj_header.endRefreshing()
////            guard let jsonData = jsonData else { return }
////            guard let model = try? PHHQrcodeOverageTotalModel(dictionary: jsonData) else { return }
////            if PHHCommonStorage.giveCouponType() == .safetyGiveCouponType {
////                self.dataList.append(contentsOf: model.listModels.safeListModels)
////                if isRefresh {
////                    self.dataList.removeAll()
////                }
////                self.tableView.reloadData()
////            }
////
////        } failedBlock: { (manager, error) in
////            self.tableView.mj_header.endRefreshing()
////            guard let error = error else { return }
////            PHHHttpErrorHandler.handError(error: error)
////        }
//    }
//}
//
//extension IOPGoodsListNController: UITableViewDataSource, UITableViewDelegate{
//    //    MARK: - tableView
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataList.count
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return tableView.rowHeight
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellSubtitle", style: .subtitle)
//        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
//        cell.textLabel?.text = "--"
//        cell.textLabel?.textColor = .textColor3;
//
//        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
//        cell.detailTextLabel?.text = "--"
//        cell.detailTextLabel?.textColor = .textColor6;
//        cell.accessoryType = .disclosureIndicator;
//        
////        guard let model = dataList[indexPath.row] as? IOPParkModel else { return cell; }
////        cell.textLabel?.text = model.name
////        cell.detailTextLabel?.text = model.statusDes
////        cell.detailTextLabel?.textColor = model.statusDes == "已接入" ? UIColor.theme : UIColor.textColor9;
//
////        cell.getViewLayer()
//        return cell;
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        guard let model = dataList[indexPath.row] as? IOPParkModel else { return }
////        let controller = IOPParkDetailController()
////        controller.parkModel = model
////        navigationController?.pushViewController(controller, animated: true)
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 10.01;
//    }
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UILabel();
//    }
//    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return section == tableView.numberOfSections - 1 ? 10.01 : 0.01;
//    }
//    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return UILabel();
//    }
//}
//
//
////extension IOPGoodsListNController: IOPGoodsListNViewModelDelegate{
////
////    func request(with model: IOPGoodsListNRootModel, isRefresh: Bool, hasNextPage: Bool) {
////
////        DispatchQueue.global().async {
////            self.dataModel = model;
////            if isRefresh == true {
////                self.dataList.removeAllObjects()
////            }
//////            self.dataList.addObjects(from: self.dataModel.records)
////            DispatchQueue.main.async {
////                NNProgressHUD.dismiss()
////                self.tableView.mj_header.endRefreshing();
////                self.tableView.mj_footer.endRefreshing();
////                self.tableView.mj_footer.isHidden = !hasNextPage;
////                self.tableView.isHidden = (self.dataList.count <= 0);
////                self.tableView.reloadData();
////            }
////        }
////    }
////}
