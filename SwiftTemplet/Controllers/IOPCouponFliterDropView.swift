//
//	IOPCouponFliterDropView.swift
//	MacTemplet
//
//	Created by shang on 2020/05/13 14:11
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit

import SnapKit
import SwiftExpand


@objcMembers class NNSectionDataModel: NSObject {
    var title = ""
    var items: [String] = []
    var itemIndex = 0
    var cellHeight: CGFloat = 60
}
        
///
@objc protocol IOPCouponFliterDropViewDelegate{
    @objc func couponFliterDropView(_ view: IOPCouponFliterDropView, btn: UIButton);
    
}

@objcMembers class IOPCouponFliterDropView: UIView {
    
    weak var delegate: IOPCouponFliterDropViewDelegate?
    
    /// 当前数据源
    lazy var list: [NNSectionDataModel] = []
    
    // MARK: - 视图展示必传属性
    weak var parController: UIViewController?
    var sender: UIView?{
        willSet{
            guard let newValue = newValue, let parController = parController else { return }
            let rect = parController.view.convert(newValue.frame, to: parController.view)
            self.containView.originY = rect.maxY;
        }
    }
    // MARK: - lifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        _ = addGestureTap(self, action: #selector(dismiss))
    }
    
    convenience init(frame: CGRect, parController: UIViewController!) {
        self.init(frame: frame)
        self.parController = parController
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        self.parController!.view.sendSubviewToBack(self)
    }
    
    // MARK: - show
    func show() {
        self.parController!.view.insertSubview(self.containView, at: 1)//必须保持在表视图之上
//        DDLog(self.parController!.view.subviews);
        self.tableView.transform = self.tableView.transform.translatedBy(x: 0, y: -self.tableView.sizeHeight)

        self.containView.alpha = 0.0
        UIView.animate(withDuration: kDurationShow, animations: {
            self.containView.alpha = 1.0
            self.tableView.transform = .identity
            self.parController!.view.bringSubviewToFront(self.containView)

        }) { (finished) in
            if finished {
            }
        }
    }
    ///  释放视图
    func dismiss() {
        UIView.animate(withDuration: kDurationShow, animations: {
            self.containView.alpha = 0.0
            self.tableView.transform = self.tableView.transform.translatedBy(x: 0, y: -self.tableView.sizeHeight)

        }, completion:{ ( finished: Bool) in
            if finished {
                self.removeFromSuperview()
            }
        })
    }
    
    /// 重置筛选框
    func setupDefaultCellFliter() {

        
    }
    /// 重置时长框
    func setupDefaultCellTimeDuration() {

    }
    
    //MARK: -lazy
    lazy var containView: UIView = {
        var view = UIView(frame: parController!.view.bounds)
//        var view = UIView(frame: CGRectMake(0, 50, parController!.view.bounds.width, parController!.view.bounds.height))
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3);

        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height*0.5)
        view.addSubview(tableView)
        
        return view
    }()
    
    lazy var tableView: UITableView = {
        var table = UITableView.create(bounds, style: .grouped, rowHeight: kH_CellHeight)
        table.dataSource = self
        table.delegate = self
        table.tableFooterView = self.footerView;
        table.separatorStyle = .none;
        table.backgroundColor = UIColor.clear;
        return table
    }()
    
    lazy var footerView: UIView = {
        let view = UIButton.createGroupView(CGRectMake(0, 0, kScreenWidth, 50), list: [kTitleDefault, kTitleSure], numberOfRow: 2, padding: 0) { (control) in
            guard let sender = control as? UIButton else { return }
//            DDLog(sender.currentTitle)
            self.delegate?.couponFliterDropView(self, btn: sender)
            if sender.currentTitle == kTitleDefault {
                self.setupDefaultCellFliter()
                self.setupDefaultCellTimeDuration()
            } else {
                self.dismiss();
            }
        }
        
        if let btnDefault = view.viewWithTag(0) as? UIButton {
            btnDefault.setTitleColor(.textColor3, for: .normal)
        }
        
        if let btnSure = view.viewWithTag(1) as? UIButton {
            btnSure.setTitleColor(.white, for: .normal)
            btnSure.setBackgroundImage(UIImage(color: .theme), for: .normal)
        }
        return view
    }()

}

extension IOPCouponFliterDropView: UITableViewDataSource, UITableViewDelegate {

    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let sectionModel = list[indexPath.section] as NNSectionDataModel? else { return tableView.rowHeight }
        return sectionModel.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionModel = list[indexPath.section] as NNSectionDataModel? else { return UITableViewCell.dequeueReusableCell(tableView) }

        let cell = IOPTableViewCellGroupView.dequeueReusableCell(tableView);
        cell.parkGroupView.items = sectionModel.items
        cell.parkGroupView.selectedIdxList = [0]
        cell.parkGroupView.hideImage = true
        
        cell.parkGroupView.block { (groupView, control) in
            guard let sender = control as? UIButton else { return }
            DDLog(sender.currentTitle)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sectionModel = list[indexPath.section] as NNSectionDataModel? else { return }
//        btn.setTitle(sectionModel.title, for: .normal)
//        dismiss()
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionModel = list[section] as NNSectionDataModel? else { return UIView() }

        let label = UILabel(frame: .zero);
        label.font = UIFont.systemFont(ofSize: 14)
        label.backgroundColor = .white;
        label.textColor = UIColor.gray
        label.text = "    \(sectionModel.title)"
        return label;
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
}
