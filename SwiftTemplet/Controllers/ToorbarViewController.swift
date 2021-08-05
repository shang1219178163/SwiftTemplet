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

    // MARK: -lifecycle
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
                
        

        var items: [UIBarButtonItem] = ["取消", "", "删除", "", "扩容", "", "减配", "", "续费", "", "加购"]
            .map({ e -> UIBarButtonItem in
                if e == "" {
                    let fixedItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
                    fixedItem.width = 15
                    return fixedItem
                }
                let sender = UIButton(type: .custom)
                sender.setTitle(e, for: .normal)
                sender.setTitleColor(.theme, for: .normal)
                sender.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)
//                sender.setBackgroundColor(.systemBlue, for: .normal)
                sender.addTarget(self, action: #selector(handleActionBtn(_:)), for: .touchUpInside)

                let size = sender.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: 0))
                sender.widthAnchor.constraint(equalToConstant: size.width + 16).isActive = true
                sender.heightAnchor.constraint(equalToConstant: 24).isActive = true
                
                sender.layer.borderColor = UIColor.systemBlue.cgColor
                sender.layer.borderWidth = 0.5
                sender.layer.cornerRadius = 3
                return UIBarButtonItem(customView: sender)
            })

        items.insert(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), at: 0)
        
        let toorbar1 = UIToolbar()
        toorbar1.items = items
        toorbar1.frame = CGRect(x: 0, y: 60, width: kScreenWidth, height: 45)
        toorbar1.barTintColor = .white
        view.addSubview(toorbar1)
        
        ///
        let item1s: [UIBarButtonItem] = ["取消", "删除", "扩容", ]
            .map({ e -> UIBarButtonItem in
                let sender = UIButton(type: .custom)
                sender.setTitle(e, for: .normal)
                sender.setTitleColor(.theme, for: .normal)
                sender.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .light)
//                sender.setBackgroundColor(.systemBlue, for: .normal)
                sender.addTarget(self, action: #selector(handleActionBtn(_:)), for: .touchUpInside)

                sender.sizeToAdjust(16, height: 24)
                
                sender.layer.borderColor = UIColor.systemBlue.cgColor
                sender.layer.borderWidth = 0.5
                sender.layer.cornerRadius = 3
                return UIBarButtonItem(customView: sender)
            })
        
        
        let toorbar2 = NNToolbar()
        toorbar2.alignment = .center
        toorbar2.spacing = 15
        toorbar2.elements = item1s
        toorbar2.frame = CGRect(x: 0, y: 120, width: kScreenWidth, height: 45)
        toorbar2.barTintColor = .white
        view.addSubview(toorbar2)
        
        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    // MARK: -funtsion
    @objc func handleActionBtn(_ sender: UIButton) {
        DDLog(sender.currentTitle)
        
        DDLog(sender.currentTitle?.padLeft(10, " "))
        DDLog(sender.currentTitle?.padRight(10, " "))

        DDLog("*"*3)
        
        // To convert Range<String.Index> to NSRange:
        guard let s = sender.currentTitle else { return }
        
        let string = "Hello USA 🇺🇸 !!! Hello World !!!"
        if let nsRange = string.range(of: "Hello World")?.nsRange(in: string) {
           let a = (string as NSString).substring(with: nsRange) //  "Hello World"
            DDLog(a)   // "[{0, 5}, {19, 5}]\n"
        }
        
        if let nsRange = string.nsRange(of: "Hello World") {
            let a = (string as NSString).substring(with: nsRange) //  "Hello World"
            DDLog(a)   // "[{0, 5}, {19, 5}]\n"
        }
        let nsRanges = string.nsRanges(of: "Hello")
        DDLog(nsRanges)   // "[{0, 5}, {19, 5}]\n"\
        
    
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


//extension String{
//
//    /// range转换为NSRange
//    func rangeNew(from nsRange: NSRange) -> Range<String.Index>? {
//        return Range(nsRange, in: self)
//    }
//}

