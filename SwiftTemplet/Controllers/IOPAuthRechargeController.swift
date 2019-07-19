//
//  IOPAuthRechargeController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/9.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SDWebImage

class IOPAuthRechargeController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = footerView
        view.addSubview(tableView);

        if title == nil {
            title = self.controllerName;
        }
     
        
        createBarItem( .edit, isLeft: true) { (sender: AnyObject) in
            self.goController("FleetDetailControllerNew", obj: nil, objOne: nil)
        }
        
        createBarItem( .done, isLeft: false) { (sender: AnyObject) in
            self.goController("IOPAuthDetailController", obj: nil, objOne: nil)

        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        list = allList.randomElement()!;
        tableView.reloadData()
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
        let height = itemList[5] == "0" ? CGFloat(itemList[2].floatValue()) : 0.0
        return height
    };
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemList = list[indexPath.row]
        
        switch itemList[1].intValue() {
        case 1:
            let cell = UITableViewCellOne.cellWithTableView(tableView) as! UITableViewCellOne
            cell.labelLeft.text = itemList[0]
            cell.labelRight.text = itemList[4]

            cell.isHidden = itemList[5] == "0" ? false : true
            return cell

        case 102:
            let cell = UITableViewCellDatePicker.cellWithTableView(tableView) as! UITableViewCellDatePicker
            cell.labelLeft.text = itemList[0]
            cell.textfield.text = itemList[4]
            cell.textfield.textAlignment = .right

            return cell
            
        case 106:
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
        case 105:
            let cell = UITableViewCellStep.cellWithTableView(tableView) as! UITableViewCellStep
            cell.labelLeft.text = itemList[0]
            cell.ppBtn.minValue = 0
            cell.ppBtn.maxValue = 10
//            cell.ppBtn.currentNumber = itemList[4]
            cell.ppBtn.currentNumber = "6"

            cell.textfield.textAlignment = .right
            cell.getViewLayer()
            return cell
            
        default:
            break
            
        }
        let cell = UITableViewCellZero.cellWithTableView(tableView) as! UITableViewCellZero;
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120;
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UITableHeaderFooterViewTwo.viewWithTableView(tableView) as! UITableHeaderFooterViewTwo
        
        let text = "¥200小时"
        view.labelLeftSub.attributedText = NSAttributedString.attString(text, offsetStart: 0, offsetEnd: 2)

        view.backgroundView = UIView()
        view.backgroundView?.backgroundColor = UIColor.yellow
        view.getViewLayer()
        return view;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
     
        let label = UILabel(frame: .zero);
//        label.backgroundColor = .green;
//        label.text = "header\(section)";
        return label;
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var allList: [[[String]]] = {
        var array: [[[String]]] = [
                                    [["卡数量  ", "1", "60.0", "", "cardName", "0",],
                                    ["充值数量", "105", "60.0", "", "validEndTime", "0",],
                                    ["结束时间", "102", "60.0", "", "balance", "0",],
                                    ["应付金额", "106", "60.0", "", "recharge", "0", "  元    "],
                                    ],
                                    [["内嵌车场  ", "1", "60.0", "", "cardName", "1",],
                                     ["卡类型  ", "1", "60.0", "", "cardName", "0",],
                                     ["结束日期", "102", "60.0", "", "validEndTime", "0",],
                                     ["充值时长", "106", "60.0", "", "balance", "0", "  小时"],
                                     ["缴费金额", "106", "60.0", "", "recharge", "0", "  元    "],
                                     ]
                                    ]
        return array
    }()
    
    lazy var list:[[String]] = {
        return self.allList.first!;
    }()
    
    //MARK: -Lazy Property
    lazy var footerView: BNTableFooterView = {
        var view = BNTableFooterView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 150))
        view.label.text = ""
        view.label.textAlignment = .center
        view.btn.setTitle("提交", for: .normal)
        view.btn.addActionHandler({[weak self] (sender:UIControl) in
            let obj = sender as! UIButton
            DDLog(obj.tag)
            
            }, for: .touchUpInside)
        return view
    }()
}
