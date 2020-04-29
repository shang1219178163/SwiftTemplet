//
//  HomeViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class HomeViewController: UITabBarController {
    
    
    private lazy var animator: NNTransitionAnimator = {
        let animator = NNTransitionAnimator(duration: 0.25, animateType: .fade)
        return animator
    }()
    
//    private lazy var animator: TabbarAnimator = {
//        let animator = TabbarAnimator(edge: .left)
//        return animator
//    }()
//
//    private lazy var panGesture: UIPanGestureRecognizer = {
//        let pan = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
//        return pan
//    }()
//
//    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
//        // Do not attempt to begin an interactive transition if one is already ongoing
//        guard self.transitionCoordinator == nil else {
//            return
//        }
//
//        if sender.state == .began || sender.state == .changed {
//            beginInteractiveTransitionIfPossible(sender: sender)
//        }
//    }
    
//    private func beginInteractiveTransitionIfPossible(sender: UIPanGestureRecognizer) {
//        let translation = sender.translation(in: self.view)
//
//        if translation.x > 0 && self.selectedIndex > 0 {
//            self.selectedIndex -= 1
//        } else if translation.x < 0 && self.selectedIndex + 1 < self.viewControllers!.count {
//            self.selectedIndex += 1
//        } else {
//            if !translation.equalTo(CGPoint.zero) {
//                sender.isEnabled = false
//                sender.isEnabled = true
//            }
//        }
//
//        self.transitionCoordinator?.animate(alongsideTransition: nil, completion: { (context) in
//            if context.isCancelled && sender.state == .changed {
//                self.beginInteractiveTransitionIfPossible(sender: sender)
//            }
//        })
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBar.tintColor = UIColor.theme;
        tabBar.barTintColor = UIColor.white;
        tabBar.isTranslucent = false;
        viewControllers = UINavListFromList(itemList);

//        delegate = self
//        view.addGestureRecognizer(self.panGesture)
        
        selectedIndex = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
//        configureCenterBtn();
    }
    
    func configureCenterBtn() {
        tabBar.addSubview(btnCenter);
        
        let width = tabBar.bounds.width / CGFloat(viewControllers!.count);
        let rect = CGRect(x: 0, y: 0, width: width, height:tabBar.bounds.height);
        btnCenter.frame = rect.offsetBy(dx: width*2, dy: 0);
        
    }
    
    @objc func handleActionSender(_ sender:UIButton){
        let navController = UINavigationController(rootViewController: CenterViewController());
        self.present(navController, animated: true, completion: nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Delegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        DDLog(tabBar.selectedItem as Any);
        
    }
    
    //MARK:属性
    let itemList:Array = { () -> Array<[String]> in
        let list:Array = [
            ["FirstViewController", "首页", "Item_first_N", "Item_first_H"],
            ["SecondViewController", "圈子", "Item_second_N", "Item_second_H"],
//            ["CenterViewController", "总览",  "Item_center_N",  "Item_center_H"],
            ["ThirdViewController", "总览", "Item_third_N", "Item_third_H"],
            ["FourthViewController", "消息",  "Item_fourth_N",  "Item_fourth_H"],
//            ["FifthViewControlle", "我的",  "Item_center_N",  "Item_center_H"],
//            ["TmpViewController", "我的",  "Item_center_N",  "Item_center_H"],
//            ["CCSCouponRecordController", "我的",  "Item_center_N",  "Item_center_H"],
//            ["TestViewController", "测试",  "Item_center_N",  "Item_center_H"],
            ["TitleViewController", "测试",  "Item_center_N",  "Item_center_H"],
            
            ];
        return list;
    }();
    
    lazy var btnCenter : UIButton = {
        let btn = UIButton();
        btn.backgroundColor = UIColor.theme;
        btn.setImage(UIImage(named: "tabbar_add"), for:.normal);
        btn.addTarget(self, action: #selector(handleActionSender(_:)), for: .touchUpInside);
        
        return btn;
    }();
}

extension HomeViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        let fromIndex: Int = self.viewControllers!.firstIndex(of: fromVC)!
        let toIndex: Int = self.viewControllers!.firstIndex(of: toVC)!
        DDLog("\(fromIndex) -> \(toIndex)")
//        animator.targetEdge = fromIndex < toIndex ? .right : .left
        animator.animateType = fromIndex < toIndex ? .right : .left
        return animator
    }

//    func tabBarController(_ tabBarController: UITabBarController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        if self.panGesture.state == .began || self.panGesture.state == .changed {
//            return TabbarInteractionTransition(pan: self.panGesture)
//        } else {
//            return nil
//        }
//    }
}
