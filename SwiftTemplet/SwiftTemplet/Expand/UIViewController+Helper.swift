

//
//  UIViewController+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/5/16.
//  Copyright © 2018年 BN. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    
    
    func createBarItem(titile:String, imgName:AnyObject?, isLeft:Bool, isHidden:Bool, target:AnyObject, action:Selector) -> UIButton {
        
//        var imageName : String = (imgName as? String)!;
        
//        assert(imgName?.isEmpty == true, "无效的图片名称");
        let image = UIImage(named: imgName as! String)?.withRenderingMode(.alwaysOriginal);
        
        let btn = UIButton();
        if image != nil  {
            btn.setImage(image, for: UIControlState.normal);
            
        }else{
            if titile.isEmpty == false{
                btn.setTitle(titile, for: UIControlState.normal);
                if titile.count == 4{
                    btn.titleLabel?.adjustsFontSizeToFitWidth = true;
                    btn.titleLabel?.minimumScaleFactor = 1;
                    
                }
            }
        }
        btn.addTarget(target, action:action, for: UIControlEvents.touchUpInside);
        btn.sizeToFit();
        btn.isHidden = isHidden;
        
        if isLeft == true {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn);
        }else{
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn);

        }
        
        return btn;
    }
    
    
//    func createBarItem(titile:String, imgName:AnyObject?, isLeft:Bool, isHidden:Bool, handler:void(^)(id obj, id item, NSInteger idx)handler) -> UIButton {
//
//        //        var imageName : String = (imgName as? String)!;
//
//        //        assert(imgName?.isEmpty == true, "无效的图片名称");
//        let image = UIImage(named: imgName as! String)?.withRenderingMode(.alwaysOriginal);
//
//        let btn = UIButton();
//        if image != nil  {
//            btn.setImage(image, for: UIControlState.normal);
//
//        }else{
//            if titile.isEmpty == false{
//                btn.setTitle(titile, for: UIControlState.normal);
//                if titile.count == 4{
//                    btn.titleLabel?.adjustsFontSizeToFitWidth = true;
//                    btn.titleLabel?.minimumScaleFactor = 1;
//
//                }
//            }
//        }
////        btn.addTarget(self, action:self, for: UIControlEvents.touchUpInside);
//        btn.sizeToFit();
//        btn.isHidden = isHidden;
//
//        if isLeft == true {
//            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn);
//        }else{
//            self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn);
//
//        }
//
//        return btn;
//    }
    

    
    /**
     关联方法待改进
     */
//    - (void)handleActionBtn:(id)sender{
//    
//    if ([sender isKindOfClass:[UISegmentedControl class]]) {
//    UISegmentedControl * segmentCtl = sender;
//    if (block) block(sender, sender, segmentCtl.selectedSegmentIndex);
//    
//    }else{
//    if (block) block(sender, sender, ((UIButton *)sender).tag - kTAG_VIEW);
//    
//    }
//    }
//    
//    /**
//     关联方法待改进
//     */
//    - (void)handleActionTapGesture:(UITapGestureRecognizer *)tapGesture{
//    void(^block)(id obj, id item, NSInteger idx) = objc_getAssociatedObject(self, @selector(addActionHandler:));
//    if (block){
//    block(tapGesture, tapGesture.view, tapGesture.view.tag - kTAG_VIEW);
//    
//    }
//    }

    
}


