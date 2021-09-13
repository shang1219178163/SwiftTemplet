//
//  SystemColorShowController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/23.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// 列表

@available(iOS 13.0, *)
@objcMembers class SystemColorShowController: UIViewController{
    

    // MARK: - lazy
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 60)
        view.backgroundColor = UIColor.white
        view.dataSource = self
        view.delegate = self

        return view
    }()
        
    lazy var rightBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("保存", for: .normal)
        
        view.isHidden = true;
        view.sizeToFit()
        view.addActionHandler({ (sender) in
            
        }, for: .touchUpInside)
        return view
    }()
    
    @objc func handleAction(_ sender: UIButton) {
        
    }
    
    let list = [
        [UIColor.black,
         UIColor.darkGray,
         UIColor.lightGray,
         UIColor.white,
         UIColor.gray,
         UIColor.red,
         UIColor.green,
         UIColor.blue,
         UIColor.cyan,
         UIColor.yellow,
         UIColor.magenta,
         UIColor.orange,
         UIColor.purple,
         UIColor.brown,
         UIColor.clear,
        ],
        [UIColor.theme,
        UIColor.background,
        UIColor.dim,
        UIColor.line,
        UIColor.excel,
        UIColor.lightBlue,
        UIColor.lightOrange,
        UIColor.lightGreen,
        UIColor.lightRed,
        UIColor.textColor3,
        UIColor.textColor6,
        UIColor.textColor9,
        UIColor.textColorExpired,
        ],
        [UIColor.systemRed,
        UIColor.systemGreen,
        UIColor.systemBlue,
        UIColor.systemOrange,
        UIColor.systemYellow,
        UIColor.systemPink,
        UIColor.systemPurple,
        UIColor.systemTeal,
        UIColor.systemGray,
        UIColor.lightText,
        UIColor.darkText,
        UIColor.groupTableViewBackground
        ],
        [UIColor.systemIndigo,
        UIColor.systemGray2,
        UIColor.systemGray3,
        UIColor.systemGray4,
        UIColor.systemGray5,
        UIColor.systemGray6,
        UIColor.label,
        UIColor.secondaryLabel,
        UIColor.tertiaryLabel,
        UIColor.quaternaryLabel,
        UIColor.link,
        UIColor.placeholderText,
        UIColor.separator,
        UIColor.opaqueSeparator,
        UIColor.systemBackground,
        UIColor.secondarySystemBackground,
        UIColor.tertiarySystemBackground,
        UIColor.systemGroupedBackground,
        UIColor.secondarySystemGroupedBackground,
        UIColor.tertiarySystemGroupedBackground,
        UIColor.systemFill,
        UIColor.secondarySystemFill,
        UIColor.tertiarySystemFill,
        UIColor.quaternarySystemFill,]
    ]
    
        
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        title = "系统颜色"
        setupUI()
    }
    
    // MARK: - funtions
    func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
        view.addSubview(tableView);
    }

}

@available(iOS 13.0, *)
extension SystemColorShowController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[section].count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.dequeueReusableCell(tableView, identifier: "UITableViewCellSubtitle", style: .subtitle)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.text = "--"
        cell.textLabel?.textColor = UIColor.textColor3;

        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.detailTextLabel?.text = "--"
        cell.detailTextLabel?.textColor = UIColor.textColor6;
        cell.accessoryType = .disclosureIndicator;
        
        cell.textLabel?.text = indexPath.toString
        
        let color = list[indexPath.section][indexPath.row]
//        DDLog(indexPath.string, color.description)
        cell.backgroundColor = color

        if color.description.contains("=") {
            let infos = color.description.components(separatedBy: CharacterSet(charactersIn: "=>"))
            cell.textLabel?.text = infos[1]
            cell.detailTextLabel?.text = infos[1]
        } else {
            let infos = color.description.components(separatedBy: CharacterSet(charactersIn: " "))
            var result = infos.first ?? ""
            for e in infos.enumerated() {
                if e.offset > 0 {
                    result += "\(Int(e.element.floatValue * 255)) "
                }
            }

            cell.textLabel?.text = result
            cell.detailTextLabel?.text = result
        }
        cell.textLabel?.textColor = color
        
        if indexPath.section != 1 && list[1].contains(color) {
            DDLog(indexPath.toString, color)
        }

        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let color: UIColor = list[indexPath.section][indexPath.row]
        DDLog(color.description)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.01;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return kBlankOne + "定制颜色"
        case 3:
            return kBlankOne + "@available(iOS 13.0, *)"
        case 2:
            return kBlankOne + "通用颜色"
        default:
            break
        }
        return kBlankOne + "基础颜色"
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UILabel();
//    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UILabel();
    }
}
