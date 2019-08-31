//
//  CalendarViewController.swift
//  
//
//  Created by Bin Shang on 2019/1/30.
//

import UIKit

import SwiftExpand

class CalendarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        calendarView.currentDate = DateFormatter.dateFromString("2022-04-09", fmt: kDateFormat_day)

        view.addSubview(calendarView)   
        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        calendarView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(view.snp.width)
        }
    }
    
    lazy var calendarView: NNCalendarView = {
        var view = NNCalendarView(frame: .zero)
        return view
    }()

    

}
