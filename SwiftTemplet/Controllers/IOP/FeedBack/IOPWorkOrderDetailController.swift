//
//  IOPWorkOrderDetailController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/19.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 用户反馈详情
class IOPWorkOrderDetailController: UIViewController {

    lazy var tableView: UITableView = {
        let view = UITableView(frame: self.view.bounds, style: .plain)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.separatorStyle = .singleLine
        view.separatorInset = .zero
        view.rowHeight = 50
//        view.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        view.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: self))
        view.keyboardDismissMode = .onDrag
        view.backgroundColor = .groupTableViewBackground
        
        
        view.rowHeight = UITableView.automaticDimension;
       // 2.设置一个估计的行高，只要大于0就可以了，但是还是尽量要跟cell的高差不多
        view.estimatedRowHeight = 100;
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    
    lazy var footerView: NNTableFooterView = {
        let view = NNTableFooterView.create("提交反馈", topPadding: 15);
        view.btn.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
        return view
    }()
    
    @objc func handleAction(_ sender: UIButton) {
        view.endEditing(true)
//        DDLog(sender.currentTitle)
//        if isValidateParams == false {
//            return
//        }
//        requestAdd()
    }
    
    lazy var list: [[(String,String,String,String,String)]] = {
        return [
            [("*问题标题" + kBlankOne, "IOPTableViewCellIssueMark", "40", "请输入", "contact_phone"),
            ("*车场名称" + kBlankOne, "UITableViewCellValu1", "40", "请选择", "etc_protocol_link"),
            ("*发生时间" + kBlankOne, "UITableViewCellValu1", "40", "请输入", "etc_project_report"),
            ("*联系人" + kBlankOne*2, "UITableViewCellValu1", "40", "请输入", "etc_key_request_form"),
            ("*联系电话" + kBlankOne, "UITableViewCellValu1", "40", "请输入", "etc_key_request_form"),
            ("车牌号码" + kBlankOne + kBlankQtr, "UITableViewCellValu1", "40", "请输入", "etc_key_request_form"),
            ],
            
            [("*问题描述" + kBlankOne, "UITableViewCellSubtitle", "", "请输入名称", "equipment_receiver"),
            ],
            
            [
             ("*图片", "UITableViewCellReplay", "", "", "equipment_receiver"),
            ],
            
            [
            ("*视频", "UITableViewCellReplay", "", "", "contact_phone"),
            ],
                           
            [("附件", "UITableViewCellDesc", "50.0", "0/2", ""),
             ("附件1", "UITableViewCellValu1", "40", "上传,点击查看", "etc_1"),
            ("附件2", "UITableViewCellValu1", "40", "上传,点击查看", "etc_2"),
            ],
            
            [("提交信息", "UITableViewCellDesc", "40", "", "contact_phone"),
            ("提交时间:", "UITableViewCellValu1", "40", "", "etc_protocol_link"),
            ("提交人:", "UITableViewCellValu1", "40", "", "etc_project_report"),
            ],
            
            [("进度详情", "UITableViewCellDesc", "40", "", "contact_phone"),
            ("*问题标题", "UITableViewCellReplay", "", "请输入", "contact_phone"),
            ("*车场名称", "UITableViewCellReplay", "", "请选择", "etc_protocol_link"),
            ("*发生时间", "UITableViewCellReplay", "", "请输入", "etc_project_report"),
            ],
            
            [("我的评价", "UITableViewCellValue1", "40", "", "contact_phone"),
            ("*问题标题", "UITableViewCellStarEvaluate", "40", "", "contact_phone"),
            ("评价内容", "UITableViewCell", "", "请选择", "etc_protocol_link"),
            ],
        ]
    }()
    
    var dataModel = NSObject()

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.addSubview(tableView)
        tableView.tableFooterView = footerView
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }

}


extension IOPWorkOrderDetailController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = list[section]
        return sections.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionList = list[indexPath.section]
        let tuple = sectionList[indexPath.row]
        if tuple.2 == "" {
            return UITableView.automaticDimension
        }
        let height = tuple.2.cgFloatValue
        return height
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
            let cell = tableView.dequeueReusableCell(for: UITableViewCell.self)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            cell.textLabel?.textColor = .textColor3;
            cell.textLabel?.numberOfLines = 0

            cell.textLabel?.text = "艾润客服太专业了，点赞，很详细的解释了问题所在，希 望后面还有机会。艾润客服太专业了，点赞，很详细的解释了问题所在，希 望后面还有机会。"
            
            cell.separatorHidden()

//            cell.getViewLayer()
            return cell
        case "IOPTableViewCellIssueMark":
            let cell = tableView.dequeueReusableCell(for: IOPTableViewCellIssueMark.self)

            cell.markStatue = "1"
            cell.hasAsterisk = false
            
            cell.separatorHidden()

            return cell
            
        case "UITableViewCellValu1":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellValu1", style: .value1)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.textLabel?.textColor = UIColor.textColor3;

            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.detailTextLabel?.textColor = UIColor.theme
