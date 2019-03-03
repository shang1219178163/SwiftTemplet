//
//  IOPAuthDetailController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/10.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SDWebImage

class IOPAuthDetailController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = footerView
        view.addSubview(tableView);
        
        if title == nil {
            title = self.controllerName;
        }
        
        //        DDLog(dataList);
//        tableView.reloadData();
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
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionList = list[section]
        return sectionList.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionList = list[indexPath.section]
        let itemList = sectionList[indexPath.row]
        return CGFloat(itemList[2].floatValue())
    };
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionList = list[indexPath.section]
        let itemList = sectionList[indexPath.row]
        
        switch itemList[1].intValue() {
        case 3:
            let cell = UITableViewCellThree.cellWithTableView(tableView) as! UITableViewCellThree
            cell.labelLeft.text = itemList[0]
            cell.labelRight.text = kBlankTwo + itemList[4]
            cell.labelRight.textAlignment = .left

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
        return 10;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView();
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
    
    lazy var list: [[[String]]] = {
        var array: [[[String]]] = [[["车牌号码:", "3", "60.0", "", "cardName", "0",],
                                    
                                     ],
                                   [["授权类型:", "3", "60.0", "", "cardName", "0",],
                                    ["当前剩余:", "3", "60.0", "", "validEndTime", "0",],
                                    ["生效时间:", "3", "60.0", "", "balance", "0",],
                                    ["过期时间:", "3", "60.0", "", "recharge", "0", ],
                                    ["标        签:", "3", "60.0", "", "recharge", "0",],

                                    ],
                                   [["车主姓名:", "3", "60.0", "", "cardName", "0",],
                                    ["联系电话:", "3", "60.0", "", "validEndTime", "0",],
                                    ["车主地址:", "3", "60.0", "", "balance", "0", ],
                                    ["车位编码:", "3", "60.0", "", "recharge", "0", ],
                                    ["备        注:", "3", "60.0", "", "recharge", "0",],

                                    ],
                                   [["创建时间:", "3", "60.0", "", "cardName", "0",],
                                    ["更新时间:", "3", "60.0", "", "validEndTime", "0",],
                                    ["操作员:", "3", "60.0", "", "balance", "0",],
                                    
                                    ],
                                    ]
        return array
    }()
    
    //MARK: -Lazy Property
    lazy var footerView: BNTableFooterView = {
        var view = BNTableFooterView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 150))
        view.label.text = "更多详细信息,请登录网页端"
        view.label.textAlignment = .center
        view.btn.setTitle("充值", for: .normal)
        view.btn.addActionHandler({[weak self] (sender:UIControl) in
            let obj = sender as! UIButton
            DDLog(obj.tag)
            
            }, for: .touchUpInside)
        return view
    }()
    
}
