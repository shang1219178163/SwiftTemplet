//
//  NNIssueReplayController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/19.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand


class NNIssueReplayController: UIViewController {

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
    
    
    lazy var list: [[(String,String,String,String,String)]] = {
        return [
            [("*问题标题" + kBlankOne, "UITableViewCellReplay", "", "请输入", "contact_phone"),
            ("*车场名称" + kBlankOne, "UITableViewCellReplay", "", "请选择", "etc_protocol_link"),
            ("*发生时间" + kBlankOne, "UITableViewCellReplay", "", "请输入", "etc_project_report"),
            ],
        ]
    }()
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.addSubview(tableView)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }

}


extension NNIssueReplayController: UITableViewDataSource, UITableViewDelegate{
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
        case "UITableViewCellReplay":
//            let cell = UITableViewCellChoose.dequeueReusableCell(tableView);
            let cell = tableView.dequeueReusableCell(for: UITableViewCellReplay.self)
   
            switch indexPath.row {
            case 0:
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
            case 1:
                cell.groupView.items = [UIButton].init(count: 4, generator: { (i) -> UIButton in
                    let sender = NNButton(type: .custom)
                    sender.setTitle("item_\(i)", for: .normal)
                    sender.setTitleColor(.black, for: .normal)
                    sender.setTitleColor(.black, for: .selected)
                    sender.setBorderColor(.line, for: .normal)

                    sender.addActionHandler { sender in
                        DDLog(sender.tag)
                    }
                    return sender
                })
            default:
                break
            }

            return cell;
        default:
            break
        }
        let cell = UITableViewCell.dequeueReusableCell(tableView)
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
