//
//  UUTabBarController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/28.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand


@objc protocol OOTabBarControllerDelegate : NSObjectProtocol {
    
    @objc optional func tabBarVC(_ tabBarController: UUTabBarController, shouldSelect viewController: UIViewController) -> Bool

    @objc optional func tabBarVC(_ tabBarController: UUTabBarController, didSelect viewController: UIViewController)

    @objc optional func tabBarVC(_ tabBarController: UUTabBarController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?
    
    @objc optional func tabBarVC(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
}

/// 自定义
@objcMembers class OOTabBarController: UIViewController {
    public enum AnimateType: Int {
        case none
        case fade
        case slide
    }
    public var animateType: AnimateType = .fade

    weak var delegate: UUTabBarControllerDelegate?

    lazy var tabBar: UITabBar = {
        let tabBar = UITabBar()
        tabBar.tintColor = UIColor.systemBlue;
        tabBar.barTintColor = UIColor.white;
        tabBar.isTranslucent = false;
        
        tabBar.delegate = self
        return tabBar
    }()
    
    var viewControllers: [UIViewController]?{
        willSet{
            guard let controllers = newValue else { return }
            var tabBarItems: [UITabBarItem] = []

            for e in controllers.enumerated() {
                e.element.tabBarItem.title = e.element.title
                tabBarItems.append(e.element.tabBarItem)
                
                addControllerVC(e.element)
                e.element.view.backgroundColor = e.element.view.backgroundColor ?? UIColor.white
                e.element.view.snp.makeConstraints { (make) in
                    make.top.left.right.equalToSuperview().offset(0);
                    make.bottom.equalToSuperview().offset(-49);
                }
            }
            selectedIndex = 0
            selectedViewController = controllers[selectedIndex]
            showSubviewAtSelectedIndex(selectedIndex)

            tabBar.items = tabBarItems
            tabBar.selectedItem = tabBarItems[selectedIndex]
        }
    }
    
    var selectedViewController: UIViewController?

    var selectedIndex: Int = 0{
        willSet{
//            selectedViewController = children[newValue]
            showSubviewAtSelectedIndex(newValue)
        }
    }
    
    //MARK:属性
    lazy var itemList: [[String]] = {
        let list: [[String]] = [
            ["FirstViewController", "首页", "Item_first_N", "Item_first_H"],
            ["SecondViewController", "圈子", "Item_second_N", "Item_second_H"],
            ["ThirdViewController", "总览", "Item_third_N", "Item_third_H"],
            ["FourthViewController", "消息",  "Item_fourth_N",  "Item_fourth_H"],
            
            ];
        return list;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        setValue(tabBar, forKey: "tabBar")

        viewControllers = UICtlrListFromList(itemList, isNavController: false)
        view.addSubview(tabBar)
        
//        DDLog(view.subviews)
//        view.getViewLayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(UIScreen.tabBarHeight);
        }
    }


    // MARK: -funtions
    func showSubviewAtSelectedIndex(_ toIndex: Int) {
        guard let viewControllers = children as [UIViewController]?,
            let fromVC = selectedViewController,
            let toVC = viewControllers[toIndex] as UIViewController? else { return }
        if fromVC == toVC {
            return
        }

//        fromVC.view.alpha = 0
//        toVC.view.alpha = 1
        transition(from: fromVC, to: toVC, duration: 0.0, options: .transitionCrossDissolve, animations: {
            DDLog("__\(fromVC.controllerName):\(fromVC.view.frame)_\(toVC.controllerName):\(toVC.view.frame)")
//            fromVC.view.alpha = 1
//            toVC.view.alpha = 0
            
        }) { (finished) in
            toVC.view.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height - 49.5)

            if finished {
                self.selectedViewController = toVC
//                fromVC.view.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height - 49.5)
//                toVC.view.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height - 49.5)

            } else {
                self.selectedViewController = fromVC
            }
            self.title = self.selectedViewController?.title
        }
    }
}

extension OOTabBarController: UITabBarDelegate{
    
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        guard let viewControllers = viewControllers, let fromVC = selectedViewController else { return }
//        guard let toVC = viewControllers[toIndex] as UIViewController? else { return }
        guard let toIndex = tabBar.items?.firstIndex(of: item) else { return }
        selectedIndex = toIndex

    }
}
