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
        
    private lazy var manager = NNGuidePageManager()
    
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
//
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
    
    //MARK:属性
    lazy var items: [(UIViewController, String, UIImage?, UIImage?)] = {
        return [
            (FirstViewController(), "首页", UIImage(named: "Item_first_N"), UIImage(named: "Item_first_H")),
//            (SecondViewController(), "圈子", UIImage(named: "Item_second_N"), UIImage(named: "Item_second_H")),
//            (CenterViewController(), "总览", UIImage(named: "Item_center_N"), UIImage(named: "Item_center_H")),
            (ThirdViewController(), "总览", UIImage(named: "Item_third_N"), UIImage(named: "Item_third_H")),
//            (FourthViewController(), "消息", UIImage(named: "Item_fourth_N"), UIImage(named: "Item_fourth_H")),
//            (FifthViewControlle(), "我的", UIImage(named: "Item_center_N"), UIImage(named: "Item_center_H")),
//            (TestViewController()", "测试", UIImage(named: "Item_center_N"), UIImage(named: "Item_center_H")),
            (TitleViewController(), "TitleView", UIImage(named: "Item_center_N"), UIImage(named: "Item_center_H")),
//            (KVOViewController(), "测试", UIImage(named: "Item_center_N"), UIImage(named: "Item_center_H")),
            (PKFuntionListController(), "KOP", UIImage(named: "Item_center_N"), UIImage(named: "Item_center_H")),
//            (IOPFuntionListController(), "IOP", UIImage(named: "Item_center_N"), UIImage(named: "Item_center_H")),
            
            (FourthViewController(), "IOP", UIImage(named: "Item_center_N"), UIImage(named: "Item_center_H")),
//            (SystemIconDisplayController(), "SystemIcon", UIImage(named: "Item_center_N"), UIImage(named: "Item_center_H")),
            
        ];
    }()
    
    lazy var btnCenter: UIButton = {
        let btn = UIButton();
        btn.backgroundColor = UIColor.theme;
        btn.setImage(UIImage(named: "tabbar_add"), for:.normal);
        btn.addTarget(self, action: #selector(handleActionSender(_:)), for: .touchUpInside);
        
        return btn;
    }();
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBar.tintColor = UIColor.theme;
        tabBar.barTintColor = UIColor.white;
        tabBar.isTranslucent = false;

        viewControllers = items.map({ (vc, title, image, imageH) -> UIViewController in
            let ctrl = vc.isKind(of: UINavigationController.self) ? vc : UINavigationController(rootViewController: vc)
//            self.setupBackItem(ctrl)
            ctrl.reloadTabarItem((title, image, imageH))
            return ctrl
        })

//        delegate = self
//        view.addGestureRecognizer(panGesture)
        
//        selectedIndex = 2
        selectedIndex = items.count - 1
        selectedIndex = 0
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
//        configureCenterBtn();        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        manager.showGuideView()
    }
    
    func configureCenterBtn() {
        tabBar.addSubview(btnCenter);
        
        let width = tabBar.bounds.width / CGFloat(viewControllers!.count);
        let rect = CGRect(x: 0, y: 0, width: width, height:tabBar.bounds.height);
        btnCenter.frame = rect.offsetBy(dx: width*2, dy: 0);
    }
    
    @objc func handleActionSender(_ sender: UIButton){
        let navController = UINavigationController(rootViewController: CenterViewController());
        self.present(navController, animated: true, completion: nil);
    }
    
    func setupBackItem(_ vc: UIViewController){
        guard let navigationController = vc as? UINavigationController else { return }
        navigationController.navigationBar.backIndicatorImage = UIImage()
        navigationController.navigationBar.backIndicatorTransitionMaskImage = UIImage()
    //图标会偏左一点点
        navigationController.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_arowLeft_black"), style: .plain, target: nil, action: nil)
    //定制图标: 在图标左边添加一点空白
        navigationController.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_back_Customization")?.withRenderingMode(.alwaysOriginal), style: .plain, target: nil, action: nil)
    
        navigationController.navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_arowLeft_black"), style: .plain, target: nil, action: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Delegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        DDLog(tabBar.selectedItem);
        
    }
    

}

//extension HomeViewController: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//
//        let fromIndex: Int = self.viewControllers!.firstIndex(of: fromVC)!
//        let toIndex: Int = self.viewControllers!.firstIndex(of: toVC)!
//        DDLog("\(fromIndex) -> \(toIndex)")
//        animator.animateType = fromIndex < toIndex ? .right : .left
//        return animator
//    }
//
////    func tabBarController(_ tabBarController: UITabBarController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
////        if self.panGesture.state == .began || self.panGesture.state == .changed {
////            return TabbarInteractionTransition(pan: self.panGesture)
////        } else {
////            return nil
////        }
////    }
//}
