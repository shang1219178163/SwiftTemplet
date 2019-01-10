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

        view.addSubview(tableView);

        if title == nil {
            title = self.controllerName;
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
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let itemList = list[indexPath.row]
        return CGFloat(itemList[2].floatValue())
    };
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemList = list[indexPath.row]
        
        switch itemList[1].intValue() {
        case 1:
            let cell = UITableViewCellOne.cellWithTableView(tableView) as! UITableViewCellOne
            cell.labelLeft.text = itemList[0]
            cell.labelRight.text = itemList[4]
            cell.labelRight.textAlignment = .right

            return cell

        case 2:
            let cell = UITableViewCellDatePicker.cellWithTableView(tableView) as! UITableViewCellDatePicker
            cell.labelLeft.text = itemList[0]
            cell.textfield.text = itemList[4]
            cell.textfield.textAlignment = .right

            return cell
            
        case 6:
            let cell = UITableViewCellTextField.cellWithTableView(tableView) as! UITableViewCellTextField
            cell.labelLeft.text = itemList[0]
            cell.textfield.asoryView(true, unitName: itemList.last)
//            cell.textfield.rightView = nil;
            
            cell.textfield.textAlignment = .right
            
            cell.block { (sender:AnyObject) in
                if let textField = sender as? UITextField {
                    DDLog(textField.text as Any)
                }
            }
            return cell

        default:
            break
            
        }
        let cell = UITableViewCellZero.cellWithTableView(tableView) as! UITableViewCellZero;
        return cell
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
    
    lazy var list: [[String]] = {
        var array: [[String]] = [["卡类型  ", "1", "60.0", "", "cardName", "0",],
                                 ["结束日期", "2", "60.0", "", "validEndTime", "0",],
                                 ["充值时长", "6", "60.0", "", "balance", "0", "  小时"],
                                 ["缴费金额", "6", "60.0", "", "recharge", "0", "  元    "],
                                 ]
        return array
    }()
}
