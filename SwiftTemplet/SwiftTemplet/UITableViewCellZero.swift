//
//  UITableViewCellZero.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/29.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

class UITableViewCellZero: UITableViewCell {

//    static func cellWithTableView(tableView:UITableView, identifier:String) -> UITableViewCell! {
//        
//        var cell = tableView.dequeueReusableCell(withIdentifier: identifier);
//        if cell == nil {
//            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier);
//        }
//        
//        cell?.selectionStyle = UITableViewCellSelectionStyle.none;
//        cell?.separatorInset = UIEdgeInsets.zero;
//        return cell;
//    }
//    
//    static func cellWithTableView(tableView:UITableView) -> UITableViewCell {
//        let identifier = NSStringFromClass(self.classForCoder());
//        return self.cellWithTableView(tableView: tableView, identifier: identifier);
//    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
