//
//  NNSearchOneController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/15.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit

class NNSearchOneController: UIViewController, UISearchBarDelegate {
    
    
    
    var tableView: UITableView {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 50)
        if self.conforms(to: UITableViewDataSource.self) {
            view.dataSource = self as? UITableViewDataSource;
        }
        if self.conforms(to: UITableViewDelegate.self) {
            view.delegate = self as? UITableViewDelegate;
        }
        return view
    }


    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "searchChannels"
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.delegate = self
        searchController.searchBar.backgroundColor = navigationController?.navigationBar.barTintColor
        searchController.searchBar.textField?.backgroundColor = .white
        searchController.searchBar.textField?.layer.cornerRadius = 5;
        searchController.searchBar.textField?.layer.masksToBounds = true

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
