//
//  UUSementedController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/29.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand


@objc protocol UUSementedControllerDelegate : NSObjectProtocol {
    @objc optional func sementedVC(_ tabBarController: UUSementedController, shouldSelect viewController: UIViewController) -> Bool
    @objc optional func sementedVC(_ tabBarController: UUSementedController, didSelect viewController: UIViewController)
}

/// 自定义
@objcMembers class UUSementedController: UIViewController {
    public enum AnimateType: Int {
        case none
        case fade
        case slide
    }
    public var animateType: AnimateType = .fade
    public var animateDuration: TimeInterval = 0.35

    weak var delegate: UUSementedControllerDelegate?

    lazy var segmentCtl: NNSegmentedControl = {
        let rect = CGRectMake(0, 0, self.view.bounds.width, 44)
        let view = NNSegmentedControl(frame: rect)
        view.showStyle = .bottomLine
        view.normalColor = .gray
        view.selectedColor = .systemBlue
        view.itemList = ["过去", "现在", "将来"]
        view.addTarget(self, action: #selector(handleValueChange(_:)), for: .valueChanged)
        return view;
    }()
    
    var viewControllers: [UIViewController]?{
        willSet{
            guard let controllers = newValue else { return }
            for e in children.enumerated() {
                removeControllerVC(e.element)
            }

            for e in controllers.enumerated() {

                addControllerVC(e.element)
                e.element.view.backgroundColor = e.element.view.backgroundColor ?? UIColor.white
                e.element.view.snp.makeConstraints { (make) in
                    make.top.equalToSuperview().offset(segmentCtl.bounds.height);
                    make.left.right.equalToSuperview().offset(0);
                    make.bottom.equalToSuperview().offset(0);
                }
            }
            selectedIndex = 0
            selectedViewController = controllers[selectedIndex]
            showSubviewAtSelectedIndex(selectedIndex)
        }
    }
    
    var selectedViewController: UIViewController?

    var selectedIndex: Int = 0{
        willSet{
            showSubviewAtSelectedIndex(newValue)
        }
    }
    
    //MARK:属性
//    lazy var itemList: [[String]] = {
//        let list: [[String]] = [
//            ["FirstViewController", "首页", "Item_first_N", "Item_first_H"],
//            ["SecondViewController", "圈子", "Item_second_N", "Item_second_H"],
//            ["ThirdViewController", "总览", "Item_third_N", "Item_third_H"],
//            ["FourthViewController", "消息",  "Item_fourth_N",  "Item_fourth_H"],
//            ["TitleViewController", "测试",  "Item_center_N",  "Item_center_H"],
//
//            ];
//        return list;
//    }()
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        viewControllers = UICtlrListFromList(itemList, isNavController: false)
        view.addSubview(segmentCtl)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }


    // MARK: -funtions
    @objc func handleValueChange(_ sender: UISegmentedControl) {
        showSubviewAtSelectedIndex(sender.selectedSegmentIndex)

    }
    
    func showSubviewAtSelectedIndex(_ toIndex: Int) {
        guard let viewControllers = children as [UIViewController]?,
            let fromVC = selectedViewController,
            let toVC = viewControllers[toIndex] as UIViewController? else { return }
        if fromVC == toVC {
            DDLog("目前就是\(toVC)")
            return
        }
        
        if let value = delegate?.sementedVC?(self, shouldSelect: toVC), value == false {
            return
        }
                
        view.bringSubviewToFront(toVC.view)
        
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
        delegate?.sementedVC?(self, didSelect: toVC)
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
//            let fromViewFrame: CGRect = fromVC.view.frame
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

