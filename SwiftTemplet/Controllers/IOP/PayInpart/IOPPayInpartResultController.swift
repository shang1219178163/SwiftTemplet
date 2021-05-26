//
//	IOPPayInpartResultController.swift
//	MacTemplet
//
//	Created by shang on 2020/12/16 17:25
//	Copyright © 2020 shang. All rights reserved.
//可尝试复用 IOPOrderResultController
 

import UIKit
import SwiftExpand

///
@objcMembers class IOPPayInpartResultController: UIViewController{
        
    
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 50)
        view.dataSource = self
        view.delegate = self

        return view
    }()
        
    lazy var processingView: NNProcessingView = {
        var view = NNProcessingView(frame: CGRectMake(0, 0, self.view.bounds.width, 70))
        
        view.items = ["基础信息", "企业信息", "完成"]
        view.contentInset = UIEdgeInsetsMake(0, 20, 0, 20)
        view.padding = 90
        view.index = 2
        
//        view.getViewLayer()
        return view;
    }()
    
    lazy var footerView: NNTableFooterView = {
        let view = NNTableFooterView.create("进件详情", topPadding: 20);
//        view.label.isHidden = true
//        view.labelTop.isHidden = true
        view.backgroundColor = .clear
        view.btn.addActionHandler { (control) in
            DDLog(control)
        }
        return view
    }()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        title = ""
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

        view.addSubview(tableView)
        tableView.tableHeaderView = processingView;
        tableView.tableFooterView = footerView;
    }

}
        
extension IOPPayInpartResultController: UITableViewDataSource, UITableViewDelegate{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
//        cell.textLabel?.text = "--"
        cell.textLabel?.textColor = .textColor3;

        let inset = UIEdgeInsets(top: 10, left: 150, bottom: 50, right: 150)
        cell.contentView.createSubTypeView(NNButton.self, tag: 100, inset: inset) { (sender) in
            sender.direction = .top
            sender.setTitle("提交成功", for: .normal)
            sender.setTitleColor(.textColor3, for: .normal)
            sender.setImage(UIImage(named: "icon_selected_yes_circle_big"), for: .normal)
            sender.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top)
                make.left.equalToSuperview().offset(inset.left)
                make.right.equalToSuperview().offset(-inset.right)
                make.bottom.equalToSuperview().offset(-inset.bottom)
            }
        }
//        cell.getViewLayer()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let model = dataList[indexPath.row] as? IOPParkModel else { return }
//        let controller = IOPParkDetailController()
//        controller.parkModel = model
//        navigationController?.pushViewController(controller, animated: true)
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

