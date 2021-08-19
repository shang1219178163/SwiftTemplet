//
//  NNSearchOneController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/15.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit

class NNSearchOneController: UIViewController, UISearchBarDelegate {
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by name or genre"
        searchController.searchBar.backgroundColor = navigationController?.navigationBar.barTintColor
        searchController.searchBar.tintColor = navigationController?.navigationBar.tintColor
        searchController.searchBar.textField?.backgroundColor = .white
        searchController.searchBar.textField?.layer.cornerRadius = 5;
        searchController.searchBar.textField?.layer.masksToBounds = true
//        searchController.searchBar.scopeButtonTitles = ["种类 1", "种类 2", "种类 3", ]

        definesPresentationContext = true
        return searchController
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 60)
        if self.conforms(to: UITableViewDataSource.self) {
            view.dataSource = self as? UITableViewDataSource;
        }
        if self.conforms(to: UITableViewDelegate.self) {
            view.delegate = self as? UITableViewDelegate;
        }
        return view
    }()


    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        edgesForExtendedLayout = []

        if #available(iOS 11, *) {
            navigationItem.hidesSearchBarWhenScrolling = false
            navigationItem.searchController = searchController
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }
    
        view.addSubview(tableView)
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }

}


extension NNSearchOneController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: UITableViewCell.self)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
