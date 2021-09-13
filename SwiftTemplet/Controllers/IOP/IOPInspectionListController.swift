//
//	IOPInspectionListController.swift
//	MacTemplet
//
//	Created by Shang on 2021/08/16 18:03
//	Copyright © 2021 shang. All rights reserved.
//



import UIKit
import SwiftExpand
import MJRefresh
import RxCocoa
import RxSwift

/// 列表
@objcMembers class IOPInspectionListController: UIViewController{
    
    let disposeBag = DisposeBag()
    
    /// 数据请求返回
    var dataModel = NSObject()
    
    lazy var viewModel = NSObject()
        
    var dataList = NSMutableArray()

    // MARK: - lazy
    lazy var tableView: UITableView = {
        let view = UITableView.create(self.view.bounds, style: .plain, rowHeight: 70)
        view.dataSource = self
        view.delegate = self

//        view.mj_header = MJRefreshNormalHeader(refreshingBlock: {
//            self.viewModel.requestRefresh()
//        })
//
//        view.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {
//            self.viewModel.requestRefresh()
//        })
        
        view.placeHolderView.setTitle("暂无问题反馈", for: .empty)
        view.placeHolderView.setImage(UIImage(named: "img_placeholder_empty")!, for: .empty)
//        view.placeHolderView.setTitle("网络连接错误，请稍后重试", for: .fail)
//        view.placeHolderView.setImage(UIImage(named: "img_placeholder")!, for: .fail)
        view.placeHolderView.btn.isHidden = false
        view.placeHolderView.btn.setTitle("+新增反馈", for: .normal)

        view.placeHolderView.getViewLayer()
//        view.placeHolderView.delegate = self
        return view
    }()
        

    lazy var searchBar: UISearchBar = {
        let view = UISearchBar(frame: CGRectMake(0, 0, kScreenWidth - 70, 50))
        view.textField?.placeholder = "请输入标题关键字搜索"
        view.rxDrive { value in
            DDLog(value)
        }.disposed(by: disposeBag)
//        view.delegate = self
        return view
    }()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        DispatchQueue.main.async {
            self.tableView.placeHolderView.state = .fail
            self.tableView.reloadData()
//            self.tableView.placeHolderView.state = .fail
        }
        DDLog(self.tableView.isEmpty)
    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - funtions
    func setupUI() {
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = "问题反馈"
        navigationItem.rightBarButtonItems = ["+新增反馈"].map({
            return UIBarButtonItem(obj: $0) { item in
                DDLog(item.title)
            }
        })
        tableView.tableHeaderView = searchBar
        view.addSubview(tableView);

//        searchBar.isHidden = true
    }

    func requestForSearch(_ searchbar: UISearchBar) {
//        viewModel.listAPI.name = searchBar.text!
        tableView.mj_header!.beginRefreshing()
    }

    @objc func request(_ isRefresh: Bool) {
//        api.startRequest { (manager, jsonData) in
//            self.tableView.mj_header.endRefreshing()
//            guard let jsonData = jsonData else { return }
//            guard let model = try? PHHQrcodeOverageTotalModel(dictionary: jsonData) else { return }
//            if PHHCommonStorage.giveCouponType() == .safetyGiveCouponType {
//                self.dataList.append(contentsOf: model.listModels.safeListModels)
//                if isRefresh {
//                    self.dataList.removeAll()
//                }
//                self.tableView.reloadData()
//            }
//
//        } failedBlock: { (manager, error) in
//            self.tableView.mj_header.endRefreshing()
//            guard let error = error else { return }
//            PHHHttpErrorHandler.handError(error: error)
//        }
    }
}

extension IOPInspectionListController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCellSubtitle.dequeueReusableCell(tableView)
        cell.labelRightSub.text = DateFormatter.stringFromDate(Date())
        cell.btn.isHidden = true
        
//        guard let model = dataList[indexPath.row] as? IOPParkModel else { return cell; }
//        cell.textLabel?.text = model.name
//        cell.detailTextLabel?.text = model.statusDes
//        cell.detailTextLabel?.textColor = model.statusDes == "已接入" ? UIColor.theme : UIColor.textColor9;

//        cell.getViewLayer()
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let model = dataList[indexPath.row] as? IOPParkModel else { return }
//        let vc = IOPParkDetailController()
//        vc.parkModel = model
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.01;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UILabel();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == tableView.numberOfSections - 1 ? 10.01 : 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UILabel();
    }
}


//extension IOPWorkOrderListController: IOPGoodsListViewModelDelegate{
//
//    func request(with model: IOPGoodsListRootModel, isRefresh: Bool, hasNextPage: Bool) {
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
