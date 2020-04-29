//
//  HHTabBarOneController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/28.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class HHTabBarOneController: UITabBarController {
    
    //MARK:属性
    lazy var itemList: [[String]] = {
        let list: [[String]] = [
            ["FirstViewController", "首页", "Item_first_N", "Item_first_H"],
            ["ThirdViewController", "总览", "Item_third_N", "Item_third_H"],
            ["TitleViewController", "测试",  "Item_center_N",  "Item_center_H"],
            
            ];
        return list;
    }()
    
    lazy var segmentCtl: NNSegmentedControl = {
        let rect = CGRectMake(0, 0, 240, 44)
        let view = NNSegmentedControl(frame: rect)
        view.showStyle = .bottomLine
        view.normalColor = .gray
        view.selectedColor = .systemBlue
        view.itemList = ["过去", "现在", "将来"]
        view.addTarget(self, action: #selector(handleValueChange(_:)), for: .valueChanged)
        return view;
    }()
    
    private lazy var animator: NNTransitionAnimator = {
        let animator = NNTransitionAnimator(duration: 0.25, animateType: .fade)
        return animator
    }()
    
    var isTabBarStyle: Bool = false
    
    public enum AnimateType: Int {
        case none
        case fade
        case slide
    }
    public var animateType: AnimateType = .slide
    public var animateDuration: TimeInterval = 0.35
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBar.tintColor = UIColor.theme;
        tabBar.barTintColor = UIColor.white;
        tabBar.isTranslucent = false;
        viewControllers = UICtlrListFromList(itemList, isNavController: false)

//        delegate = self
        view.addSubview(segmentCtl)
        
        selectedIndex = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        segmentCtl.isHidden = isTabBarStyle
        tabBar.isHidden = !isTabBarStyle
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if isTabBarStyle == true {
            return
        }
        
        segmentCtl.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.height.equalTo(50)
        }
        for e in children.enumerated() {
            view.addSubview(e.element.view)
            e.element.view.backgroundColor = e.element.view.backgroundColor ?? UIColor.white
            e.element.view.snp.makeConstraints { (make) in
                make.top.equalTo(segmentCtl.snp.bottom).offset(0);
                make.left.right.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(0);
            }
        }
    }
    
    @objc func handleValueChange(_ sender: UISegmentedControl) {
//        selectedIndex = sender.selectedSegmentIndex
        showSubviewAtSelectedIndex(sender.selectedSegmentIndex)

//        guard let selectedViewController = selectedViewController,
//            let viewControllers = viewControllers,
//            let toVC = viewControllers[selectedIndex] as UIViewController? else { return }
//
//        addControllerVC(selectedViewController)
//        addControllerVC(toVC)
//        DDLog(children)
    }
    
    // MARK: -funtions
    func showSubviewAtSelectedIndex(_ toIndex: Int) {
        guard let viewControllers = children as [UIViewController]?,
            let fromVC = selectedViewController,
            let toVC = viewControllers[toIndex] as UIViewController? else { return }
        if fromVC == toVC {
            DDLog("目前就是\(toVC)")
            return
        }
        
//        if let value = delegate?.tabBarVC?(self, shouldSelect: toVC), value == false {
//            return
//        }
        view.bringSubviewToFront(toVC.view)
        view.subviews.filter { $0.sizeHeight > 300 }.forEach { $0.isHidden = ($0 != toVC.view) }

        transitionViewAnimate(fromVC, toVC: toVC, type: self.animateType, inAnimationBlock: false)
        UIView.animate(withDuration: animateDuration, animations: {
            self.transitionViewAnimate(fromVC, toVC: toVC, type: self.animateType, inAnimationBlock: true)
            
        }) { (finished) in
            if finished {
                self.selectedViewController = toVC

            } else {
                self.selectedViewController = fromVC
            }
            self.title = self.selectedViewController?.title
        }
//        delegate?.tabBarVC?(self, didSelect: toVC)
    }
    
    func transitionViewAnimate(_ fromVC: UIViewController, toVC: UIViewController, type: AnimateType, inAnimationBlock: Bool) {
        guard let fromIndex = children.firstIndex(of: fromVC), let toIndex = children.firstIndex(of: toVC) else { return }
        switch type {
        case .fade:
            if inAnimationBlock {
                fromVC.view.alpha = 0
                toVC.view.alpha = 1
            } else {
                fromVC.view.alpha = 1
                toVC.view.alpha = 0
            }
            
        case .slide:
            
            if fromIndex == toIndex {
                return
            }
            let fromViewFrame: CGRect = fromVC.view.frame
            let toViewFrame: CGRect = toVC.view.frame
//            DDLog("fromViewFrame:\(fromViewFrame)_toViewFrame:\(toViewFrame)")

            let dx = (fromIndex < toIndex) ? -1.0 : 1.0
            let offset: CGVector = CGVector(dx: dx, dy: 0)
            if inAnimationBlock == false {
//                fromVC.view.frame = fromViewFrame.offsetBy(dx: view.frame.size.width * offset.dx * -1, dy: 0)
                toVC.view.frame = toViewFrame
            } else {
//                fromVC.view.frame = fromViewFrame
                toVC.view.frame = toViewFrame.offsetBy(dx: view.frame.size.width * offset.dx, dy: 0)
            }
            
        default:
            break
        }
//        DDLog("__\(inAnimationBlock)_\(fromVC.controllerName):\(fromVC.view.frame)_\(toVC.controllerName):\(toVC.view.frame)")
    }

        
}

//extension HHTabBarOneController: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//
//        let fromIndex: Int = self.viewControllers!.firstIndex(of: fromVC)!
//        let toIndex: Int = self.viewControllers!.firstIndex(of: toVC)!
//        DDLog("\(fromIndex) -> \(toIndex)")
//        animator.animateType = fromIndex < toIndex ? .right : .left
//        return animator
//    }
//
//}
