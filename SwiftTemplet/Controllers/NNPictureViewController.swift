//
//  NNPictureViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/2/29.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class NNPictureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let urlArray = ["http://upload-images.jianshu.io/upload_images/1714291-6c664d526b380115.jpg",                        "http://img.parkingwang.com/6100000074/629906_1.jpg",                            "http://upload-images.jianshu.io/upload_images/3580598-482508548410c111.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
        
        let rect = CGRect(x: 20, y: 20, width: kScreenWidth - 40.0, height: (kScreenWidth - 40.0)/urlArray.count.toCGFloat)
        
        let photosView = createGroupView(rect, list: urlArray, numberOfRow: 3, padding: 10, type: 1) { (tap, itemView, idx) in
            DDLog(idx)
            let value = urlArray[idx];
//            (itemView as! UIImageView).sd_setImage(with: URL(string: value), placeholderImage: UIImageNamed("img_failedDefault_S"))

//            (itemView as! UIImageView).showImageEnlarge()
            (itemView as! UIImageView).showPictureView(urlArray, index: itemView.tag)

        }
        view.addSubview(photosView)
        
        view.getViewLayer()
    }
    
    /// [源]GroupView创建
    func createGroupView(_ rect: CGRect = CGRect.zero, list: [String], numberOfRow: Int = 4, padding: CGFloat = kPadding, type: Int = 0, action: ((UITapGestureRecognizer?, UIView, NSInteger)->Void)? = nil) -> UIView {
        
        let rowCount: Int = list.count % numberOfRow == 0 ? list.count/numberOfRow : list.count/numberOfRow + 1;
        let itemWidth = (rect.width - CGFloat(numberOfRow - 1)*padding)/CGFloat(numberOfRow)
        let itemHeight = (rect.height - CGFloat(rowCount - 1)*padding)/CGFloat(rowCount)
        
        let backView = UIView(frame: rect);
        backView.backgroundColor = UIColor.white
        
        for (i,value) in list.enumerated() {
            let x = CGFloat(i % numberOfRow) * (itemWidth + padding);
            let y = CGFloat(i / numberOfRow) * (itemHeight + padding);
            let rect = CGRect(x: x, y: y, width: itemWidth, height: itemHeight);
            
            let imgView = UIImageView(frame: rect);
            imgView.isUserInteractionEnabled = true;
            imgView.contentMode = .scaleAspectFit;
            imgView.image = UIImage(named: value);
            imgView.tag = i;
//            DDLog(value)
            imgView.sd_setImage(with: URL(string: value), placeholderImage: UIImageNamed("img_failedDefault_S"))

            if action != nil {
                imgView.addActionClosure(action!)
            }
            backView.addSubview(imgView);
        }
        return backView;
    }


}
