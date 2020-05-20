//
//  PlateKeybordController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/12/6.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import PlateKeyboard_iOS

class PlateKeybordController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
//        view.addSubview(searchView)
//        handler.setPlate(plate: "", type: .auto)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        searchView.snp.makeConstraints { (make) in
            make.top.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(45)
        }
    }
    
    // MARK: -funtions
    func setupUI() {
        view.addSubview(searchView)
        
        searchView.isPlateKeyborad = true;
        searchView.delegate = self;
        searchView.searchBar.textField?.placeholder = "搜索车牌号码";
        searchView.searchBar.textField?.leftViewMode = .always;
//        searchView.btn.isHidden = true;
        searchView.btn.setTitle("操作类型", for: .normal)
//        searchView.popView.list = [["全部", "50.0", ""], ["修改车牌", "50.0", "2"], ["免费开闸", "50.0", "0"],
//                                   ["紧急开闸", "50.0", "1"], ["重新抓拍", "50.0", "3"], ]
//
//        searchView.popView.viewBlockDidSelectRow { (tableView, indexPath) in
//            DDLog(indexPath)
//            let popCellList = self.searchView.popView.list[indexPath.row];
//            let title = indexPath.row == 0 ? "操作类型" : popCellList.first;
//            self.searchView.btn.setTitle(title, for: .normal);
//
//        }
        
        searchView.searchBar.textField?.becomeFirstResponder()
    }
    
    lazy var searchView: NNSearchView = {
        let view = NNSearchView(frame: CGRectMake(0, 45, self.view.bounds.width, 45))
        view.parController = self
//        view.searchBar.textField?.leftViewMode = .never
        view.searchBar.textField?.placeholder = "搜索车场名称";
//        view.searchBar.delegate = self;
        
        return view;
    }()

}

extension PlateKeybordController: NNSearchViewDelegate {
    // MARK: -NNSearchView
    func searchViewTextDidChange(_ view: NNSearchView, text: String, complete isFinished: Bool) {
        if text == "" {
            view.searchBar.textField?.resignFirstResponder();
            return;
        }
        if isFinished == true {

        } else {
           
        }
        DDLog(text)
    }
        
}

