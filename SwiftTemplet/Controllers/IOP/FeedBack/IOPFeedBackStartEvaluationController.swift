//
//	IOPFeedBackStartEvaluationController.swift
//	MacTemplet
//
//	Created by Shang on 2021/08/19 17:32
//	Copyright © 2021 shang. All rights reserved.
//


import UIKit
import SwiftExpand

/// 用户反馈星际评价
@objcMembers class IOPFeedBackStartEvaluationController: UIViewController{
    
    lazy var tableView: UITableView = {
        let view = UITableView.create(self.view.bounds, style: .plain, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var footerView: NNTableFooterView = {
        let view = NNTableFooterView.create("提交反馈", topPadding: 15);
        view.btn.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
        view.backgroundColor = .groupTableViewBackground
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
            [("满意度评价:", "UITableViewCellStarEvaluate", "40", "", "contact_phone"),
             ("*问题描述", "UITableViewCellTextView", "150.0", "请您给我们的客服一些鼓励吧(选填)", "equipment_receiver"),
            ],
        ]
    }()
    
    var dataModel = NSObject()
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - funtions
    func setupUI() {
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = ""
        navigationItem.rightBarButtonItems = ["Next"].map({
            return UIBarButtonItem(obj: $0) { item in
                DDLog(item.title)
//            let vc = UIViewController()
//            self.navigationController?.pushViewController(vc, animated: true)
            }
        })
        
        tableView.tableFooterView = footerView
        view.addSubview(tableView)
    }

}
        
extension IOPFeedBackStartEvaluationController: UITableViewDataSource, UITableViewDelegate{
    
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
        return UILabel()
    }
}

