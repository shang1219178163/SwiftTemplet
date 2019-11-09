//
//  NNCalendarView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand
import SnapKit

class NNCalendarView: UIView {
    
    let weekInfo: [String] = ["周日","周一","周二","周三","周四","周五","周六",]
    var dateList: Set<String> = []

    var currentDate: Date = Date()
    {
        didSet{
            let comp = Date.dateComponents(oldValue)
            year = comp.year!
            month = comp.month!
        }
    }
    
    var year: Int = Date.dateComponents(Date()).year!
    {
        willSet{
            handleTitleBtnChange(newValue, month: month)
        }
    }
    var month: Int = Date.dateComponents(Date()).month!
    {
        willSet{
            handleTitleBtnChange(year, month: newValue)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(yearPreBtn)
        addSubview(monthPreBtn)
        addSubview(titleBtn)
        addSubview(monthNextBtn)
        addSubview(yearNextBtn)
        addSubview(todayBtn)
        
        addSubview(weeksView)
        addSubview(daysView)

        reloadData()
        
        self.titleBtn.titleLabel?.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            if let text = change![NSKeyValueChangeKey.newKey] as? String {
//                self.currentDate = DateFormatter.dateFromString(text, fmt: kDateFormat_six)
                reloadData()
                DDLog(text,DateFormatter.stringFromDate(self.currentDate, fmt: kDateFormat_month_ch))

                let dateStr = DateFormatter.stringFromDate(Date(), fmt: kDateFormat_month_ch)
                self.todayBtn.isHidden = (text == dateStr)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        yearPreBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kPadding);
            make.left.equalToSuperview().offset(kPadding);
            make.width.height.equalTo(30);
        }
        
        monthPreBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kPadding);
            make.left.equalTo(yearPreBtn.snp.right).offset(kPadding);
            make.width.height.equalTo(30);
        }
        
        titleBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kPadding);
            make.left.equalTo(monthPreBtn.snp.right).offset(kPadding);
            make.width.equalTo((titleBtn.titleLabel?.text?.count)!*18);
            make.height.equalTo(30);
        }
        
        monthNextBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kPadding);
            make.left.equalTo(titleBtn.snp.right).offset(kPadding);
            make.width.height.equalTo(30);
        }
        
        yearNextBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kPadding);
            make.left.equalTo(monthNextBtn.snp.right).offset(kPadding);
            make.width.height.equalTo(30);
        }
        
        todayBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kPadding);
            make.left.equalTo(yearNextBtn.snp.right).offset(kPadding);
            make.width.height.equalTo(35);
        }
     
        weeksView.snp.makeConstraints { (make) in
            make.top.equalTo(titleBtn.snp.bottom).offset(kPadding)
            make.left.equalToSuperview().offset(kPadding)
            make.right.equalToSuperview().offset(-kPadding)
            make.height.equalTo(35)
        }
        
        daysView.snp.makeConstraints { (make) in
            make.top.equalTo(weeksView.snp.bottom).offset(kPadding)
            make.left.equalToSuperview().offset(kPadding)
            make.right.equalToSuperview().offset(-kPadding)
            make.bottom.equalToSuperview().offset(-kPadding)
        }
    }
    
    lazy var yearPreBtn: UIButton = {
        var view = UIButton.create(.zero, title: nil, imgName: "left", type: 4)
        view.addActionHandler({[weak self] (control) in
            self!.year -= 1
//            DDLog("\(self!.year)年\(self!.month)月");
            
        }, for: .touchUpInside)
        return view
    }()

    lazy var yearNextBtn: UIButton = {
        var view = UIButton.create(.zero, title: nil, imgName: "right", type: 4)
        view.addActionHandler({[weak self] (control) in
            self!.year += 1
//            DDLog("\(self!.year)年\(self!.month)月");

            }, for: .touchUpInside)
        return view
    }()
    
    lazy var monthPreBtn: UIButton = {
        var view = UIButton.create(.zero, title: nil, imgName: "left", type: 4)
        view.addActionHandler({[weak self] (control) in
            if self!.month == 1 {
                self!.year -= 1;
                self!.month = 12;
            } else {
                self!.month -= 1
            }
//            DDLog("\(self!.year)年\(self!.month)月");

            }, for: .touchUpInside)
        return view
    }()
    
    lazy var monthNextBtn: UIButton = {
        var view = UIButton.create(.zero, title: nil, imgName: "right", type: 4)
        view.addActionHandler({[weak self] (control) in
            if self!.month == 12 {
                self!.year += 1;
                self!.month = 1;
            } else {
                self!.month += 1
            }
//            DDLog("\(self!.year)年\(self!.month)月");

            }, for: .touchUpInside)
        return view
    }()
    
    lazy var titleBtn: UIButton = {
        var dateStr = DateFormatter.stringFromDate(currentDate, fmt: kDateFormat_month_ch)
        dateStr = "\(year)年\(month)月"
        var view = UIButton.create(.zero, title: dateStr, imgName: nil, type: 2)
        view.addActionHandler({[weak self] (control) in
            DDLog(dateStr)
            }, for: .touchUpInside)
        return view
    }()
    
    lazy var todayBtn: UIButton = {
        var view = UIButton.create(.zero, title: "今天", imgName: nil, type: 2)
        view.addActionHandler({[weak self] (control) in
            let comp = Date.dateComponents(Date())
            self!.year = comp.year!
            self!.month = comp.month!
            
            }, for: .touchUpInside)
        return view
    }()
    
    lazy var weeksView: NNItemsView = {
        var view = NNItemsView(frame: .zero)
        view.items = weekInfo
        view.numberOfRow = weekInfo.count
        view.padding = 0.0
        return view
    }()
    
    lazy var daysView: NNItemsView = {
        var view = NNItemsView(frame: .zero)
        view.items = Array<Any>.appendSame("" as AnyObject, count: 37) as? [String]
        view.numberOfRow = weekInfo.count
        view.padding = 0.0
        view.block({ (itemsView, control) in
            if let sender = control as? UIButton {
                DDLog(sender.tag)
            }
            
        })
        return view
    }()
    
    func reloadData() {
        let count = currentDate.countOfDaysInMonth
        let startIdx = currentDate.firstWeekDay - 1 //布局从0开始,日期从1开始
        
        DDLog("=========",DateFormatter.stringFromDate(currentDate),count,startIdx)
        
        for e in daysView.itemList.enumerated() {
            e.element.isSelected = false

            if e.offset >= startIdx && e.offset <= (count + startIdx - 1) {
                e.element.setTitle("\(e.offset - startIdx + 1)", for: .normal)
                
                let day = Date.dateComponents(Date()).day
                if day == e.offset - startIdx + 1 {
                    e.element.isSelected = true
                    self.dateList.insert(dateStrFmtFrom(e.element))
                }
                
                e.element.setTitleColor(.white, for: .selected)
                e.element.setBackgroundImage(UIImageColor(.theme), for: .selected)
                e.element.addActionHandler({ (control) in
                    e.element.isSelected = !e.element.isSelected
                    
                    let dateStrFmt = self.dateStrFmtFrom(e.element)
                    DDLog(dateStrFmt)
                    
                    if e.element.isSelected == true {
                        self.dateList.insert(dateStrFmt)

                    } else {
                        self.dateList.remove(dateStrFmt)
                    }
                    DDLog(self.dateList)
                    
                }, for: .touchUpInside);
            } else {
                e.element.setTitle("", for: .normal)

            }
        }
    }
    
    func handleTitleBtnChange(_ year: Int, month: Int) {
        let dateStr = "\(year)年\(month)月"
        self.titleBtn.setTitle(dateStr, for: .normal)
//        self.currentDate = DateFormatter.dateFromString(dateStr, fmt: kDateFormat_six)
    }
    
//    func handleTitleFrom(_ aDate: Date) {
//        let comp = Date.dateComponents(aDate)
//        year = comp.year!
//        month = comp.month!
//        handleTitleBtnChange(year, month: month)
//    }
    
    func dateStrFmtFrom(_ btn: UIButton) -> String {
        let dateStr = (self.titleBtn.titleLabel!.text ?? "空") + (btn.titleLabel!.text ?? "空") + "日"
        let date = DateFormatter.dateFromString(dateStr, fmt: kDateFormat_day_ch)
        let dateStrFmt = DateFormatter.stringFromDate(date)
        return dateStrFmt
    }
    
  
    

}
