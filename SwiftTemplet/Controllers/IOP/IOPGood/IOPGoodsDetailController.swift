//
//	IOPGoodsDetailController.swift
//	MacTemplet
//
//	Created by Shang on 2021/08/16 09:53
//	Copyright © 2021 shang. All rights reserved.
//


import UIKit
import SwiftExpand

/// 详情
@objcMembers class IOPGoodsDetailController: UIViewController {
    
    var recordID: String = ""

    var dataModel = NSObject()

    lazy var viewModel = NSObject()
        
    lazy var list: [[(String,String,String,String,String)]] = {
        return [
            [("电子发票进件", "UITableViewCell", "50.0", "", "statusDes"),
            ("进件车场", "UITableViewCell", "50.0", "", "park_name"),
            ("复用车场", "UITableViewCell", "50.0", "请输入收款人", "park_name_copy"),
            ("进件方式", "UITableViewCell", "50.0", "请输入销货方地址", "is_copyDes"),
            ("进件时间", "UITableViewCell", "50.0", "收件人联系方式", "creat_timeDes"),
            ("审核时间", "UITableViewCell", "50.0", "收件人联系方式", "update_timeDes"),
            ("驳回原因", "UITableViewCell", "50.0", "收件人联系方式", "reject_reason"),
            ],
            [("企业信息", "UITableViewCell", "50.0", "", ""),
            ("开票主体名称".padRight(1), "UITableViewCell", "50.0", "请输入开票主体名称", "invoicing_name"),
            ("纳税人识别号".padRight(1), "UITableViewCell", "50.0", "请输入纳税人识别号", "ti_number"),
            ("销货方地址".padRight(2), "UITableViewCell", "50.0", "请输入销货方地址", "seller_address"),
            ("销货方电话".padRight(2), "UITableViewCell", "50.0", "请输入销货方电话", "seller_telephone"),
            ("销货方开户行".padRight(1), "UITableViewCell", "50.0", "请输入销货方开户行", "seller_bank"),
            ("销货方银行帐号", "UITableViewCell", "50.0", "请输入销货方银行账号", "seller_bank_account"),
            ("收款人".padRight(4), "UITableViewCell", "50.0", "请输入收款人", "payee"),
            ("复核人".padRight(4), "UITableViewCell", "50.0", "输入复核人", "reviewer"),
            ("开票人".padRight(4), "UITableViewCell", "50.0", "请输入开票人", "drawer"),
            ("税率".padRight(5), "UITableViewCell", "50.0", "请输入税率", "tax_rate"),
            ("税收分类编码".padRight(1), "UITableViewCell", "50.0", "请输入税收分类编码", "tax_code"),
            ],
            [("收货信息", "UITableViewCell", "50.0", "", ""),
            ("收件人".padRight(4), "UITableViewCell", "50.0", "请输入收款人", "receipter"),
            ("收件地址".padRight(3), "UITableViewCell", "50.0", "请输入销货方地址", "receipt_address"),
            ("收件人联系方式", "UITableViewCell", "50.0", "收件人联系方式", "receipt_phone"),
            ],
        ]
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 60)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var footerView: NNTableFooterView = {
        let view = NNTableFooterView.create("下一步", topPadding: 30);
        view.btn.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
        return view
    }()
    
    @objc func handleAction(_ sender: UIButton) {
        view.endEditing(true)
//        DDLog(sender.currentTitle)
        
//        let controller = IOPInpartInvoiceReceiptController()
//        controller.dataModel = dataModel
//        self.navigationController?.pushViewController(controller, animated: true)
    }

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = "详情"
        navigationItem.rightBarButtonItems = ["Next"].map({
            return UIBarButtonItem(obj: $0) { item in
                DDLog(item.title)
            }
        })

        
//        tableView.tableFooterView = footerView;
        view.addSubview(tableView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        requestDetail(recordID)
    }
    
//    func requestDetail(_ ID: String?) {
//        viewModel.detailAPI.order_id = ID ?? ""
//        viewModel.requestDetail { (model) in
////            DDLog(model.title)
//            self.dataModel = model.labels
//            self.dataModel.status = self.model.status
//            self.dataModel.reject_reason = self.model.reject_reason ?? ""
//            self.dataModel.creat_time = self.model.creat_time
//            self.dataModel.update_time = self.model.update_time
//            self.tableView.reloadData()
//        }
//    }
}


extension IOPGoodsDetailController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = list[section]
        return sections.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sections = list[indexPath.section]
        let tuple = sections[indexPath.row]
        return tuple.2.cgFloatValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = list[indexPath.section]
        let tuple = sections[indexPath.row]
        let value0 = tuple.0
        let value1 = tuple.1
        let value2 = tuple.2
        let value3 = tuple.3
        let value4 = tuple.4
        
        switch value1 {
        case "UITableViewCell":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellValue1", style: .value1)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.textLabel?.textColor = .textColor6;

            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.detailTextLabel?.textColor = .theme
            
            cell.textLabel?.text = value0
            cell.detailTextLabel?.text = "上传"
                        
            let result: String = dataModel.valueText(forKeyPath: value4, defalut: "-")
            if result.contains("http") {
                cell.detailTextLabel?.text = kTitleLook
                cell.detailTextLabel?.textColor = UIColor.theme
                cell.accessoryType = .disclosureIndicator;

            } else {
                cell.detailTextLabel?.text = result
                cell.detailTextLabel?.textColor = .textColor3
                cell.accessoryType = .none;
            }
            
            if indexPath.row == 0 {
                cell.textLabel?.textColor = .textColor3;
                cell.detailTextLabel?.text = result
//                cell.detailTextLabel?.textColor = dataModel.statusDesColor
            } else {
                cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
                cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
            }
            cell.separatorInset = indexPath.row == 0 ? .zero : UIEdgeInsets(0, 0, 0, kScreenWidth);

//            cell.getViewLayer()
            return cell;
            
        case "UITableViewCellTitle":
            let cell = UITableViewCellTitle.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            cell.labelLeft.textColor = .textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            
            cell.btn.isHidden = true

            cell.labelLeft.text = value0
//            cell.getViewLayer()
            return cell
            
        default:
            break
        }
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.01;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UILabel();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == tableView.numberOfSections - 1 ? 10.01 : 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UILabel();
    }
}
