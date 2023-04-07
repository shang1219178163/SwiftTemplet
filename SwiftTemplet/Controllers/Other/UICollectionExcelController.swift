//
//  UICollectionExcelController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/5/22.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

import SwiftExpand
import NNExcelView

class UICollectionExcelController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "UIExcel"
        view.backgroundColor = UIColor.white
       
        view.addSubview(excelView)
        
//        excelView.widthList = [80, 80, 80, 80, 80, 80, 80, 80, 80, 80, ]
//        excelView.titleList = ["名称", "总数", "剩余", "IP", "状态", "状态1", "状态2", "状态3", "状态4", "状态5"]
//        excelView.dataList = [["名称1", "总数", "剩余", "IP", "状态", "状态1", "状态2", "状态3", "状态4", "状态5"],
//                              ["名称2", "总数", "剩余", "IP", "状态", "状态1", "状态2", "状态3", "状态4", "状态5"],
//                              ["名称3", "总数", "剩余", "IP", "状态", "状态1", "状态2", "状态3", "状态4", "状态5"]]
        
        excelView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 300)
        excelView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }
        

    

    
    lazy var excelView: NNExcelView = {
        let excelView = NNExcelView(frame: self.view.bounds)
//        excelView.lockColumn = 2
        excelView.delegate = self
        return excelView
    }()
}

extension UICollectionExcelController: NNExcelViewDelegate {
    func excelView(_ label: UILabel, didSelectItemAt indexPath: IndexPath) {
        DDLog(indexPath.toString())
    }
    
}
