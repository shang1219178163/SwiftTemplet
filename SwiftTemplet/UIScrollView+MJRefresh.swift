//
//  MJRefreshNormalHeader+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/21.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import MJRefresh


@objc public extension UIScrollView {

    ///纯色背景色下拉刷新
    func refreshBlock(_ action: @escaping MJRefreshComponentAction,
                      textColor: UIColor = .gray,
                      backgroundColor: UIColor = .clear) {
        let backView = UIView(frame: CGRect(x: 0, y: -1000, width: UIScreen.main.bounds.width, height: 960))
        backView.backgroundColor = backgroundColor
        addSubview(backView)
        
        let header = MJRefreshNormalHeader(refreshingBlock: action)
        header.lastUpdatedTimeLabel?.isHidden = true
        header.stateLabel?.textColor = textColor
        header.backgroundColor = backgroundColor
        mj_header = header
    }

}
