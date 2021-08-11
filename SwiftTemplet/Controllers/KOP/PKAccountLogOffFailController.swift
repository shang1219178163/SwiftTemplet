//
//	PKAccountLogOffFailController.swift
//	MacTemplet
//
//	Created by shang on 2020/11/17 14:38
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand

///
@objcMembers class PKAccountLogOffFailController: UIViewController{
        

    lazy var rightBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("Next", for: .normal)

        view.addActionHandler({ (sender) in
            let controller = TmpViewController()
            self.navigationController?.pushViewController(controller, animated: true)
            
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var headerView: NNTableFooterView = {
        let view = NNTableFooterView.create("退出当前账号", topPadding: 30)
        view.backgroundColor = .clear
        view.labelTop.textColor = .black
        view.labelTop.textAlignment = .center
        view.labelTop.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        view.label.font = UIFont.systemFont(ofSize: 11)
        view.label.textAlignment = .center

//        view.btn.setBackgroundColor(.systemRed, for: .normal)
        view.btn.setTitle("", for: .normal)
        view.btn.setBackgroundImage(UIImage(named: "img_fail"), for: .normal)
        view.btn.backgroundColor = .clear

//        view.btn.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
        view.labelTop.text = "抱歉，由于以下原因账号无法注销"
        view.label.text = "如对以上内容有疑问，请联系客服 4009"
        view.layoutBlock = { sender in
            sender.btn.snp.remakeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().offset(25)
                make.width.height.equalTo(50)
            }
            
            sender.labelTop.snp.remakeConstraints { (make) in
                make.top.equalTo(sender.btn.snp.bottom).offset(5)
                make.left.equalToSuperview().offset(10)
                make.right.equalToSuperview().offset(-10)
                make.height.equalTo(20)
            }
            
            sender.label.snp.remakeConstraints { (make) in
                make.top.equalTo(sender.labelTop.snp.bottom).offset(5)
                make.left.right.equalTo(sender.labelTop)
                make.height.equalTo(20)
            }
        }
        
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 65)
        view.dataSource = self
        view.delegate = self

        return view
    }()
        
    lazy var contentView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        
        view.addSubview(headerView)
        view.addSubview(lineDashView)
        view.addSubview(tableView)
        return view
    }()
    
    lazy var lineDashView: NNLineDashView = {
        let view = NNLineDashView(frame: .zero);
//        let view = NNLineDashView(frame: CGRectMake(0, 0, kScreenWidth, 5));

        view.style = .line
        return view;
    }()
            
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        title = "注销账号"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)

        navigationItem.leftBarButtonItem?.addAction({ (item) in
//            self.navigationController?.popToRootViewController(animated: true)
            self.navigationController?.popToVC(PKAccountLogOffOneController.self, animated: true)
        })
        setupUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        contentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
//            make.height.equalTo(320);
        }
        
        lineDashView.snp.makeConstraints { (make) in
            make.centerY.equalTo(160);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(5);
        }
        
        headerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.bottom.equalTo(lineDashView.snp.top).offset(-15)
        }
        
        let rowCount = tableView.numberOfRows(inSection: 0)
        let height: CGFloat = tableView.rowHeight*min(CGFloat(rowCount), 7.0)
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(lineDashView.snp.bottom).offset(10);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.bottom.equalToSuperview().offset(-15);
            make.height.equalTo(height);
        }
        
        //阴影
        contentView.layer.shadowColor = UIColor.hexValue(0x000000, a: 0.12).cgColor
        contentView.layer.shadowColor = UIColor.hexValue(0x000000, a: 0.12).cgColor
        contentView.layer.shadowRadius = 3.5
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        tableView.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
        

    
    // MARK: - funtions
    func setupUI() {
        edgesForExtendedLayout = []
        view.backgroundColor = UIColor.hexValue(0xF6F5F8, a: 1)

//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        
        view.addSubview(contentView)

//        view.getViewLayer()
    }

}
        
extension PKAccountLogOffFailController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 13
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellSubtitle", style: .subtitle)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.text = "--"
        cell.textLabel?.textColor = .textColor3;

        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.text = "--"
        cell.detailTextLabel?.textColor = .textColor6;
        cell.accessoryType = .disclosureIndicator;
        
        let color = UIColor.hexValue(0xF6F5F8, a: 0.1)
        cell.backgroundColor = color
        
        cell.textLabel?.text = "您仍有未使用的艾豆"
        cell.detailTextLabel?.text = "注销账号前请将剩余艾豆全部使用或联系客服"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let model = dataList[indexPath.row] as? IOPParkModel else { return }
//        let controller = IOPParkDetailController()
//        controller.parkModel = model
//        navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01;
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

