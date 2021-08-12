//
//  IOPInvoiceCreateController.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2020/3/3.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

/*
 因为UIButton的imageView不是正方形,旋转会变形,所以用UIImageView
 */

import UIKit
import SwiftExpand

class IOPInvoiceCreateController: UIViewController {

    var dataModel = NSObject()
    
    lazy var viewModel = NSObject()
    
//    var isValidateParams: Bool {
//        viewModel.invoiceAPI.dataModel = dataModel;
//        let isValid = viewModel.invoiceAPI.validateParamsOne()
//        return isValid
//    }
    var isMore: Bool = false

    lazy var list: [[[String]]] = {
        var array: [[[String]]] = [
            [["发票类型", "UITableViewCellTitle", "50.0", "", "",],
            ["*发票类型" + kBlankThree, "UITableViewCellTextField", "50.0", "请输入收款人", "", ],
            ],
            [["发票详情", "UITableViewCellTitle", "50.0", "", "",],
            ["*抬头类型", "UITableViewCellSegment", "50.0", "", "", "公司,个人"],
            ["*发票抬头" + kBlankThree, "UITableViewCellTextField", "50.0", "请输入公司名称", "", ],
            ["*发票内容" + kBlankThree, "UITableViewCellTextField", "50.0", "请输入开票主体名称", "", ],
            ["*发票金额" + kBlankThree, "UITableViewCellTextField", "50.0", "请输入开票主体名称", "", ],
            ["*纳税人识别号" + kBlankOne, "UITableViewCellTextField", "50.0", "请输入纳税人识别号", "", ],
            ["更多信息(选填)", "UITableViewCellTextField", "50.0", "", "", ],
            ["注册地址" + kBlankThree, "UITableViewCellTextField", "50.0", "请输入注册地址", "", ],
            ["注册电话" + kBlankThree, "UITableViewCellTextField", "50.0", "请输入注册电话(11位)", "", ],
            ["开户银行" + kBlankThree, "UITableViewCellTextField", "50.0", "请输入开户银行", "", ],
            ["银行帐号" + kBlankThree, "UITableViewCellTextField", "50.0", "请输入银行账号", "", ],
            ],
            [["*收件人" + kBlankThree, "UITableViewCellTextField", "50.0", "请输入收件人名称", "", ],
             ["*收件地址" + kBlankTwo, "UITableViewCellTextField", "50.0", "请输入收件地址", "", ],
            ["*联系方式" + kBlankTwo, "UITableViewCellTextField", "50.0", "请输入联系人手机号(11位数字)", "", ],
            ],
        ]
        return array
    }()
    
    lazy var rightBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("进件须知", for: .normal)

        view.sizeToFit()
        view.addActionHandler({ (sender) in
            
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 60)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var footerView: NNTableFooterView = {
        let view = NNTableFooterView.create("下一步", topPadding: 30);
        view.btn.addTarget(self, action: #selector(handleActionSend(_:)), for: .touchUpInside)
        return view
    }()
    
    @objc func handleActionSend(_ sender: UIButton) {
        view.endEditing(true)
        DDLog(sender.currentTitle)
        
    }
    
//    @objc lazy var imgViewMore: UIImageView = {
//        let view: UIImageView = UIImageView.create(CGRectMake(0, 0, 8, 13), imgName: "img_arrowRight_gray")
//        let image = UIImage(named: "img_arrowRight_gray", podName: "SwiftExpand")
//        view.image = image;
//        
//        return view;
//    }();
    
    // MARK: -life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "开具电子发票"
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)

        tableView.tableFooterView = footerView;
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func setupCellFold(_ cell: UITableViewCell, indexPath: IndexPath) {
        let isMoreRow = indexPath.section == 1 && indexPath.row == 6
        cell.textfield.isEnabled = !isMoreRow
        if isMoreRow {

            let imgView: UIImageView = {
                let rect = CGRectMake(0, 0, 14, 14)
                let view: UIImageView = UIImageView(rect: rect, named: "icon_arrow_right_lightGray")
                let image = UIImage(named: "img_arrowRight_gray", podName: "SwiftExpand")
                view.image = image;
                view.contentMode = .center
                return view
            }()
            cell.accessoryView = imgView
            imgView.transform = isMore == false ? CGAffineTransform.identity : imgView.transform.rotated(by: CGFloat(Double.pi/2))

        } else {
            cell.accessoryType = .none
        }
    }
}


extension IOPInvoiceCreateController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = list[section]
        let isMoreRow = section == 1
        if isMoreRow && isMore == false {
            return 7
        }
        return sections.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = list[indexPath.section]
        let itemList = sections[indexPath.row]
        let value0 = itemList[0]
        let value2 = itemList[2]
        let value3 = itemList[3]
        let value4 = itemList[4]
        
