//
//  ToorbarViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/7/14.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class ToorbarViewController: UIViewController {

    private let scrollView = UIScrollView(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: 45))
    private let toorbar = UIToolbar()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        scrollView.contentSize = CGSize(width: kScreenWidth*2.5, height: 45)
        toorbar.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height)
        scrollView.addSubview(toorbar)
        view.addSubview(scrollView)

        toorbar.items = UIBarButtonItem.SystemItem.allCases.map({
            UIBarButtonItem(systemItem: $0) { item in
                DDLog(item.systemType.rawValue, item.width)
            }
        })
        
        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
}


extension UIBarButtonItem.SystemItem: CaseIterable{
    
    public static var allCases: [UIBarButtonItem.SystemItem] {
        var list: [UIBarButtonItem.SystemItem] = [
            .done,
            .cancel,
            .edit,
            .save,
            .add,
            .flexibleSpace,
            .fixedSpace,
            .compose,
            .reply,
            .action,
            .organize,
            .bookmarks,
            .search,
            .refresh,
            .stop,
            .camera,
            .trash,
            .play,
            .pause,
            .rewind,
            .fastForward,
            .undo,
            .redo,
        ]
        
        if #available(iOS 13.0, *) {
            list.append(.close)
        }
        return list
    }
}
