//
//  NNDateRangeView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/12.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

@objc protocol NNDateRangeViewDelegate{
    @objc func dateRangeView(_ rangeView: NNDateRangeView)
}

///时间区段选择器
@objcMembers class NNDateRangeView: UIView {
    
    weak var delegate: NNDateRangeViewDelegate?

    var inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    var isEmptyDate: Bool = false{
        willSet{
            labBegin.text = "开始时间"
            labEnd.text = "结束时间"
            
            beginTime = ""
            endTime = ""
        }
    }

    var rangeDay: Int = 30
    
    var isLockRangeDay = false

    var endDate: Date = Date(){
        willSet{
            endTime = DateFormatter.stringFromDate(newValue)
            labEnd.text = DateFormatter.dateFromPickerMode(datePicker.datePicker.datePickerMode, date: newValue)
        }
    }
    var beginDate: Date = Date(){
        willSet{
            beginTime = DateFormatter.stringFromDate(newValue)
            labBegin.text = DateFormatter.dateFromPickerMode(datePicker.datePicker.datePickerMode, date: newValue)
        }
    }
    
    ///时间区间是否在未来
    var isFuture: Bool = false{
        willSet{
            let now: Date = Date()
            beginDate = newValue == false ? now.adding(-self.rangeDay) : now
            endDate = newValue == false ? now : now.adding(self.rangeDay)
            
//            datePicker.datePicker.minimumDate = newValue == false ? Date.distantPast : now
        }
    }

    private(set) lazy var endTime: String = DateFormatter.stringFromDate(endDate)
    private(set) lazy var beginTime: String = DateFormatter.stringFromDate(beginDate)
    
    private var viewBlock: ((NNDateRangeView) -> Void)? = nil

    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(labTitle)
        addSubview(labBegin)
        addSubview(labEnd)
        addSubview(labLine)
        
//        setupConstraint()
        
        _ = labBegin.addGestureTap({ (sender: UIGestureRecognizer) in
            self.datePicker.datePicker.minimumDate = self.isFuture == false ? Date.distantPast : self.beginDate
            self.datePicker.datePicker.date = self.beginDate
            self.datePicker.show()
            self.datePicker.block({ (picker: NNDatePicker, idx: Int) in
                self.beginDate = picker.datePicker.date;
                if (self.isLockRangeDay) {
                    self.endDate = Date(timeInterval: TimeInterval(self.rangeDay*24*60*60), since: picker.datePicker.date)
                }
//                let dateStr = DateFormatter.dateFromPicker(picker.datePicker, date: picker.datePicker.date)
//                self.labBegin.text = dateStr
//                self.beginTime = DateFormatter.stringFromDate(picker.datePicker.date)
//                if picker.datePicker.datePickerMode == .time {
//                    self.beginTime = DateFormatter.stringFromDate(picker.datePicker.date, fmt: kTimeFormatBegin)
//                }
                
                self.delegate?.dateRangeView(self)
                self.viewBlock?(self)
            })
        })
        
        _ = labEnd.addGestureTap({ (sender:UIGestureRecognizer) in
            self.datePicker.datePicker.minimumDate = self.beginDate
            self.datePicker.datePicker.date = self.endDate
            self.datePicker.show()
            self.datePicker.block({ (picker: NNDatePicker, idx: Int) in
                self.endDate = picker.datePicker.date;
                if (self.isLockRangeDay) {
                    self.beginDate = Date(timeInterval: TimeInterval(-self.rangeDay*24*60*60), since: picker.datePicker.date)
                }
//                let dateStr = DateFormatter.dateFromPicker(picker.datePicker, date: picker.datePicker.date)
//                self.labEnd.text = dateStr
//                self.endTime = DateFormatter.stringFromDate(picker.datePicker.date)
//                if picker.datePicker.datePickerMode == .time {
//                    self.endTime = DateFormatter.stringFromDate(picker.datePicker.date, fmt: kTimeFormatEnd)
//                }
                
                self.delegate?.dateRangeView(self)
                self.viewBlock?(self)
            })
        })
        
        labBegin.textColor = UIColor.theme;
        labEnd.textColor = UIColor.theme;

        setupDefault()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
        
    func setupConstraint() {
        if bounds.height <= 10 {
            return
        }
        setupDefault()
        
        let height = bounds.height - inset.top - inset.bottom

        let labTitleSize = labTitle.sizeThatFits(.zero)
        labTitle.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(inset.left)
            make.width.equalTo(labTitleSize.width)
            make.height.equalTo(height)
        }
        
        let width = bounds.width - labTitleSize.width - inset.left - inset.right
        let labWidth = (width - 20 - 5*2 - 8)*0.5

        labBegin.snp.remakeConstraints { (make) in
            make.top.bottom.equalTo(labTitle)
            make.left.equalTo(labTitle.snp.right).offset(8)
            make.width.equalTo(labWidth)
        }
        
        labLine.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(labTitle)
            make.left.equalTo(labBegin.snp.right).offset(5)
            make.width.equalTo(20)
        }
        
        labEnd.snp.remakeConstraints { (make) in
            make.top.bottom.equalTo(labTitle)
            make.left.equalTo(labLine.snp.right).offset(5)
            make.width.equalTo(labWidth)
        }
    }
        
    //MARK: -funtions
    func block(_ action:((NNDateRangeView) -> Void)?) {
        viewBlock = action;
    }
    
    func setupDefault() {
        if isEmptyDate == true {
            return
        }
        assert(endTime.count == 19 && beginTime.count == 19 , "必须是完整的时间字符串,例'2020-05-15 01:06:29'")
        labBegin.text = DateFormatter.dateFromPickerMode(datePicker.datePicker.datePickerMode, date: beginDate)
        labEnd.text = DateFormatter.dateFromPickerMode(datePicker.datePicker.datePickerMode, date: endDate)
    }
    
    //MARK: -lazy
    lazy var labTitle: UILabel = {
        let view = UILabel()
        view.text = "日期选择:"
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 16)
        return view
    }()
    
    lazy var labBegin: UILabel = {
        let view = UILabel()
        view.text = "开始时间"
        view.textColor = .gray
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 14)
        view.isUserInteractionEnabled = true
        view.adjustsFontSizeToFitWidth = true
        view.minimumScaleFactor = 0.8
        return view
    }()
    
    
    lazy var labEnd: UILabel = {
        let view = UILabel()
        view.text = "结束时间"
        view.textColor = UIColor.gray
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 14)
        view.isUserInteractionEnabled = true
        view.adjustsFontSizeToFitWidth = true
        view.minimumScaleFactor = 0.8
        return view
    }()
    
    lazy var labLine: UILabel = {
        let view = UILabel()
        view.textColor = .gray
        view.text = "~"
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 14)
        return view
    }()
    
    //MARK: -lazy
    lazy var datePicker: NNDatePicker = {
        let view = NNDatePicker(model: .date);
//        view.block({ (sender, idx) in
//            DDLog(view,sender.datePicker.date,idx);
//            self.viewBlock?(self);
//
//        })
        return view;
    }()
}
