//
//  DateDemoController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/12.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKit


@available(iOS 13.0, *)
class DateDemoController: UIViewController {
        
    
    lazy var group: NNGroupButton = {
        let sender = NNGroupButton()
        sender.items = [UIButton].init(count: 9, generator: { (i) -> UIButton in
            let sender = NNButton(type: .custom)
            sender.setTitle("item_\(i)", for: .normal)
            sender.setTitleColor(.gray, for: .normal)
            sender.setTitleColor(.systemBlue, for: .selected)

            sender.setBorderColor(.line, for: .normal)
            sender.setBorderColor(.systemBlue, for: .selected)
            
            sender.layer.cornerRadius = 5;
            sender.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            
//            sender.iconSize = CGSize(width: 30, height: 18)
//            sender.iconBtn.setTitle("\(i)", for: .normal)
//            sender.iconBtn.setTitleColor(.red, for: .normal)

//            sender.getViewLayer()
            return sender
        })
        sender.isMutiChoose = true
        sender.itemsIndexs = [1,3,5]
        sender.block = { view, sender in
//            DDLog(view.itemsIndexs)
//            DDLog(view.itemsIndexs)
            self.handleAction(sender.tag)
        }
        return sender
    }()
    

    private var formatter: DateComponentsFormatter {
        let fmt = DateComponentsFormatter()
        fmt.allowedUnits = [.day, .hour, .minute, .second]
        fmt.unitsStyle = .short
        return fmt
    }
    
    // MARK: -lfcycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        
        view.addSubview(group)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        group.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(300);
        }
    }
    

    func handleAction(_ index: Int) {
        switch index {
        case 0:
            let components = DateComponents(hour: 3, minute: 58)

            let formatter = DateComponentsFormatter()

//            formatter.unitsStyle = .positional
            let result = formatter.string(from: components)
            DDLog(result) //3:58

//            formatter.unitsStyle = .abbreviated
//            result = formatter.string(from: components)
//            DDLog(result) //3h 58m
//
//            formatter.unitsStyle = .short
//            result = formatter.string(from: components)
//            DDLog(result) //3 hr, 58 min
//
//            formatter.unitsStyle = .full
//            result = formatter.string(from: components)
//            DDLog(result) //3 hours, 58 minutes
//
//            formatter.unitsStyle = .spellOut
//            result = formatter.string(from: components)
//            DDLog(result) //three hours, fifty-eight minutes
//
//            formatter.unitsStyle = .brief
//            result = formatter.string(from: components)
//            DDLog(result) //3hr 58min
        
        case 1:
            let formatter = RelativeDateTimeFormatter()
            formatter.locale = Locale.zh_CN
            formatter.dateTimeStyle = .named

            DDLog(formatter.localizedString(from: DateComponents(month: -1))) // 上个月
            DDLog(formatter.localizedString(from: DateComponents(month: 0))) // 今月
            DDLog(formatter.localizedString(from: DateComponents(month: 1))) // 下个月

            DDLog(formatter.localizedString(from: DateComponents(day: -3))) // 3 日前
            DDLog(formatter.localizedString(from: DateComponents(day: -2))) // 前天
            DDLog(formatter.localizedString(from: DateComponents(day: -1))) // 昨日
            DDLog(formatter.localizedString(from: DateComponents(day: 0))) // 今日
            DDLog(formatter.localizedString(from: DateComponents(day: 1))) // 明日
            DDLog(formatter.localizedString(from: DateComponents(day: 2))) // 后天
            DDLog(formatter.localizedString(from: DateComponents(day: 3))) // 3 日後
        
        
        case 2:
            let formatter = DateIntervalFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .short

            let startDate = Date(timeIntervalSince1970: 1608856860)
            let endDate = Date(timeInterval: 86400, since: startDate)

            DDLog(formatter.string(from: startDate, to: endDate)) // 12/25/20, 9:41 AM – 12/26/20, 9:41 AM
        
            formatter.locale = Locale.zh_CN
            DDLog(formatter.string(from: startDate, to: endDate)) // 2020/12/25 上午8:41 – 2020/12/26 上午8:41
        
        case 3:
            let formatter = ISO8601DateFormatter()

            let dateString = "2020-12-25T09:41:00Z"
            let date = formatter.date(from: dateString)
            DDLog(date) // 2020-12-25 09:41:00 +0000

            formatter.formatOptions = [.withYear, .withMonth, .withDay, .withTime]

            let date1 = Date(timeIntervalSince1970: 1608889260)
            let dateString1 = formatter.string(from: date1)
            DDLog(dateString1) // 20201225T094100
        
        default:
            break
        }

    }


}
