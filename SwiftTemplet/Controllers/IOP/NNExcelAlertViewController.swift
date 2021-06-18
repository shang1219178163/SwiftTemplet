//
//	NNExcelAlertViewController.swift
//	MacTemplet
//
//	Created by shang on 2020/11/19 10:34
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand

///
@objcMembers class NNExcelAlertViewController: UIViewController{
        

    lazy var rightBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("Next", for: .normal)

        view.addActionHandler({ (sender) in
//            let controller = UIViewController()
//            self.navigationController?.pushViewController(controller, animated: true)
            self.alertView.show()
            
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var alertView: NNExcelAlertView = {
        let view = NNExcelAlertView(frame: .zero)
//        view.frame = CGRect(x: 0, y: 0, width: UIScreen.sizeWidth, height: UIScreen.sizeHeight)
//        view.titleLabel.textColor = .black
        view.excelView.visibleNumOfRow = 2
        view.excelView.titleLabel.text = "    全天"
        view.excelView.titleLabel.backgroundColor = UIColor.hexValue(0xF5F5F5)
        view.excelView.titleLabel.isHidden = true
        view.contentView.layer.cornerRadius = 5
        
        view.block = { sender in
            view.dismiss()
        }
        return view
    }()
        
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        title = ""
        setupUI()
        
//        alertView.excelView.headerBackgroudColor = .white
//        alertView.excelView.headerBackgroudColor = UIColor.hexValue(0xF5F5F5, a: 1)
        alertView.excelView.titleList = ["时段", "单位价格", "封顶价格",]
        alertView.excelView.dataList = [["08:00 - 20:00", "2元/小时", "封顶20元",],
                                   ["08:00 - 20:00", "2元/小时", "封顶20元",],
                                    ]
        alertView.excelView.reloadData()
        
//        alertVi.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - funtions
    func setupUI() {
        edgesForExtendedLayout = []
        view.backgroundColor = .white

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
    }

}

