//
//	NNDateRangeVerticalView.swift
//	MacTemplet
//
//	Created by shang on 2020/09/22 12:16
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol NNDateRangeVerticalViewDelegate{
    @objc func dateRangeView(_ view: NNDateRangeVerticalView)
    
}
        
///时间区段选择器(垂直)
@objcMembers class NNDateRangeVerticalView: UIView {

    weak var delegate: NNDateRangeVerticalViewDelegate?

    var block: ((NNDateRangeVerticalView) -> Void)?

    var inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    lazy var datePicker: NNDatePicker = {
        var view = NNDatePicker(model: .date);
//        view.block({ (sender, idx) in
//            DDLog(view,sender.datePicker.date,idx);
//            self.viewBlock?(self);
//
//        })
        return view;
    }()
    
    
    var isEmptyDate: Bool = false{
        willSet{
            tableView.reloadData()
        }
    }
    
    var rangeDay: Int = 30
    
    var isLockRangeDay = false

    var endDate: Date = Date(){
        willSet{
//            endTime = DateFormatter.stringFromDate(newValue)
            endTime = DateFormatter.dateFromPicker(datePicker.datePicker, date: newValue)
            tableView.reloadData()
        }
    }
    var beginDate: Date = Date(){
        willSet{
//            beginTime = DateFormatter.stringFromDate(newValue)
            beginTime = DateFormatter.dateFromPicker(datePicker.datePicker, date: newValue)
            tableView.reloadData()
        }
    }
    ///时间区间是否在未来
    var isFuture: Bool = false{
        willSet{
            let now: Date = Date()
            beginDate = newValue == false ? now.adding(-self.rangeDay) : now
            endDate = newValue == false ? now : now.adding(self.rangeDay)
        }
    }
    
    private(set) lazy var endTime: String = DateFormatter.stringFromDate(endDate)
    private(set) lazy var beginTime: String = DateFormatter.stringFromDate(beginDate)
    
    
    //MARK: -lazy
    lazy var tableView: UITableView = {
        let view: UITableView = UITableView.create(self.bounds, style: .plain, rowHeight: 50)
        view.dataSource = self
        view.delegate = self
        
        view.isScrollEnabled = false

        return view
    }()
    
    private lazy var topLineView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .line
        return view
    }()
    
    private lazy var bomLineView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .line
        return view
    }()
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(topLineView)
        addSubview(bomLineView)
        addSubview(tableView)

        endTime = DateFormatter.dateFromPicker(datePicker.datePicker, date: endDate)
        beginTime = DateFormatter.dateFromPicker(datePicker.datePicker, date: beginDate)

//        topLineView.backgroundColor = .systemRed
//        bomLineView.backgroundColor = .systemRed

        DDLog(beginTime, endTime)
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10.0 {
            return;
        }
        
        let topY = (topLineView.isHidden == false ? 0.5 : 0) + inset.left
        let bomY = (bomLineView.isHidden == false ? 0.8 : 0) + inset.bottom
             
        if topLineView.isHidden == false {
            topLineView.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(inset.top);
                make.left.equalToSuperview().offset(inset.left);
                make.right.equalToSuperview().offset(-inset.right);
                make.height.equalTo(0.5);
            }
        }

        if bomLineView.isHidden == false {
            bomLineView.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(inset.left);
                make.right.equalToSuperview().offset(-inset.right);
                make.bottom.equalToSuperview().offset(-inset.bottom);
                make.height.equalTo(0.8);
            }
        }
        
        tableView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(topY);
            make.left.equalToSuperview().offset(inset.left);
            make.right.equalToSuperview().offset(-inset.right);
            make.bottom.equalToSuperview().offset(-bomY);
        }
    }
    
    // MARK: - funtions

}

extension NNDateRangeVerticalView: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return tableView.rowHeight
        return (bounds.size.height - inset.top - inset.bottom)*0.5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellValue1", style: .value1)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.textLabel?.textColor = UIColor.hexValue(0x343434);

        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.detailTextLabel?.textColor = UIColor.hexValue(0x343434);
        cell.accessoryType = .disclosureIndicator;
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "开始时间:"
            cell.detailTextLabel?.text = isEmptyDate ? "" : beginTime
        } else {
            cell.textLabel?.text = "结束时间:"
            cell.detailTextLabel?.text = isEmptyDate ? "" : endTime
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        if indexPath.row == 0 {
            datePicker.datePicker.minimumDate = self.isFuture == false ? Date.distantPast : self.beginDate
            datePicker.datePicker.date = self.beginDate
        } else {
            datePicker.datePicker.minimumDate = self.beginDate
            datePicker.datePicker.date = self.endDate
        }
        
        datePicker.show()
        datePicker.block({ (picker: NNDatePicker, idx:Int) in
            if indexPath.row == 0 {
                self.beginDate = picker.datePicker.date;
                if (self.isLockRangeDay) {
                    let date = Date(timeInterval: TimeInterval(self.rangeDay*24*60*60), since: picker.datePicker.date)
                    if date < self.endDate {
                        self.endDate = date
                    }
                }
            } else {
                self.endDate = picker.datePicker.date;
                if (self.isLockRangeDay) {
                    let date = Date(timeInterval: TimeInterval(-self.rangeDay*24*60*60), since: picker.datePicker.date)
                    if date > self.beginDate {
                        self.beginDate = date
                    }
                }
            }
            self.delegate?.dateRangeView(self)
            self.block?(self)
        })
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 10.01;
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let sectionView = UIView()
//        return sectionView
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0.01;
//    }
//
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let label = UILabel(frame: .zero);
//        //        label.backgroundColor = .green;
//        //        label.text = "header\(section)";
//        return label;
//    }
//
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        tableView.addSectionRoundCorner(cell: cell, forRowAt: indexPath)
//    }
}