//            cell.accessoryType = .disclosureIndicator
            
            cell.textLabel?.text = value0
            cell.detailTextLabel?.text = dataModel.valueText(forKeyPath: value4, defalut: "_")

            cell.textLabel?.highlightedTextColor = UIColor.red
            cell.textLabel?.isHighlighted = false
            
            cell.separatorHidden()
            return cell
            
            
        case "UITableViewCellSubtitle":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellSubtitle", style: .subtitle)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            cell.textLabel?.textColor = .textColor9

            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14)
            cell.detailTextLabel?.textColor = .textColor3
            cell.detailTextLabel?.numberOfLines = 0

//            cell.accessoryType = .disclosureIndicator
            
            cell.textLabel?.text = value0
//            cell.detailTextLabel?.text = dataModel.valueText(forKeyPath: value4, defalut: "_")
            cell.detailTextLabel?.text = "这是一个问题描述这是一个问题描述这是一个问题描 述这是一个问题描述这是一个问题描述这是一个问题 描述这是一个问题描述这是一个问题描述这是一个问题描述"

            cell.textLabel?.highlightedTextColor = .red
            cell.textLabel?.isHighlighted = false
            
            cell.separatorHidden()

            return cell
            
        case "UITableViewCellDesc":
            let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellDesc", style: .value1)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            cell.textLabel?.textColor = .textColor3;

            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 15)
//            cell.detailTextLabel?.textColor = .theme
//            cell.accessoryType = .disclosureIndicator
            
            cell.textLabel?.text = value0
            cell.detailTextLabel?.text = value3
                        
//            let titles: [String] = value0.components(separatedBy: "(")
//            cell.textLabel?.attributedText = titles.first?.matt + "(\(titles.last?)".matt

            let titles: [String] = value0.components(separatedBy: "(")
            if titles.count > 1  {
                cell.textLabel?.attributedText = titles.first!.matt + "(\(titles.last!)".matt.foregroundColorChain(.textColor9)
            }
//            let attributedText = updateAttachmentTitleLabel()
//            cell.detailTextLabel?.attributedText = attributedText

            let hasAsterisk = value0.contains("*")
            if hasAsterisk {
                cell.textLabel?.attributedText = cell.textLabel!.text!.matt.appendPrefix(font: cell.textLabel!.font)
            }

//            if [2, 3, 4].contains(indexPath.section) {
//                cell.separatorInsetHidden()
//            }
//            cell.getViewLayer()
            return cell

        case "UITableViewCellReplay":
            let cell = tableView.dequeueReusableCell(for: UITableViewCellReplay.self)
            switch indexPath.section {
            case 2:
 
                cell.contentlabel.isHidden = true

                cell.groupView.items = [UIButton].init(count: 6, generator: { (i) -> UIButton in
                    let sender = NNButton(type: .custom)
                    sender.setTitle("item_\(i)", for: .normal)
                    sender.setTitleColor(.black, for: .normal)
                    sender.setTitleColor(.black, for: .selected)
                    sender.setBorderColor(.line, for: .normal)

                    sender.spacing = 0
                    sender.addActionHandler { sender in
                        DDLog(sender.tag)
                    }
                    return sender
                })
            case 3:
   
                cell.contentlabel.isHidden = true

                cell.groupView.items = [UIButton].init(count: 6, generator: { (i) -> UIButton in
                    let sender = NNButton(type: .custom)
                    sender.setTitle("item_\(i)", for: .normal)
                    sender.setTitleColor(.black, for: .normal)
                    sender.setTitleColor(.black, for: .selected)
                    sender.setBorderColor(.line, for: .normal)

                    sender.spacing = 0
                    sender.addActionHandler { sender in
                        DDLog(sender.tag)
                    }
                    return sender
                })
            default:

                cell.contentlabel.isHidden = false
                
                cell.groupView.items = [UIButton].init(count: 6, generator: { (i) -> UIButton in
                    let sender = NNButton(type: .custom)
                    sender.setTitle("item_\(i)", for: .normal)
                    sender.setTitleColor(.black, for: .normal)
                    sender.setTitleColor(.black, for: .selected)
                    sender.setBorderColor(.line, for: .normal)

                    sender.spacing = 0
                    sender.addActionHandler { sender in
                        DDLog(sender.tag)
                    }
                    return sender
                })
            }

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
            
        default:
            break
        }
        let cell = UITableViewCellZero.dequeueReusableCell(tableView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sections = list[indexPath.section]
//        let tuple = sections[indexPath.row]
//        if tuple.4.contains("_img") {
////            jumpUploadPicture(tuple)
//        } else if tuple.4.contains("etc_") {
//            jumpFileAction(tuple)
//
//        } else if tuple.0.contains("附件") {
//            jumpFileAction(tuple)
////            self.docPickVC.setupContentInsetAdjustmentBehavior(true)
////            self.docPickVC.present(true, style: .fullScreen)
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return [3, 4].contains(section) ? 1 : 10.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UILabel()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == tableView.numberOfSections - 1 ? 10.01 : 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UILabel()
    }
}
