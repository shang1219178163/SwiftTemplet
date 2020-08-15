//
//	NNSearchListController.swift
//	MacTemplet
//
//	Created by shang on 2020/07/28 10:28
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand

/// 列表
@objcMembers class NNSearchListController: UIViewController{
    
    /// 数据请求返回
    var dataModel = NSObject()
    
//    lazy var viewModel: PKParkSearchListViewModel = {
//        let viewModel = PKParkSearchListViewModel()
//        viewModel.delegate = self
//        return viewModel
//    }()
        
    var list = NSMutableArray()
    var dataList = NSMutableArray()
    var historyList = NSMutableArray()

    // MARK: - lazy
    lazy var tableView: UITableView = {
        let view: UITableView = UITableView.create(self.view.bounds, style: .plain, rowHeight: 60)
        view.dataSource = self
        view.delegate = self

//        view.mj_header = MJRefreshNormalHeader(refreshingBlock: {
//            self.viewModel.requestRefresh()
//        });
//
//        view.mj_footer = MJRefreshBackNormalFooter(refreshingBlock: {
//            self.viewModel.requestRefresh()
//        });

//        view.holderView.getViewLayer()
        return view
    }()
        
    
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar.create(CGRectMake(0, 0, kScreenWidth - (44 - 20)*1, 30))
        view.layer.cornerRadius = 0;
        view.showsCancelButton = true;
        view.backgroundColor = .theme
        view.textField?.textColor = .gray
        view.textField?.placeholder = "请输入停车场名称";
        view.textField?.backgroundColor = UIColor.theme
        view.textField?.layer.cornerRadius = 5;
        view.textField?.layer.masksToBounds = true;

        view.delegate = self;
        return view
    }()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        title = ""
        setupUI()
        
        dataList.addObjects(from: ["1", "2", "3"])
        historyList.addObjects(from: ["1", "2", "3"])

        list.add(dataList)
        list.add(historyList)
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if searchBar.isHidden {
            return;
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

//        navigationItem.leftBarButtonItem = nil
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - funtions
    func setupUI() {
        view.backgroundColor = .white
//        navigationItem.rightBarButtonItem = UIBarBut.ptonItem(customView: rightBtn)
        
//        let item = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(handleAction));
//        navigationItem.rightBarButtonItem = item
        
//        navigationItem.setHidesBackButton(true, animated: false)
//        if navigationItem.hidesBackButton {
//            searchBar.frame = CGRectMake(0, 0, kScreenWidth - 80, 30)
//        }
        
        let titleView: UIView = UIView(frame: searchBar.bounds)
        titleView.addSubview(searchBar)
        navigationItem.titleView = titleView
        
        view.addSubview(tableView);
//        tableView.setHolderViewImage(UIImage(named: "img_placeholder_search")!, for: .empty)
//        tableView.setHolderViewTitle("试一试搜索功能，搜索你想去的停车场吧！", for: .empty)
//        tableView.holderView.isHidden = false
        
//        tableView.setHolderView(for: .loading)
//        tableView.setHolderView(for: .empty)

        searchBar.getViewLayer()
        navigationController?.navigationBar.getViewLayer()
    }

    func requestForSearch(_ searchbar: UISearchBar) {
//        viewModel.listAPI.name = searchBar.text!;
//        tableView.mj_header.beginRefreshing();
    }

    
    @objc func handleAction() {
        
    }

}

extension NNSearchListController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (list[section] as! NSMutableArray).count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCellSudokuLabel.dequeueReusableCell(tableView);
//            cell.accessoryType = .disclosureIndicator
        cell.numOfRow = 1
        cell.row = 2
        cell.items.forEach { $0.textColor = .systemBlue }
        
        let sender = cell.assoryBtn(NNButton.self)
        sender.frame = CGRect(x: 0, y: 0, width: 27, height: 35)
        sender.labelHeight = 15
        sender.direction = .top
        sender.setTitleColor(.textColor3, for: .normal)
        
        sender.setImage(UIImage(named: "icon_map_driver_black"), for: .normal)
        sender.setTitle("去这里", for: .normal)

        sender.getViewLayer()
                
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let model = dataList[indexPath.row] as? IOPParkModel else { return }
//        let controller = IOPParkDetailController()
//        controller.parkModel = model
//        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = section == 0 ? "我的收藏" : "历史记录"
        let view = tableView.createSectionViewLabel { (label) in
            label.text = title
            label.textColor = .black
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UILabel();
    }
}

extension NNSearchListController: UISearchBarDelegate{
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
//        searchBar.showsCancelButton = !(searchBar.text!.count == 1 && text == "")
        return true;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        requestForSearch(searchBar)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
