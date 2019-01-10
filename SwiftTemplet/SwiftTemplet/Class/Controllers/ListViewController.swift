//
//  ListViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/9.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SDWebImage

class ListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        dataList = [["卡类型", "1", "", "cardName", false],
                     ["结束日期", "2", "", "validEndTime", false],
                     ["充值时长", "6", "", "balance", false],
                     ["缴费金额", "6", "", "recharge", false],
                     ]
        view.addSubview(tableView);

        if title == nil {
            title = self.controllerName;
        }
        
        for _ in 0...0 {
            let marr : NSMutableArray = [];
            for j in 0...3{
                marr.add(j);
                
            }
            dataList.add(marr);
        }
        
        //        DDLog(dataList);
        tableView.reloadData();
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count;
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arraySection : NSArray = dataList[section] as! NSArray;
        return arraySection.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60;
    };
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = UITableViewCellZero.cellWithTableView(tableView) as! UITableViewCellZero;
        let cell = UITableViewCellTextField.cellWithTableView(tableView) as! UITableViewCellTextField;
        cell.labelLeft.text = "日期选择:";
        cell.textfield.asoryView(true, unitName: "小时")
        cell.textfield.rightView = nil;
        cell.block { (sender:AnyObject) in
            if let textField = sender as? UITextField {
                DDLog(textField.text as Any)
            }
        }

        cell.getViewLayer();
        return cell;
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        cell.isSelected = !cell.isSelected
//        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120;
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch <#value#> {
        case <#pattern#>:
            <#code#>
        default:
            <#code#>
        }
        
        let view = UITableHeaderFooterViewTwo.viewWithTableView(tableView) as! UITableHeaderFooterViewTwo
        
        let text = "200小时"
        view.labelLeftSub.attributedText = self.attString(text, offsetStart: 0, offsetEnd: 2)

        view.backgroundView = UIView()
        view.backgroundView?.backgroundColor = UIColor.yellow
        view.getViewLayer()
        return view;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 45;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
     
        let label = UILabel(frame: .zero);
        label.backgroundColor = .green;
        label.text = "header\(section)";
        return label;
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var list: Array<Any> = {
        var array = [["卡类型", "1", "", "cardName", false],
                     ["结束日期", "2", "", "validEndTime", false],
                     ["充值时长", "6", "", "balance", false],
                     ["缴费金额", "6", "", "recharge", false],
                     ]
        
        return array;
    }()
}