        switch itemList[1] {
        case "UITableViewCellTitle":
            let cell = UITableViewCellTitle.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            
            cell.btn.isHidden = true

            cell.labelLeft.text = value0
//            cell.getViewLayer()
            return cell
            
        case "UITableViewCellTextField":
            let cell = UITableViewCellTextField.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.hasPrefix("*")
            
            cell.textfield.rightViewMode = .never;
            cell.textfield.textAlignment = .left

            cell.labelLeft.text = value0
            cell.textfield.placeholder = value3
            cell.textfield.text = dataModel.valueText(forKeyPath: value4, defalut: "")
            cell.block { (textField) in
                self.dataModel.setValue(textField.text ?? "", forKeyPath: value4)
                DDLog("\(value4)_\(self.dataModel.value(forKeyPath: value4))")
            }

            let isMoreRow = indexPath.section == 1 && indexPath.row == 6
            cell.textfield.isEnabled = !isMoreRow
            setupCellFold(cell, indexPath: indexPath)
            
//            cell.getViewLayer()
            return cell
            
        case "UITableViewCellOne":
            let cell = UITableViewCellOne.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.hasPrefix("*")

            if indexPath.row == 0 {
                cell.labelLeft.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            }
            
            cell.labelLeft.text = value0
            cell.labelRight.text = dataModel.valueText(forKeyPath: value4, defalut: "")
//            DDLog("\(value4):\(self.valueText(forKeyPath: value4, defalut: ""))")
//            cell.getViewLayer()
            return cell
        case "UITableViewCellSegment":
            let cell = UITableViewCellSegment.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 14)
            cell.labelLeft.textColor = UIColor.textColor3
            cell.isHidden = itemList[2].cgFloatValue <= 0.0
            cell.hasAsterisk = value0.hasPrefix("*")

            cell.labelLeft.text = value0
            cell.segmentCtl.items = itemList.last!.components(separatedBy: ",")

            let index = dataModel.valueText(forKeyPath: value4, defalut: "0") == "0" ? 0 : 1
            cell.segmentCtl.selectedSegmentIndex = index
//            cell.segmentCtl.addTarget(self, action: #selector(handleActionSender(_:)), for: .valueChanged)
            cell.segmentCtl.addActionHandler({ (sender) in
//                DDLog(sender.selectedSegmentIndex)
                let value = "\(sender.selectedSegmentIndex)"
//                let value: String = sender.selectedSegmentIndex == 0 ? "0" : "1"
                self.dataModel.setValue(value, forKeyPath: value4)
                self.tableView.reloadData()
                DDLog("\(sender.selectedSegmentIndex), \(value4), \(value)")

            }, for: .valueChanged)
//            cell.getViewLayer()
            return cell
        default:
            break
        }
        let cell = UITableViewCellZero.dequeueReusableCell(tableView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UITableViewCellTextField else { return }
        let isMoreRow = indexPath.section == 1 && indexPath.row == 6
        if isMoreRow == true {
            isMore = !isMore
            tableView.reloadData()
        }

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.01;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UILabel();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UILabel();
    }
    
}
