//
//  HHTabBarController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/28.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

@objcMembers class HHTabBarController: UITabBarController {
    
    //MARK:属性
//    lazy var itemList: [[String]] = {
//        let list: [[String]] = [
//            ["FirstViewController", "首页", "Item_first_N", "Item_first_H"],
//            ["SecondViewController", "圈子", "Item_second_N", "Item_second_H"],
//            ["ThirdViewController", "总览", "Item_third_N", "Item_third_H"],
//            ["FourthViewController", "消息",  "Item_fourth_N",  "Item_fourth_H"],
//
//            ];
//        return list;
//    }()
    
    private lazy var animator: NNTransitionAnimator = {
        let animator = NNTransitionAnimator(duration: 0.25, animateType: .fade)
        return animator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBar.tintColor = UIColor.theme;
        tabBar.barTintColor = UIColor.white;
        tabBar.isTranslucent = false;
//        viewControllers = UICtlrListFromList(itemList, isNavController: false)

        delegate = self
        
        selectedIndex = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
        
}

extension HHTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        let fromIndex: Int = self.viewControllers!.firstIndex(of: fromVC)!
        let toIndex: Int = self.viewControllers!.firstIndex(of: toVC)!
        DDLog("\(fromIndex) -> \(toIndex)")
        animator.animateType = fromIndex < toIndex ? .right : .left
        return animator
    }

}
