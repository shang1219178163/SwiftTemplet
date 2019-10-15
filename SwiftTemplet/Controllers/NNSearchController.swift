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

@available(iOS 9.1, *)
class NNSearchController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate, UISearchBarDelegate {
   
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tbView)
        tbView.tableHeaderView = self.searchVC.searchBar;
        
        //键盘
        IQKeyboardManager.shared.enable = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCellOne.cellWithTableView(tableView) as! UITableViewCellOne
        cell.labelLeft.text = "\(indexPath.row)"
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DDLog(indexPath.row)
    }
    
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
    
    // MARK: -lazy
    lazy var searchResultVC: NNSearchResultController = {
        let controller = NNSearchResultController()
//        controller.extendedLayoutIncludesOpaqueBars = true;
//        controller.edgesForExtendedLayout = []
        return controller;
    }()
  
    lazy var searchVC: UISearchController = {
        let controller = UIViewController.createSearchVC(self.searchResultVC)
        definesPresentationContext = true;
        
//        controller.searchBar.delegate = self;
        controller.delegate = self;
        return controller
    }()
}


extension UIViewController{
    
    static func createSearchVC(_ resultsController: UIViewController) -> UISearchController {
        let searchVC = UISearchController(searchResultsController: resultsController)
        if resultsController.conforms(to: UISearchResultsUpdating.self) {
            searchVC.searchResultsUpdater = resultsController as? UISearchResultsUpdating;
        }

        searchVC.dimsBackgroundDuringPresentation = true;
//        searchVC.obscuresBackgroundDuringPresentation = true;
//        searchVC.hidesNavigationBarDuringPresentation = true;
//        definesPresentationContext = YES;
        
        searchVC.searchBar.barStyle = .default;
        searchVC.searchBar.isTranslucent = false;
//        searchVC.searchBar.barTintColor = [UIColor brownColor];
        searchVC.searchBar.setValue("取消", forKey: "_cancelButtonText")
        searchVC.searchBar.placeholder = "搜索";
        
//        searchVC.searchBar.delegate = self;
//        searchVC.delegate = self;
        return searchVC;
    }
}
