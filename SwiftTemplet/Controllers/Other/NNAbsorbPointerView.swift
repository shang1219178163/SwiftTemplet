//
//  NNAbsorbPointerView.swift
//  SwiftTemplet
//
//  Created by shangbinbin on 2023/4/3.
//  Copyright © 2023 BN. All rights reserved.
//

import UIKit

class NNAbsorbPointerView: UIView {
    /// 是否拦截响应
    var absorbing = false;

    // MARK: - 重写加载方法
    override init(frame: CGRect) {
        super.init(frame: frame);

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if absorbing {
            return self
        }
        // 1.判断能不能处理事件
        if isUserInteractionEnabled == false, isHidden, alpha <= 0.01 {
            return nil
        }
        
        // 2.判断点在不在当前控件上
        if self.point(inside: point, with: event) == false {
            return nil;
        }
        
        for subView in subviews.reversed() {
            let subPoint = self.convert(point, to: subView);
            if let targetView = subView.hitTest(subPoint, with: event) {
                return targetView;
            }
        }
        return self
    }
    
    /**
     *  hitTest的作用：用来找到最合适的view
     *  hitTest什么时候调用：当触摸事件传递给一个控件的时候，就会调用hitTest寻找最合适的view处理事件
     *  @param point 以方法调用者视图为坐标系的触摸点，方便判断点在不在视图上
     *  @param event 触摸事件
     *
     *  @return 返回最合适的view
     */
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        // 1.判断能不能处理事件
//        if isUserInteractionEnabled == false, isHidden, alpha <= 0.01 {
//            return nil
//        }
//
//        // 2.判断点在不在当前控件上
//        if self.point(inside: point, with: event) == false {
//            return nil;
//        }
//
//        for subView in subviews.reversed() {
//            let subPoint = self.convert(point, to: subView);
//            if let targetView = subView.hitTest(subPoint, with: event) {
//                return targetView;
//            }
//        }
//        return self
//    }
    
    // MARK: - 私有方法
    

}
