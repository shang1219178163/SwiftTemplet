

//
//  UITextField+Helper.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/9/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

extension UITextField{
    
    //    MARK: - -TextFieldRightView
    func asoryView(_ isRight: Bool, unitName: String!, viewSize:CGSize) -> UIView! {
        
        assert(unitName != nil && unitName.valid() == true);
        
        if unitName.contains("img") {
            let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height));
            imgView.image = UIImage(named: unitName);
            imgView.tag = kTAG_IMGVIEW;
            return imgView;
        }
       
        let size = self.sizeWithText(text: unitName as AnyObject, font: self.font!, width: kScreenWidth);
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: viewSize.height));
        label.tag = kTAG_LABEL;
        label.text = unitName;
        label.font = UIFont.systemFont(ofSize: 15);
        label.textAlignment = .center;
        label.lineBreakMode = .byCharWrapping;
        label.numberOfLines = 0;
        label.backgroundColor = .clear;
        
        return label;
     
    }
    
    func asoryView(_ isRight: Bool, unitName: String!) -> Void {
        if isRight == true {
            self.rightView = self.asoryView(isRight, unitName: unitName, viewSize: kSize_Arrow);
            self.rightViewMode = .always;

        }
        else{
            self.leftView = self.asoryView(isRight, unitName: unitName, viewSize: kSize_Arrow);
            self.leftViewMode = .always;

        }
    }
}
