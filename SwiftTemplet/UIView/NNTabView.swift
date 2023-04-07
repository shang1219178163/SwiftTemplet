//
//  NNTabView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/16.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

@objc protocol NNTabViewDelegate: NSObjectProtocol {
    @objc func tabView(_ tabView: NNTabView, didSelect view: UIView, selectedIndex: Int);
}
/// 轮转视图(弃用)
@objcMembers class NNTabView: UIView, UIScrollViewDelegate {

    var selectedView: UIView?

    var items: [UIView]?{
        willSet{
            guard let newValue = newValue else { return }
            
            selectedView = newValue.first;
            for e in newValue.enumerated() {
                selectedView!.willMove(toSuperview: scrollViewContent)
                e.element.tag = e.offset;
                scrollViewContent.addSubview(e.element)
                selectedView!.didMoveToSuperview()
//                DDLog("element_\(e.element.title)",e.offset)
            }
        }
    }
    
    private var currentSelectedIndex: Int = 0;
    var selectedIndex: Int{
        set{
            let offset = CGPoint(newValue.cgFloatValue * scrollViewContent.sizeWidth, 0);
            scrollViewContent.setContentOffset(offset, animated: true)
            
            selectedView = items![newValue];
            currentSelectedIndex = 0;
        }
        get{
            return currentSelectedIndex;
        }
    }
    
    weak var delegate: NNTabViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white;
        addSubview(scrollViewContent);

    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
  
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10.0  || items == nil || items?.count == 0 {
            return;
        }
        guard let items = items else { return }
//        scrollViewContent.frame = bounds;
        scrollViewContent.snp.makeConstraints { (make) in
            make.edges.equalToSuperview();
        }
//        DDLog("items_\(items!.count)_\(items!.count.cgFloatValue))

        scrollViewContent.contentSize = CGSize(width: items.count.cgFloatValue * bounds.width,
                                               height: bounds.height)
//        DDLog("contentSize_\(scrollViewContent.contentSize)")

        for e in items.enumerated() {
            let view: UIView = e.element;
            view.frame = CGRect(e.offset.cgFloatValue * bounds.width,
                                    0,
                                    bounds.width,
                                    bounds.height)
            view.layoutIfNeeded()
            view.backgroundColor = UIColor.random
            DDLog("\(e.offset)_\(view.frame)")
        }
    }
    
    // MARK: -UIScrollView
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == scrollViewContent {
            let index = Int(scrollView.contentOffset.x / scrollView.sizeWidth);
            currentSelectedIndex = index;
            let choose = items![index];
            delegate?.tabView(self, didSelect: choose, selectedIndex: currentSelectedIndex)

        }
    }
    // MARK: -funtions
    func handleSelectedView(_ view: UIView) {
        
    }
    
    lazy var scrollViewContent: UIScrollView = {
        let view = UIScrollView();
        view.isPagingEnabled = true;
        view.delegate = self;
        
        return view;
    }()

}
