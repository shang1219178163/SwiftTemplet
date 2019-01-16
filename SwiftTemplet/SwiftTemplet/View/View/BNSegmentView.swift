//
//  BNSegmentView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/15.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class BNSegmentView: UIView {

    /// 必须在设置type之前,type触发布局效果
    var indicatorHeight: CGFloat = 0.5
    
    private var viewBlock: ((BNSegmentView,UISegmentedControl) -> Void)?

    var type: Int = 0 {
        willSet {
            setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(segmentCtl)
        addSubview(indicator)
        
        indicator.addObserver(self, forKeyPath: "frame", options: .new, context: nil)

    }
    
    deinit {
        indicator.removeObserver(self, forKeyPath: "frame", context: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let segmentWidth = segmentCtl.bounds.width/CGFloat(segmentCtl.numberOfSegments)
        switch type {
        case 1://top
            segmentCtl.frame = CGRect(x: 0, y: indicatorHeight, width: bounds.width, height: bounds.height - indicatorHeight)
            indicator.frame = CGRect(x: segmentCtl.frame.minX, y: segmentCtl.frame.minY - indicatorHeight, width: segmentWidth, height: indicatorHeight)
            
        case 2://box
            segmentCtl.frame = bounds
            indicator.frame = CGRect(x: segmentCtl.frame.minX, y: segmentCtl.frame.minY, width: segmentWidth, height: segmentCtl.frame.height)
            
        default://bottom
            segmentCtl.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height - indicatorHeight)
            indicator.frame = CGRect(x: segmentCtl.frame.minX, y: segmentCtl.frame.maxY + indicatorHeight, width: segmentWidth, height: indicatorHeight)
            
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "frame" {
            if let rect = change![NSKeyValueChangeKey.newKey] as? CGRect {
                if rect.height == indicatorHeight {
                    indicator.backgroundColor = UIColor.theme

                } else {
                    indicator.backgroundColor = UIColor.clear
                    indicator.layer.borderColor = UIColor.theme.cgColor
                    indicator.layer.borderWidth = indicatorHeight
                }
            }
        }
    }
        
    func block(_ action: @escaping ((BNSegmentView,UISegmentedControl) -> Void)) -> Void {
        self.viewBlock = action;
    }
    
    //MARK: -lazy
    lazy var segmentCtl: UISegmentedControl = {
        var view = UIView.createSegmentRect( .zero, items: ["item0","item1","item2"], selectedIdx: 0, type: 2);
        view.addActionHandler({ (sender:UIControl) in
            
            if let control = sender as? UISegmentedControl {
//                print(control.selectedSegmentIndex)
                if self.viewBlock != nil {
                    self.viewBlock!(self,control)
                }
                
                let segmentWidth = self.segmentCtl.bounds.width/CGFloat(self.segmentCtl.numberOfSegments)
                UIView.animate(withDuration: 0.35, animations: {
                    var rect = self.indicator.frame
                    rect.origin.x = control.frame.minX + CGFloat(control.selectedSegmentIndex) * segmentWidth
                    self.indicator.frame = rect
                })
            }
        }, for: .valueChanged)
        return view
    }()
    
    lazy var indicator: UIView = {
        var view = UIView()
        
        return view
    }()
}
