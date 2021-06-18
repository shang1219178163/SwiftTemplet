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
    
    var year: Int = Calendar.shared.dateComponents(Calendar.unitFlags, from: Date()).year!
    {
        willSet{
            handleTitleBtnChange(newValue, month: month)
        }
    }
    var month: Int = Calendar.shared.dateComponents(Calendar.unitFlags, from: Date()).month!
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

        if let comp = Calendar.shared.dateComponents(Calendar.unitFlags, from: currentDate) as DateComponents? {
            year = comp.year!
            month = comp.month!
        }
        reloadData()
        
        titleBtn.titleLabel!.addObserver(self, forKeyPath: "text", options: .new, context: nil)
        
        let list = [yearPreBtn, monthPreBtn, monthNextBtn, yearNextBtn]
        for e in list {
            e.layer.borderColor = UIColor.lightGray.cgColor
            e.layer.borderWidth = 0.3
            e.layer.cornerRadius = 3
        }


    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            if let text = change![NSKeyValueChangeKey.newKey] as? String {
//                self.currentDate = DateFormatter.dateFromString(text, fmt: kDateFormat_six)
                reloadData()
//                DDLog(text,DateFormatter.stringFromDate(self.currentDate, fmt: kDateFormatMonth_CH))

                let dateStr = DateFormatter.stringFromDate(Date(), fmt: kDateFormatMonth_CH)
                todayBtn.isHidden = (text == dateStr)
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
        let view = UIButton(type: .custom)
        view.setImage(UIImage(named: "left"), for: .normal)
        view.addActionHandler({[weak self] (control) in
            guard let self = self else { return }
            self.year -= 1
//            DDLog("\(self!.year)年\(self!.month)月");
            
        }, for: .touchUpInside)
        return view
    }()

    lazy var yearNextBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setImage(UIImage(named: "right"), for: .normal)
        view.addActionHandler({[weak self] (control) in
            guard let self = self else { return }
            self.year += 1
//            DDLog("\(self!.year)年\(self!.month)月");

            }, for: .touchUpInside)
        return view
    }()
    
    lazy var monthPreBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setImage(UIImage(named: "left"), for: .normal)
        view.addActionHandler({[weak self] (control) in
            guard let self = self else { return }
            if self.month == 1 {
                self.year -= 1;
                self.month = 12;
            } else {
                self.month -= 1
            }
//            DDLog("\(self!.year)年\(self!.month)月");

            }, for: .touchUpInside)
        return view
    }()
    
    lazy var monthNextBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setImage(UIImage(named: "right"), for: .normal)
        view.addActionHandler({[weak self] (control) in
            guard let self = self else { return }
            if self.month == 12 {
                self.year += 1;
                self.month = 1;
            } else {
                self.month += 1
            }
//            DDLog("\(self!.year)年\(self!.month)月");

            }, for: .touchUpInside)
        return view
    }()
    
    lazy var titleBtn: UIButton = {
        var dateStr = DateFormatter.stringFromDate(currentDate, fmt: kDateFormatMonth_CH)
        dateStr = "\(year)年\(month)月"
        let view = UIButton(type: .custom)
        view.setTitle(dateStr, for: .normal)

        view.addActionHandler({[weak self] (control) in
            DDLog(dateStr)
            }, for: .touchUpInside)
        return view
    }()
    
    lazy var todayBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("今天", for: .normal)

        view.addActionHandler({[weak self] (control) in
            guard let self = self else { return }
            let comp = Calendar.shared.dateComponents(Calendar.unitFlags, from: Date())
            self.year = comp.year!
            self.month = comp.month!
            
            }, for: .touchUpInside)
        return view
    }()
    
    lazy var weeksView: NNItemsView = {
        let view = NNItemsView(frame: .zero)
        view.items = weekInfo
        view.numberOfRow = weekInfo.count
        view.padding = 0.0
        return view
    }()
    
    lazy var daysView: NNItemsView = {
        let view = NNItemsView(frame: .zero)
        view.items = [String](repeating: "", count: 37)
        view.numberOfRow = weekInfo.count
        view.padding = 0.0
        view.isMutiChoose = false
        view.block({ (itemsView, sender) in
            DDLog(sender.tag)
        })
        return view
    }()
    
    func reloadData() {
        let count = currentDate.countOfDaysInMonth
        let startIdx = currentDate.firstWeekDay - 1 //布局从0开始,日期从1开始
        
        DDLog("=========",DateFormatter.stringFromDate(currentDate), count, startIdx)
        
        for e in daysView.itemList.enumerated() {
            e.element.isSelected = false

            if e.offset >= startIdx && e.offset <= (count + startIdx - 1) {
                e.element.setTitle("\(e.offset - startIdx + 1)", for: .normal)
                
                let day = Calendar.shared.dateComponents(Calendar.unitFlags, from: Date()).day
                if day == e.offset - startIdx + 1 {
                    e.element.isSelected = true
                    self.dateList.insert(dateStrFmtFrom(e.element))
                }
                
                e.element.setTitleColor(.white, for: .selected)
                e.element.setBackgroundImage(UIImage(color: .theme), for: .selected)
                e.element.addActionHandler({ (sender) in
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
        let monthDes = (month >= 10 ? "\(month)" : "0\(month)")
        let dateStr = "\(year)年\(monthDes)月"
        titleBtn.setTitle(dateStr, for: .normal)
        currentDate = DateFormatter.dateFromString(dateStr, fmt: kDateFormatMonth_CH)!
    }
    
    func dateStrFmtFrom(_ btn: UIButton) -> String {
//        DDLog(self.titleBtn.titleLabel!.text ?? "空", btn.titleLabel!.text ?? "空")
        let dateStr = (self.titleBtn.titleLabel!.text ?? "空") + (btn.titleLabel!.text ?? "空") + "日"
        let date = DateFormatter.dateFromString(dateStr, fmt: kDateFormatDay_CH)!
        let dateStrFmt = DateFormatter.stringFromDate(date)
        return dateStrFmt
    }
    
  
    

}
