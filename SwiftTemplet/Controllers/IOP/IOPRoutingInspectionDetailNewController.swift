//
//    IOPRoutingInspectionDetailNewController.swift
//    MacTemplet
//
//    Created by Shang on 2021/08/16 18:03
//    Copyright © 2021 shang. All rights reserved.
//


import UIKit
import SwiftExpand

/// 详情
@objcMembers class IOPRoutingInspectionDetailNewController: UIViewController {
    
    var recordID: String = ""

    var dataModel = NSObject()

    lazy var viewModel = NSObject()
        
    lazy var list: [[CellModel]] = {
        return [
            [CellModel("识别仪", "UITableViewCellDoubleLabel", "180", "", "statusDes"),
             CellModel("道闸", "UITableViewCellDoubleLabel", "180", "", "park_name"),
             CellModel("收费显示屏", "UITableViewCellDoubleLabel", "180", "请输入收款人", "park_name_copy"),
            ],
            
            [CellModel("满意度评价:", "UITableViewCellStarEvaluate", "40", "", "contact_phone"),
             CellModel("*问题描述", "UITableViewCellTextView", "150.0", "请您给我们的客服一些鼓励吧(选填)", "equipment_receiver"),
            ],
        ]
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    
    lazy var footerView: NNTableFooterView = {
        let view = NNTableFooterView.create("评价", topPadding: 30);
        view.btn.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
        return view
    }()
    
    @objc func handleAction(_ sender: UIButton) {
        view.endEditing(true)
//        DDLog(sender.currentTitle)
        
//        let vc = IOPInpartInvoiceReceiptController()
//        vc.dataModel = dataModel
//        self.navigationController?.pushViewController(vc, animated: true)
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

        tableView.tableFooterView = footerView;
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


extension IOPRoutingInspectionDetailNewController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = list[section]
        return sections.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sections = list[indexPath.section]
        let tuple = sections[indexPath.row]
        if tuple.t2 == "" {
            return UITableView.automaticDimension
        }
        return tuple.t2.cgFloatValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = list[indexPath.section]
        let tuple = sections[indexPath.row]
        let value0 = tuple.t0
        let value1 = tuple.t1
        let value2 = tuple.t2
        let value3 = tuple.t3
        let value4 = tuple.t4
        
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
            cell.separatorInset = indexPath.row == 0 ? .zero : UIEdgeInsetsMake(0, 0, 0, kScreenWidth);

//            cell.getViewLayer()
            return cell;
            
        case "UITableViewCellDoubleLabel":
            let cell = tableView.dequeueReusableCell(for: UITableViewCellDoubleLabel.self)
            cell.labView.labelLeft.font = UIFont.systemFont(ofSize: 15, weight: .bold)

            cell.labView.labelLeft.text = "识别仪"
            cell.labView1.labelLeft.attributedText = "识别仪本体工作情况 ".matt + "查看现场图片".matt.foregroundColorChain(.theme)
            cell.labView2.labelLeft.text = "补光灯工作情况"
            cell.labView3.labelLeft.text = "起落杆情况"
            cell.labView4.labelLeft.text = "防砸情况"

            let str1: AttrString = """
              \(image: UIImage(named: "icon_routingInspection_normal")!, scale: 1.0) 正常
              """
            let str2: AttrString = """
              \(image: UIImage(named: "icon_routingInspection_abnormal")!, scale: 1.0) 故障
              """
            let str3: AttrString = """
              \(image: UIImage(named: "icon_routingInspection_hiddenTrouble")!, scale: 1.0) 故障
              """
            let str4: AttrString = """
              \(image: UIImage(named: "icon_routingInspection_ignore")!, scale: 1.0) 不涉及
              """
            cell.labView1.labelRight.attributedText = str1.attributedString
            cell.labView2.labelRight.attributedText = str2.attributedString
            cell.labView3.labelRight.attributedText = str3.attributedString
            cell.labView4.labelRight.attributedText = str4.attributedString
            
            cell.labView1.labelLeft.addGestureTap { reco in
                DDLog(reco.view)
            }

//            cell.getViewLayer()
            return cell
            
        case "UITableViewCellStarEvaluate":
            let cell = tableView.dequeueReusableCell(for: UITableViewCellStarEvaluate.self)
            
            cell.labelLeft.text = value0
            cell.labelLeft.isHidden = true

//            cell.starView.isUserInteractionEnabled = false
//            cell.starView.successBlock = {
//                DDLog($0, $1, $2)
//            }
            cell.starView.block = {
                DDLog($0.currentStarCount, $1)
            }

            cell.separatorHidden()
//            cell.getViewLayer()
            return cell
            
        case "UITableViewCellTextView":
            let cell = UITableViewCellTextView.dequeueReusableCell(tableView)
            cell.labelLeft.font = UIFont.systemFont(ofSize: 15)
            cell.labelLeft.textColor = .textColor3
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.hasAsterisk = value0.contains("*")
            
            cell.type = .bottom
            cell.labelLeft.isHidden = true
            cell.wordCount = 200
            cell.labelLeft.text = value0
            cell.textView.placeHolderLabel.text = "请您给我们的客服一些鼓励吧(选填)"

            cell.block { ( view, text) in
                DDLog(text)
            }
            
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
