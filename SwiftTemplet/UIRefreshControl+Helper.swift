//
//  UIRefreshControl+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/12/4.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

@objc public extension UIRefreshControl {

    func beginRefreshing(in tableView: UITableView, animated: Bool, sendAction: Bool = false) {
        // https://stackoverflow.com/questions/14718850/14719658#14719658
        assert(superview == tableView, "Refresh control does not belong to the receiving table view")

        beginRefreshing()
        let offsetPoint = CGPoint(x: 0, y: -frame.height)
        tableView.setContentOffset(offsetPoint, animated: animated)

        if sendAction {
            sendActions(for: .valueChanged)
        }
    }
}
