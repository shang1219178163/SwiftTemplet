//
//  CCSDeskViewController.swift
//  CloudCustomerService
//
//  Created by Bin Shang on 2019/9/11.
//  Copyright © 2019 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit
import SwiftExpand

class CCSDeskViewController: UIViewController, NNSearchViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.background;
        
        UIApplication.setupAppearanceSearchbarCancellButton()
        let titleView: UIView = {
            let titleView = UIView(frame: CGRectMake(0, 0, kScreenWidth-25, 35))
            titleView.backgroundColor = navigationController?.navigationBar.tintColor;
            
            searchView.frame = titleView.frame;
            titleView.addSubview(searchView);
            return titleView;
        }();
        navigationItem.titleView = titleView;
        
        
        titleView.getViewLayer()
//        view.getViewLayer()
    }
    
    @objc func poperViewHide(_ noti: NSNotification) -> Void {
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
    
    // MARK: -NNSearchView
    func searchViewTextDidChange(_ view: NNSearchView, text: String, isFinished: Bool) {
        if text == "" {
            view.searchBar.textField?.resignFirstResponder();
            return;
        }
        
        if isFinished == true {

        } else {
           
        }
    }
    
    // MARK: -lazy
    lazy var searchList: [[AnyHashable : Any]] = {
        let list = [["index": "0",
                     "title": "车场名称",
                     "key": "park_name",
                     ],
                    ["index": "1",
                     "title": "车牌号",
                     "key": "vpl",
                     ],
                    ];
        return list;
    }()
    
    lazy var searchView: NNSearchView = {
        let view = NNSearchView(frame: .zero)
        view.btn.addTarget(self, action: #selector(showMenu(_:)), for: .touchUpInside)
        view.delegate = self;
        return view;
    }()
    
    @objc func showMenu(_ sender: UIButton) -> Void {
        DDLog(sender.currentTitle as Any)
//        sender.imageView!.transformRotationCycle()
//        PopoverView.show(sender, list: self.searchList, handler: { (action, dic) in
//            sender.imageView!.transformRotationCycle()
//            sender.setTitle(action.title, for: .normal)
//            DDLog(dic)
//            self.searchResultVC.key = dic["key"] as! String;
//
//        })
    }

    

}
