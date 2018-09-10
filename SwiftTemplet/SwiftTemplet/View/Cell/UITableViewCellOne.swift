
//
//  UITableViewCellOne.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/29.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

class UITableViewCellOne: UITableViewCell {

    var type = 0;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
       
        //图片+文字+文字+图片
        contentView.addSubview(imgViewLeft);
        contentView.addSubview(imgViewRight);
        
        contentView.addSubview(labelLeft);
        contentView.addSubview(labelRight);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        imgViewRight.frame = CGRect(x: (width - kSize_Arrow.width - kX_GAP), y: (height - kSize_Arrow.height)/2.0, width: kSize_Arrow.width, height: kSize_Arrow.height);
        
        if imgViewLeft.image != nil {
            imgViewLeft.frame = CGRect(x: kX_GAP, y: kY_GAP, width: height - kY_GAP*2, height: height - kY_GAP*2);
        }
        
        if type == 0 {
            let labRightSize = sizeWithText(text: labelRight.text as AnyObject, font: labelRight.font, width: kScreen_width);
            
            let X_right = imgViewRight.isHidden == false ? imgViewRight.frame.minX - kPadding - labRightSize.width : width - kX_GAP - labRightSize.width;
            labelRight.frame = CGRect(x: X_right, y: imgViewRight.frame.minY, width: labRightSize.width, height: imgViewRight.frame.height);
            
            if imgViewLeft.image != nil {
                labelLeft.frame = CGRect(x: imgViewLeft.frame.maxX + kPadding, y: imgViewRight.frame.minY, width: labelRight.frame.minX - imgViewLeft.frame.maxX - kPadding*2, height: imgViewRight.frame.height);
                
            }
            else{
                labelLeft.frame = CGRect(x: kX_GAP, y: imgViewRight.frame.minY, width: labelRight.frame.minX - kPadding - kX_GAP, height: imgViewRight.frame.height)
                
            }
            
        }
        else{
            let labSize = sizeWithText(text: labelLeft.text as AnyObject, font: labelLeft.font, width: kScreen_width);
            
            let X_left = imgViewLeft.image != nil ? imgViewLeft.frame.maxX + kPadding : kX_GAP;
            
            labelLeft.frame = CGRect(x: X_left, y: imgViewRight.frame.minY, width: labSize.width, height: imgViewRight.frame.height);
            
            let w_maxRight = imgViewRight.isHidden == false ? imgViewRight.frame.minX : width;
            labelRight.frame = CGRect(x: labelLeft.frame.maxX + kPadding, y: imgViewRight.frame.minY, width: w_maxRight - kPadding - kX_GAP - labelLeft.frame.maxX, height: imgViewRight.frame.height);
            
            
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
