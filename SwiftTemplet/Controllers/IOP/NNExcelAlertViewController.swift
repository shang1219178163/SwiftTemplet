//
//	NNExcelAlertViewController.swift
//	MacTemplet
//
//	Created by shang on 2020/11/19 10:34
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand
import NNExcelView

///
@objcMembers class NNExcelAlertViewController: UIViewController{
        
    lazy var excelView: NNExcelView = {
        let view = NNExcelView(frame: CGRect(x: 0, y: 0, width: kScreenWidth - 60, height: 135))
//        view.lockColumn = 2
        view.titleLabel.isHidden = true
        view.cellItemBlock = { label, indexP in
            label.adjustsFontSizeToFitWidth = true
            label.font = UIFont.systemFont(ofSize: 13)
            label.textColor = .textColor3
        }
        
        view.titleList = ["时段", "单位价格", "封顶价格",]
        view.dataList = [["08:00 - 20:00", "2元/小时", "封顶20元",],
                          ["08:00 - 20:00", "2元/小时", "封顶20元",],
                          ]
        view.reloadData()
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
        
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItems = ["show", "done"].map({
            UIBarButtonItem(obj: $0) { (item: UIBarButtonItem) in

                switch item.title {
                case "show":
                    self.alertView.show()

                default:
                    self.showAlertExcelView()
                    DDLog(item.title)
                }
            }
        })
        
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
        

    
    // MARK: - funtions
    @objc func showAlertExcelView() {
        let textView = UITextView()

        let message = "备注：（非必填）"

        let alertVC = UIAlertController(title: "审核通过",
                                        message: message,
                                        preferredStyle: .alert)
            .addActionTitles([kTitleCancell, "确认通过"]) { vc, action in
                textView.resignFirstResponder()
                DDLog(action.title)
                DDLog(textView.text)
            }

        alertVC.setContent(view: self.excelView, height: self.excelView.bounds.height, inset: UIEdgeInsets(top: 0, left: 15, bottom: 8, right: 15))
        alertVC.present()
        
    }
}

