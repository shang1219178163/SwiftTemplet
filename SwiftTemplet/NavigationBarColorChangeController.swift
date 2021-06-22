//
//  NavigationColorBarChangeController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/17.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class NavigationBarColorChangeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let barItems: [UIBarButtonItem] = ["测试", "按钮"]
            .enumerated()
            .map {
                let sender = UIBarButtonItem(title: $0.element, style: .plain, target: self, action: #selector(actionitem(_:)))
                sender.tag = $0.offset
                return sender
        }
        navigationItem.rightBarButtonItems = barItems
        
        view.backgroundColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        actionitem(UIBarButtonItem())
    }
    
    @objc func actionitem(_ sender: UIBarButtonItem) {
        print(sender.tag as Any)
        
        
        switch sender.tag {
        case 0:
            let randomColor = UIColor.white
            test(randomColor)
        default:
            let randomColor = UIColor.random
            test(randomColor)
        }

    }
    
    
    func test(_ background: UIColor) {
        navigationController?.navigationBar.barTintColor = background
//        navigationController?.navigationBar.setBackgroundImage(UIImage(color: background), for: .default)
        
//        let barTintColor = navigationController?.navigationBar.barTintColor
//        let isLightColor = barTintColor == nil || !barTintColor!.isDark
//        let textColor = isLightColor ? UIColor.black : UIColor.white
//
//        navigationController?.navigationBar.tintColor = textColor
//        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: textColor]
        
        navigationController?.navigationBar.followBarTintColor()
    }


}


extension UINavigationBar{
    
    ///通过判断 barTintColor 颜色深浅调整字体颜色(黑色/白色)
    func followBarTintColor() {
        guard let barTintColor = barTintColor else {
            tintColor = .black
            titleTextAttributes = [.foregroundColor: UIColor.black]
            return }
        
        setBackgroundImage(UIImage(color: barTintColor), for: .default)
        
        let textColor = !barTintColor.isDark ? UIColor.black : UIColor.white
        tintColor = textColor
        titleTextAttributes = [.foregroundColor: textColor]
    }
}
