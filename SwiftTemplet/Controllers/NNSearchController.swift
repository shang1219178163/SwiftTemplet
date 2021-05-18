//
//  NNSearchController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/10/15.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand
import IQKeyboardManagerSwift

class NNSearchController: UIViewController {
    
    lazy var searchResultVC: NNSearchResultController = {
        let controller = NNSearchResultController()
//        controller.edgesForExtendedLayout = []
        return controller;
    }()
  
    lazy var searchVC: UISearchController = {
        let controller = self.createSearchVC(self.searchResultVC)
        controller.searchResultsUpdater = self
        controller.delegate = self;
        return controller
    }()
    
//    let list = [String].init(repeating: "0", count: 100)
    let list = Array<Int>.generate(10, 100, 2);

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tbView)
        tbView.tableHeaderView = self.searchVC.searchBar;
        tbView.tableFooterView = UIView();

        IQKeyboardManager.shared.enable = false;
                
        let btn = self.searchVC.searchBar.cancellBtn
        btn?.setTitle("11111", for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }


}

extension NNSearchController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCellOne.dequeueReusableCell(tableView)
        cell.labelLeft.text = "\(list[indexPath.row])"
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DDLog(indexPath.row)
    }
}

extension NNSearchController: UISearchControllerDelegate {
    // MARK: -UISearchController
    func willPresentSearchController(_ searchController: UISearchController){

    }
    func willDismissSearchController(_ searchController: UISearchController){

    }
    
    func didPresentSearchController(_ searchController: UISearchController){
        
    }
    
    func didDismissSearchController(_ searchController: UISearchController){

    }
    
    func presentSearchController(_ searchController: UISearchController){
        
    }
}


extension NNSearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let query = searchController.searchBar.text else { return }
        DDLog(query)
        searchResultVC.query = query
    }
    
}
