//
//  PopViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/10/9.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class PopViewController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(btn)
        view.addSubview(btnOne)
        
        UIApplication.setupAppearanceSearchbarCancellButton()
        navigationItem.titleView = {
            let titleView = UIView(frame: self.searchBar.bounds)
            titleView.addSubview(self.searchBar)
            return titleView;
        }();

        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20);
            make.left.equalToSuperview().offset(20);
            make.width.equalTo(90);
            make.height.equalTo(30);
        }
        
        btnOne.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(220);
            make.left.equalToSuperview().offset(20);
            make.width.equalTo(80);
            make.height.equalTo(30);
        }
        
        btn.layoutButton(style: 3, imageTitleSpace: 3)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        popView.list = [["1", "70.0", "one"], ["2", "70.0", "two"], ["3", "70.0", "three"],
                        ["3", "70.0", "three"], ["3", "70.0", "three"],  ["3", "70.0", "three"],
                        ["3", "70.0", "three"],  ["3", "70.0", "three"], ["3", "70.0", "three"],]
        
    }
    
    // MARK: -UISearchBar
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool{
        return true;
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    // MARK: -lazy
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom);
        view.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 13);
        view.titleLabel?.adjustsFontSizeToFitWidth = true;
        view.titleLabel?.minimumScaleFactor = 1.0;
        view.isExclusiveTouch = true;
        view.setTitle("测试按钮", for: .normal)
        view.setImage(UIImageNamed("img_arrowDown_gray"), for: .normal)
        view.setTitleColor(UIColor.theme, for: .normal);
        view.addTarget(self, action: #selector(handleActionSender(_:)), for: .touchUpInside)
        return view
    }()
    
    lazy var btnOne: UIButton = {
        let view = UIButton(type: .custom);
        view.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 13);
        view.titleLabel?.adjustsFontSizeToFitWidth = true;
        view.titleLabel?.minimumScaleFactor = 1.0;
        view.isExclusiveTouch = true;
        view.setTitle("测试按钮1", for: .normal)
        view.setTitleColor(UIColor.theme, for: .normal);
        view.addTarget(self, action: #selector(handleActionSender(_:)), for: .touchUpInside)
        return view
    }()
    
    @objc func handleActionSender(_ sender: UIButton) {
//        DDLog(sender)
        popView.sender = sender;
        if sender.superview?.subviews.contains(popView) == true {
//            popView.removeFromSuperview();
            popView.dismiss();
        } else {
//            sender.superview!.addSubview(popView)
            popView.show();
        }
    }
   
    lazy var popView: NNPopView = {
        let view = NNPopView(frame: .zero)
        view.parController = self;
        return view
    }()

    
    lazy var searchBar: UISearchBar = {
        let view = UIView.createSearchBarRect(CGRectMake(0, 0, kScreenWidth - 100, 30))
        view.placeholderStr = "请输入流水号、商品信息或会员信息";
        view.delegate = self;
        return view
    }()
}