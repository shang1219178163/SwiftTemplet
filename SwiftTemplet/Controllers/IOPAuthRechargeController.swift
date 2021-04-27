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

class IOPAuthRechargeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tbView.tableFooterView = footerView
        view.addSubview(tbView);

        if title == nil {
            title = self.controllerName;
        }
     
        createBarItem( .done, isLeft: false) { (sender: AnyObject) in
            self.navigationController?.pushVC("IOPAuthDetailController")

        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        list = allList.randomElement()!;
        tbView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tbView.frame = view.bounds
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var allList: [[[String]]] = {
        return  [[["卡数量  ", "1", "60.0", "", "cardName", "0",],
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
    }()
    
    lazy var list:[[String]] = {
        return self.allList.first!;
    }()
    
    //MARK: -Lazy Property
    lazy var footerView: NNTableFooterView = {
        let view = NNTableFooterView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 150))
        view.label.text = ""
        view.label.textAlignment = .center
        view.btn.setTitle("提交", for: .normal)
        view.btn.addActionHandler({[weak self] (sender) in
            DDLog(sender.tag)
            
            }, for: .touchUpInside)
        return view
    }()
}

extension IOPAuthRechargeController: UITableViewDataSource, UITableViewDelegate {
     //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let itemList = list[indexPath.row]
        let height = itemList[5] == "0" ? CGFloat(itemList[2].floatValue) : 0.0
        return height
    };
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemList = list[indexPath.row]
        
        switch itemList[1].intValue {
        case 1:
            let cell = UITableViewCellOne.dequeueReusableCell(tableView)
            cell.labelLeft.text = itemList[0]
            cell.labelRight.text = itemList[4]

            cell.isHidden = itemList[5] == "0" ? false : true
            return cell

        case 102:
            let cell = UITableViewCellDatePicker.dequeueReusableCell(tableView)
            cell.labelLeft.text = itemList[0]
            cell.textfield.text = itemList[4]
            cell.textfield.textAlignment = .right

            return cell
            
        case 106:
            let cell = UITableViewCellTextField.dequeueReusableCell(tableView)
            cell.labelLeft.text = itemList[0]
//            cell.textfield.asoryView(true, text: itemList.last!)
            cell.textfield.addRightViewLabel { (sender) in
                sender.font = UIFont.systemFont(ofSize: 14)
                sender.text = itemList.last!
            }
//            cell.textfield.rightView = nil;
            
            cell.textfield.textAlignment = .right
            
            cell.block { (sender:AnyObject) in
                if let textField = sender as? UITextField {
                    DDLog(textField.text as Any)
                }
            }
            return cell
        case 105:
            let cell = UITableViewCellStep.dequeueReusableCell(tableView)
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
        let cell = UITableViewCellZero.dequeueReusableCell(tableView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120;
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UITableHeaderFooterViewTwo.dequeueReusableHeaderFooterView(tableView)
        
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
}
