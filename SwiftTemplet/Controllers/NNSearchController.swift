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
    
    // MARK: -lazy
    lazy var searchResultVC: NNSearchResultController = {
        let controller = NNSearchResultController()
        return controller;
    }()
  
    lazy var searchVC: UISearchController = {
        let controller = self.createSearchVC(self.searchResultVC)
        
//        controller.searchBar.delegate = self;
        controller.delegate = self;
        return controller
    }()
}

extension NNSearchController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCellOne.dequeueReusableCell(tableView)
        cell.labelLeft.text = "\(indexPath.row)"
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

extension UIViewController{
    
//    /// [源]创建UISearchController(设置IQKeyboardManager.shared.enable = false;//避免searchbar下移)
//    func createSearchVC(_ resultsController: UIViewController) -> UISearchController {
//        definesPresentationContext = true;
//
//        let searchVC = UISearchController(searchResultsController: resultsController)
//        if resultsController.conforms(to: UISearchResultsUpdating.self) {
//            searchVC.searchResultsUpdater = resultsController as? UISearchResultsUpdating;
//        }
//        
//        searchVC.dimsBackgroundDuringPresentation = true;
////        searchVC.hidesNavigationBarDuringPresentation = true;
//        if #available(iOS 9.1, *) {
//            searchVC.obscuresBackgroundDuringPresentation = true;
//        }
//        
//        searchVC.searchBar.barStyle = .default;
////        searchVC.searchBar.barTintColor = UIColor.theme;
//
//        searchVC.searchBar.isTranslucent = false;
//        searchVC.searchBar.setValue("取消", forKey: "_cancelButtonText")
//        searchVC.searchBar.placeholder = "搜索";
//        
////        searchVC.searchBar.delegate = self;
////        searchVC.delegate = self;
//        return searchVC;
//    }
}
