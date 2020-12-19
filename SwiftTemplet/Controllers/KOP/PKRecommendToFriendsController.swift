//
//	PKRecommendToFriendsController.swift
//	MacTemplet
//
//	Created by shang on 2020/07/16 18:26
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
        
///
@objcMembers class PKRecommendToFriendsController: UIViewController{
        
    lazy var tableView: UITableView = {
        guard let tableView = view.findSubView(UITableView.self) as? UITableView else {
            let view = UITableView.create(self.view.bounds, style: .plain, rowHeight: 50)
//            view.dataSource = self
//            view.delegate = self
            return view
        }
        return tableView
    }()
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        title = ""
        setupUI()
        
//        tableView.mj_header.beginRefreshing()
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
        view.backgroundColor = UIColor.white

//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)

    }

}
