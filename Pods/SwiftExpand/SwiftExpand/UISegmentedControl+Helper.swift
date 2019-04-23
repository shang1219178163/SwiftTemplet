//
//  UISegmentedControl+Helper.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2019/1/9.
//

import UIKit

extension UISegmentedControl{
    
    /// 控件items
    @objc public var itemList: Array<String> {
        get {
            return objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as! Array<String>
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            
            p_handleSegmentItems(newValue);
        }
    }
    
    /// 配置新item数组
    private func p_handleSegmentItems(_ itemList: Array<String>) -> Void{
        if itemList.count == 0 {
            return
        }
        
        if itemList.count <= numberOfSegments {
            for e in itemList.enumerated() {
                if e.offset < itemList.count {
                    setTitle(e.element, forSegmentAt: e.offset)
                    
                } else {
                    removeSegment(at: e.offset, animated: false)
                    
                }
            }
        } else {
            for e in itemList.enumerated() {
                if e.offset < numberOfSegments {
                    setTitle(e.element, forSegmentAt: e.offset)
                    
                } else {
                    insertSegment(withTitle: e.element, at: e.offset, animated: false)
                    
                }
            }
        }
        selectedSegmentIndex = 0
    }
    
}
