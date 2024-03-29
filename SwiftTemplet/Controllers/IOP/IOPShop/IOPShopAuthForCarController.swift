//
//	IOPShopAuthForCarController.swift
//	MacTemplet
//
//	Created by Bin Shang on 2021/08/11 09:06
//	Copyright © 2021 Bin Shang. All rights reserved.
//


import UIKit
import SwiftExpand

/// 详情
@objcMembers class IOPShopAuthForCarController: UIViewController {

    var model = NSObject()
    
    var recordID: String = ""

    var dataModel = NSObject()

    lazy var viewModel = NSObject()
        
    lazy var list: [[(String,String,String,String,String)]] = {
        return [
            [("车场名称：", "UITableViewCell", "40", "", "statusDes"),
//             ("审核类型：", "UITableViewCell", "35", "", "park_name"),
//             ("申请时间：", "UITableViewCell", "35", "请输入收款人", "park_name_copy"),
             ("", "IOPTableViewCellExaminePostmark", "70", "", "park_name"),
            ],
            [("车主信息", "UITableViewCellTitle", "40", "", ""),
             ("", "UITableViewCellExcel", "240", "", "receipt_address"),
            ],
        ]
    }()
    
    
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 60)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var footerView: NNSudokuView = {
        let view = NNSudokuView(frame: CGRect(0, 0, kScreenWidth, 65))
        view.backgroundColor = .white
        view.inset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        view.numOfRow = 2
        view.row = 1
        view.itemType = NNButton.self
//            cell.items.forEach { $0.setTitleColor(.systemBlue, for: .normal)}
        view.items.forEach {
            guard let sender = $0 as? NNButton else { return }
            switch sender.tag {
            case 0:
                sender.setCustomType(.titleAndOutline)
                sender.setTitle("驳回", for: .normal)
            case 1:
                sender.setCustomType(.titleWhiteAndBackgroudTheme)
                sender.setTitle("通过", for: .normal)

            default:
                sender.setCustomType(.titleAndOutline)
                sender.setTitle("button", for: .normal)
            }
            sender.addActionHandler({ sender in
                DDLog(sender.tag)

            }, for: .touchUpInside)
        }
        
        //阴影
        view.layer.addShadow(.gray.withAlphaComponent(0.5))
        return view
    }()
    
    
    @objc func handleAction(_ sender: UIButton) {
        view.endEditing(true)
//        DDLog(sender.currentTitle)
        
//        let controller = IOPInpartInvoiceReceiptController()
//        controller.dataModel = dataModel
//        navigationController?.pushViewController(controller, animated: true)
    }
    

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .groupTableViewBackground
        title = "详情"

        view.addSubview(tableView)
        view.addSubview(footerView)

//        handleRequestDetail()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        handleRequestDetail()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        footerView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
            make.height.equalTo(65)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalTo(footerView.snp.top).offset(0)
        }
    }
    
//    func handleRequestDetail() {
//        if recordID == "" {
////            DDLog(self.model.creat_time, self.model.update_time)
//            dataModel = model
//            if ["1", "2"].contains(dataModel.status) == false {
//                noticeLabel.snp.remakeConstraints { (make) in
//                    make.height.equalTo(0);
//                }
//                tableView.snp.remakeConstraints { (make) in
//                    make.height.equalTo(self.view.bounds.height);
//                }
//            }
//            tableView.reloadData()
//            requestDetail(model.topic_id)
//        } else {
//            requestDetail(recordID)
//        }
//    }
//
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


extension IOPShopAuthForCarController: UITableViewDataSource, UITableViewDelegate{
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

//        return indexPath.row == 0 ? tableView.rowHeight : 28
//        return tableView.rowHeight
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
            cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
            cell.textLabel?.textColor = .textColor6;

            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
            cell.detailTextLabel?.textColor = .theme
            
            cell.textLabel?.text = value0
            cell.detailTextLabel?.text = "-"
                        
            cell.separatorInset = indexPath.section > 0 && indexPath.row == 0 ? .zero : UIEdgeInsets(0, 0, 0, kScreenWidth)

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
            
        case "UITableViewCellExcel":
            let cell = UITableViewCellExcel.dequeueReusableCell(tableView)
            cell.isHidden = value2.cgFloatValue <= 0.0
            
            cell.excelView.visibleNumOfRow = 3
            cell.excelView.titleLabel.text = "    全天"
            cell.excelView.titleLabel.backgroundColor = UIColor.hexValue(0xF5F5F5)
            cell.excelView.titleLabel.isHidden = true
            cell.excelView.headerBackgroudColor = .white
            cell.excelView.font = UIFont.systemFont(ofSize: 13, weight: .light)
            cell.excelView.itemSizeHeight = 35
//
//            cell.excelView.headerBackgroudColor = UIColor.hexValue(0xF5F5F5, a: 1)
            
            cell.excelView.titleList = ["", "变更前", "变更后",]
            cell.excelView.dataList = [["登记类型", "组织", "个人",],
                                       ["车主/组织名称", "西安艾润物联网技术服务有限责任公司", "张三",],
                                       ["联系电话", "13912345678", "13912345678",],
                                       ["备注", "-", "2020年12月20日摇号中签",],

                                        ]
            
            cell.excelView.cellItemBlock = { label, indexP in
                if label.text == "查看" {
                    label.textColor = .theme
                }
            }
            
            cell.excelView.reloadData()
            return cell
            
        case "IOPTableViewCellExaminePostmark":
            let cell = IOPTableViewCellExaminePostmark.dequeueReusableCell(tableView)
            cell.imageView?.image = UIImage(named: "icon_examin_pass_half")
            cell.imageView?.image = UIImage(named: "icon_examin_reject")
            
            cell.labelOne.text = "审核类型："
            cell.labelOneRight.text = "新增认证"
            cell.labelTwo.text = "申请时间："
            cell.labelTwoRight.text = "2020-01-01 12:00:00"

//            cell.labelLeft.font = UIFont.systemFont(ofSize: 15, weight: .bold)
//            cell.labelLeft.textColor = .textColor3
//            cell.isHidden = value2.cgFloatValue <= 0.0
//
//            cell.btn.isHidden = true
//
//            cell.labelLeft.text = value0
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
        return 10.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UILabel()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == tableView.numberOfSections - 1 ? 10.01 : 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UILabel()
    }
}
