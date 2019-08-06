//
//  BNDateRangeView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/12.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

class BNDateRangeView: UIView {

    var dateStart: String?
    var dateEnd: String?
    private var viewBlock: ((BNDateRangeView) -> Void)? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(labTitle)
        addSubview(labStart)
        addSubview(labEnd)
        addSubview(labLine)
        
        setupConstraint()
        
        let _ = labStart.addGestureTap({ (sender:UIGestureRecognizer) in
            self.datePicker.show()
            self.datePicker.block({ (picker: BNDatePicker, idx:Int) in
                let dateStr = DateFormatter.stringFromDate(picker.datePicker.date, fmt: kDateFormat_minute)

//                DDLog("起始时间:",dateStr)
                self.labStart.text = (dateStr as NSString).substring(to: 10)
                self.dateStart = dateStr;
                if self.viewBlock != nil {
                    self.viewBlock!(self)
                }
            })
        })
        
        let _ = labEnd.addGestureTap({ (sender:UIGestureRecognizer) in
            self.datePicker.show()
            self.datePicker.block({ (picker: BNDatePicker, idx:Int) in
                let dateStr = DateFormatter.stringFromDate(picker.datePicker.date, fmt: kDateFormat_minute)
//                DDLog("截止日期:",dateStr)
                self.labEnd.text = (dateStr as NSString).substring(to: 10)
                self.dateEnd = dateStr;
                if self.viewBlock != nil {
                    self.viewBlock!(self)
                }
            })
        })
        
        labStart.textColor = UIColor.theme;
        labEnd.textColor = UIColor.theme;

        labEnd.text = DateFormatter.stringFromDate(Date(), fmt: kDateFormat_minute)
        let date = Date().adding(-30)
        labStart.text = DateFormatter.stringFromDate(date, fmt: kDateFormat_minute)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupConstraint() -> Void {
        
        let labTitleSize = labTitle.sizeThatFits(.zero)
        labTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kY_GAP)
            make.left.equalToSuperview().offset(kX_GAP)
            make.width.equalTo(labTitleSize.width)
            make.bottom.equalToSuperview().offset(-kY_GAP)
        }
        
        let width = bounds.width - labTitleSize.width - kX_GAP*2
        let ctlWidth = width*0.8
        
        labStart.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(labTitle)
            make.left.equalTo(labTitle.snp.right).offset((width - ctlWidth)*0.5)
            make.width.equalTo(120);
        }
        
        labLine.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(labTitle)
            make.left.equalTo(labStart.snp.right).offset(5)
            make.width.equalTo(20);
        }
        
        labEnd.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(labTitle)
            make.left.equalTo(labLine.snp.right).offset(5)
            make.width.equalTo(120);
        }
    
    }
    
//    func setupConstraint() -> Void {
//        labTitle.sizeToFit()
//        labTitle.frame.size = CGSize(width: labTitle.width, height: 35)
//        labTitle.snp.makeConstraints { (make) in
//            make.centerY.equalToSuperview()
//            make.left.equalToSuperview().offset(kX_GAP)
//            make.size.equalTo(labTitle.frame.size);
//        }
//
//        let width = frame.width - labTitle.frame.maxX - kX_GAP
//        let ctlWidth = width*0.7
//
//        labStart.frame.size = CGSize(width: 100, height: labTitle.frame.height)
//        labStart.snp.makeConstraints { (make) in
//            make.top.equalTo(labTitle)
//            make.left.equalTo(labTitle.snp.right).offset((width - ctlWidth)*0.5)
//            make.size.equalTo(labStart.frame.size);
//        }
//
//        labLine.frame.size = CGSize(width: 20, height: labTitle.frame.height)
//        labLine.snp.makeConstraints { (make) in
//            make.top.equalTo(labTitle)
//            make.left.equalTo(labStart.snp.right).offset(20)
//            make.size.equalTo(labLine.frame.size);
//        }
//
//        labEnd.snp.makeConstraints { (make) in
//            make.top.equalTo(labTitle)
//            make.left.equalTo(labLine.snp.right).offset(20)
//            make.size.equalTo(labStart.frame.size)
//        }
//    }
    
    //MARK: -funtions
    func block(_ action:((BNDateRangeView) -> Void)?) -> Void {
        viewBlock = action;
    }
    
    //MARK: -lazy
    lazy var labTitle: UILabel = {
        var view = UILabel()
        view.text = "日期选择:"
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 16)
        return view
    }()
    
    lazy var labStart: UILabel = {
        var view = UILabel()
        view.text = "起始日期"
        view.textColor = UIColor.textColorSub
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 16)
        view.tag = kTAG_LABEL
        view.isUserInteractionEnabled = true
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    
    lazy var labEnd: UILabel = {
        var view = UILabel()
        view.text = "截止日期"
        view.textColor = UIColor.textColorSub
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 16)
        view.tag = kTAG_LABEL+1
        view.isUserInteractionEnabled = true
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    lazy var labLine: UILabel = {
        var view = UILabel()
        view.text = "-"
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 16)
        return view
    }()
    
    //MARK: -lazy
    lazy var datePicker: BNDatePicker = {
        var view = BNDatePicker();
//        view.block({ (sender, idx) in
//            DDLog(view,sender.datePicker.date,idx);
//            if self.viewBlock != nil {
//                self.viewBlock!(self);
//
//            }
//        })
        return view;
    }()
}
