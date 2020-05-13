//
//  PopViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/10/9.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class PopViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(btn)
        view.addSubview(btnOne)
        view.addSubview(label)

        UIApplication.setupAppearanceSearchbarCancellButton(UIColor.white)
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
        
        label.snp.makeConstraints { (make) in
            make.top.equalTo(btn.snp.bottom).offset(20);
            make.left.equalToSuperview().offset(20);
            make.right.equalToSuperview().offset(-20);
            make.height.equalTo(30);
        }
        
        btnOne.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(220);
            make.left.equalToSuperview().offset(20);
            make.width.equalTo(80);
            make.height.equalTo(30);
        }
        
        btn.layoutButton(direction: 3, imageTitleSpace: 3)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        popView.list = [["1", "50.0", "one"], ["2", "50.0", "two"], ["3", "50.0", "three"],
                        ["3", "50.0", "three"], ["4", "50.0", "three"],  ["5", "50.0", "three"],
                        ["6", "50.0", "three"],  ["7", "50.0", "three"], ["8", "50.0", "three"],]

    }
    

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
           DDLog(textField)
           return true;
       }
    
    // MARK: -lazy
    
    lazy var label: UILabel = {
        let view = UILabel();
        view.font = UIFont.systemFont(ofSize: 13);
        view.text = "--"
        return view
    }()
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
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
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
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
        let view = UISearchBar.create(CGRectMake(0, 0, kScreenWidth - 100, 30))
        view.textField?.placeholder = "请输入流水号、商品信息或会员信息";
        view.textField?.delegate = self;
        view.delegate = self;
        view.backgroundColor = .white
        return view
    }()
}

extension PopViewController: UISearchBarDelegate {
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
        DDLog(searchText);
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        searchBar.showsCancelButton = !(searchBar.text!.count == 1 && text == "")
        searchBar.cancellBtn?.setTitle("取消", for: .normal)
        return true;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = "";
        searchBar.showsCancelButton = (searchBar.text != "")
        searchBar.cancellBtn?.setTitle("取消", for: .normal)
    }
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
}
//extension PopViewController: UITextFieldDelegate {
//
//    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        DDLog(textField)
//        return true;
//    }
//
//}
