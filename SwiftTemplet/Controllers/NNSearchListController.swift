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
        
    
    lazy var titleView: NNSearchbarTitleView = {
        let view = NNSearchbarTitleView(frame: CGRectMake(0, 0, kScreenWidth - 2*15, 35))
        view.searchBar.layer.cornerRadius = 5;
        view.searchBar.layer.masksToBounds = true;
        view.searchBar.delegate = self

        view.cancellBtn.addActionHandler { (controll) in
            self.dismiss(animated: false, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }
        return view
    }()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        title = ""
        navigationItem.leftBarButtonItem?.setHidden(true)
        navigationItem.backBarButtonItem?.setHidden(true)

        setupUI()
        
        dataList.addObjects(from: ["1", "2", "3"])
        historyList.addObjects(from: ["1", "2", "3"])

        list.add(dataList)
        list.add(historyList)
        tableView.reloadData()
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.setBackgroudColor(nil, for: .default)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationItem.leftBarButtonItem?.setHidden(false)

    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - funtions
    func setupUI() {
        view.backgroundColor = .white

        navigationItem.titleView = titleView
        view.addSubview(tableView);

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
