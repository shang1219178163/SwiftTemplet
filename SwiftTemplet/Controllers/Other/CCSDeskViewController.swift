//
//  CCSDeskViewController.swift
//  CloudCustomerService
//
//  Created by Bin Shang on 2019/9/11.
//  Copyright © 2019 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit
import SwiftExpand

class CCSDeskViewController: UIViewController {

    // MARK: -lazy
    
    lazy var searchView: NNSearchView = {
        let view = NNSearchView(frame: .zero)
        view.parController = self
        view.delegate = self;
        
        view.btn.parentVC = self
        view.btn.list = ["车场名称", "车牌号"]
        view.btn.setTitle(view.btn.list.first ?? "请选择", for: .normal)

        return view;
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background;
        
//        UIApplication.setupAppearanceSearchbarCancellButton()
        let titleView: UIView = {
            let titleView = UIView(frame: CGRect(0, 0, kScreenWidth-80, 35))
            titleView.backgroundColor = navigationController?.navigationBar.tintColor;
            
            searchView.frame = titleView.frame;
            titleView.addSubview(searchView);
            return titleView;
        }();
        navigationItem.titleView = titleView;
        
//        titleView.getViewLayer()
//        view.getViewLayer()
    }
    
    @objc func poperViewHide(_ noti: NSNotification) {
        searchView.btn.imageView?.transformRotationCycle();
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
        


}

extension CCSDeskViewController: NNSearchViewDelegate{
    // MARK: -NNSearchView
    func searchViewTextDidChange(_ view: NNSearchView, text: String, complete: Bool) {
        if text == "" {
            view.searchBar.textField?.resignFirstResponder();
            return;
        }
        
        if complete == true {

        } else {
           
        }
    }
}
