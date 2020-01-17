//
//  UIStackViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/26.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

/// textView.isScrollEnabled = false
class UIStackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let images = [UIImage(named: "Skull.jpg"), UIImage(named: "Skull.jpg"), UIImage(named: "Skull.jpg")]
        for image in images {
            //创建并添加内部视图
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            stackView.addArrangedSubview(imageView)
        }
         
        //将StackView添加到主视图中
        view.addSubview(stackView)
        
        view.addGestureTap { (reco) in
            self.dismiss(animated: true, completion: nil)
        }

        view.getViewLayer()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
         
        let padding: CGFloat = 10
         
        //横竖屏判断
        let orientation = UIApplication.shared.statusBarOrientation
        //如果是竖屏
        if orientation.isPortrait {
            stackView.frame = CGRect(x: padding,
                                     y: 64 + padding,
                                     width: view.frame.width - padding * 2,
                                     height: view.frame.height - 64 - padding * 2)
//            //内部视图垂直排列
//            stackView.axis = .vertical
        }
        //如果是横屏
        else {
            stackView.frame = CGRect(x: padding,
                                     y: 32 + padding,
                                     width: view.frame.width - padding * 2,
                                     height: view.frame.height - 32 - padding * 2)
//            //内部视图水平排列
//            stackView.axis = .horizontal
        }
        //内部视图水平排列
        stackView.axis = .vertical
        stackView.setSubViewMultiplier(0.1, at: 0)
        stackView.setSubViewMultiplier(0.1, at: 1)

    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        let padding: CGFloat = 10
//
//        //横竖屏判断
//        let orientation = UIApplication.shared.statusBarOrientation
//        //如果是竖屏
//        if orientation.isPortrait {
//            stackView.frame = CGRect(x: padding,
//                                     y: 64 + padding,
//                                     width: view.frame.width - padding * 2,
//                                     height: view.frame.height - 64 - padding * 2)
////            //内部视图垂直排列
////            stackView.axis = .vertical
//        }
//        //如果是横屏
//        else {
//            stackView.frame = CGRect(x: padding,
//                                     y: 32 + padding,
//                                     width: view.frame.width - padding * 2,
//                                     height: view.frame.height - 32 - padding * 2)
////            //内部视图水平排列
////            stackView.axis = .horizontal
//        }
//        //内部视图水平排列
//        stackView.axis = .vertical
//        stackView.setSubViewMultiplier(0.1, at: 0)
//        stackView.setSubViewMultiplier(0.1, at: 1)
//
//    }
    
    lazy var stackView: UIStackView = {
        //创建StackView
        let stackView = UIStackView()
        //设置子视图间隔
        stackView.spacing = 10
        //子视图的高度或宽度保持一致
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = UIColor.lightBlue

        return stackView;
    }()

  
}
