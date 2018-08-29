//
//  MyView.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/16.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

typealias MyBlock = (_ message:UIViewController)->(Void);

class MyView: UIView {

    var mblock:MyBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        
        self.backgroundColor = UIColor.purple;
        
        let tap = UITapGestureRecognizer(target: self, action:#selector(buttonClick));
        self.isUserInteractionEnabled = true;
        
        self.addGestureRecognizer(tap);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")

    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
    }
    
    //假装我有一个button添加了点击事件
    @objc func buttonClick(){
        if mblock != nil{
            mblock!(CenterViewController());
            
        }
    }

}
