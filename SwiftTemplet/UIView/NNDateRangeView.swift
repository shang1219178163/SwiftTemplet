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

    var rangeDay: Int = 30

    lazy var dateEnd: String = DateFormatter.stringFromDate(Date())

    lazy var dateBegin: String = {
        let date: Date = Date().adding(-self.rangeDay)
        var dateStr: String = DateFormatter.stringFromDate(date)
        return dateStr
    }()
    
    private var viewBlock: ((NNDateRangeView) -> Void)? = nil

    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(labTitle)
        addSubview(labBegin)
        addSubview(labEnd)
        addSubview(labLine)
        
//        setupConstraint()
        
        let _ = labBegin.addGestureTap({ (sender:UIGestureRecognizer) in
            self.datePicker.show()
            self.datePicker.block({ (picker: NNDatePicker, idx:Int) in
                let dateStr = DateFormatter.dateFromPicker(picker.datePicker, date: picker.datePicker.date)
                self.labBegin.text = dateStr
                self.dateBegin = DateFormatter.stringFromDate(picker.datePicker.date)
                
                self.delegate?.dateRangeView(self)
                if self.viewBlock != nil {
                    self.viewBlock!(self)
                }
            })
        })
        
        let _ = labEnd.addGestureTap({ (sender:UIGestureRecognizer) in
            self.datePicker.show()
            self.datePicker.block({ (picker: NNDatePicker, idx:Int) in
                let dateStr = DateFormatter.dateFromPicker(picker.datePicker, date: picker.datePicker.date)
                self.labEnd.text = dateStr
                self.dateEnd = DateFormatter.stringFromDate(picker.datePicker.date)
                
                self.delegate?.dateRangeView(self)
                if self.viewBlock != nil {
                    self.viewBlock!(self)
                }
            })
        })
        
        labBegin.textColor = UIColor.theme;
        labEnd.textColor = UIColor.theme;
        labBegin.adjustsFontSizeToFitWidth = true
        labEnd.adjustsFontSizeToFitWidth = true
        labBegin.minimumScaleFactor = 0.8
        labEnd.minimumScaleFactor = 0.8

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
        if bounds.height <= 0 {
            return
        }
        setupDefault()
        
        let labTitleSize = labTitle.sizeThatFits(.zero)
        labTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(kY_GAP)
            make.left.equalToSuperview().offset(kX_GAP)
            make.width.equalTo(labTitleSize.width)
            make.bottom.equalToSuperview().offset(-kY_GAP)
        }
        
        let width = bounds.width - labTitleSize.width - kX_GAP*2
        let labWidth = (width - 20 - 5*2 - 8)*0.5

        labBegin.snp.remakeConstraints { (make) in
            make.top.bottom.equalTo(labTitle)
            make.left.equalTo(labTitle.snp.right).offset(8)
            make.width.equalTo(labWidth);
        }
        
        labLine.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(labTitle)
            make.left.equalTo(labBegin.snp.right).offset(5)
            make.width.equalTo(20);
        }
        
        labEnd.snp.remakeConstraints { (make) in
            make.top.bottom.equalTo(labTitle)
            make.left.equalTo(labLine.snp.right).offset(5)
            make.width.equalTo(labWidth);
        }
    }
        
    //MARK: -funtions
    func block(_ action:((NNDateRangeView) -> Void)?) {
        viewBlock = action;
    }
    
    func setupDefault() {
        labEnd.text = DateFormatter.dateFromPicker(datePicker.datePicker, date: Date())
        let date = Date().adding(-rangeDay)
        labBegin.text = DateFormatter.dateFromPicker(datePicker.datePicker, date: date)
        
        dateEnd = DateFormatter.stringFromDate(Date())
        dateBegin = DateFormatter.stringFromDate(date)
    }
    
    //MARK: -lazy
    lazy var labTitle: UILabel = {
        var view = UILabel()
        view.text = "日期选择:"
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 16)
        return view
    }()
    
    lazy var labBegin: UILabel = {
        var view = UILabel()
        view.text = "起始日期"
        view.textColor = UIColor.textColor3
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
        view.textColor = UIColor.textColor6
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 16)
        view.tag = kTAG_LABEL+1
        view.isUserInteractionEnabled = true
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    
    lazy var labLine: UILabel = {
        var view = UILabel()
        view.text = "~"
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 16)
        return view
    }()
    
    //MARK: -lazy
    lazy var datePicker: NNDatePicker = {
        var view = NNDatePicker(model: .date);
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
