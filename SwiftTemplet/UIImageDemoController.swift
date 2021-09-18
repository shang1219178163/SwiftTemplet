//
//  UIImageDemoController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/9/9.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKit


class UIImageDemoController: UIViewController {
    
    
    let image = UIImage(named: "icon_notice_blue")!

    let videoPlayImage = UIImage(named: "icon_video_play")!
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItems = ["合并", "还原"].map({
            return UIBarButtonItem(obj: $0) { item in
                if item.title == "合并" {
//                    self.imageView.image = combine(image: self.image, aImage: self.videoPlayImage)
                    self.imageView.image = self.image.combine(image: self.videoPlayImage)

                } else {
                    self.imageView.image = self.image
                }
            }
        })

        view.addSubview(imageView)
        imageView.image = self.image
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DDLog(self.videoPlayImage.size)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }

}

extension UIImage {

}

// 1.把两张图片绘制成一张图片
func combine(image: UIImage, aImage: UIImage) -> UIImage {

    // 1.1.获取第一张图片的宽度
    let width = max(image.size.width, aImage.size.width)
    // 1.2.获取第一张图片的高度
    let height = max(image.size.height, aImage.size.height)

    // 1.3.开始绘制图片的大小
    UIGraphicsBeginImageContext(CGSize(width: width, height: height))
    // 1.4.绘制第一张图片的起始点
    image.draw(at: CGPoint(x: width*0.5, y: height*0.5))
    image.draw(at: CGPoint(x: width*0.5, y: height*0.5))
    // 1.5.绘制第二章图片的起始点
    aImage.draw(at: CGPoint(x: 0, y: 0))

    // 1.6.获取已经绘制好的
    let imageLong = UIGraphicsGetImageFromCurrentImageContext()!
    // 1.7.结束绘制
    UIGraphicsEndImageContext()

    // 1.8.返回已经绘制好的图片
    return imageLong
}


// 1.把两张图片绘制成一张图片
//func combine(leftImage: UIImage, rightImage: UIImage) -> UIImage {
//
//    // 1.1.获取第一张图片的宽度
//    let width = leftImage.size.width
//    // 1.2.获取第一张图片的高度
//    let height = leftImage.size.height + rightImage.size.height
//
//    // 1.3.开始绘制图片的大小
//    UIGraphicsBeginImageContext(CGSize(width: width, height: height))
//    // 1.4.绘制第一张图片的起始点
//    leftImage.draw(at: CGPoint(x: 0, y: 0))
//    // 1.5.绘制第二章图片的起始点
//    rightImage.draw(at: CGPoint(x: 0, y: leftImage.size.height + 5))
//
//    // 1.6.获取已经绘制好的
//    let imageLong = UIGraphicsGetImageFromCurrentImageContext()!
//    // 1.7.结束绘制
//    UIGraphicsEndImageContext()
//
//    // 1.8.返回已经绘制好的图片
//    return imageLong
//}
