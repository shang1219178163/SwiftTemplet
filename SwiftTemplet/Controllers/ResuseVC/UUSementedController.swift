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
    @objc optional func sementedVC(_ controller: UUSementedController, didSelect viewController: UIViewController)
}

/// 自定义
@objcMembers class UUSementedController: UIViewController {
    public enum AnimateType: Int {
        case none
        case fade
        case slide
    }
    public var animateType: AnimateType = .none
    public var animateDuration: TimeInterval = 0.35

    weak var delegate: UUSementedControllerDelegate?

    lazy var segmentCtl: NNSegmentedControl = {
        let rect = CGRect(0, 0, self.view.bounds.width, 44)
        let view = NNSegmentedControl(frame: rect)
        view.showStyle = .bottomLine
        view.normalColor = .gray
        view.selectedColor = .systemBlue
        view.items = ["过去", "现在", "将来"]
        view.addTarget(self, action: #selector(handleValueChange(_:)), for: .valueChanged)
        return view;
    }()
    
    var viewControllers: [UIViewController]?{
        willSet{
            guard let controllers = newValue else { return }
            for e in children.enumerated() {
                removeChildVC(e.element)
            }

            segmentCtl.items = controllers.map({ $0.title ?? "-" })
            for e in controllers.enumerated() {

                addChildVC(e.element)
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
    
    var isTitleFollow: Bool = true

    //MARK:属性
    lazy var items: [(UIViewController, String, UIImage?, UIImage?)] = {
        return [
            (FirstViewController(), "首页", UIImage(named: "Item_first_N"), UIImage(named: "Item_first_H")),
            (ThirdViewController(), "总览", UIImage(named: "Item_third_N"), UIImage(named: "Item_third_H")),
            (TitleViewController(), "测试", UIImage(named: "Item_center_N"), UIImage(named: "Item_center_H")),
            ]
    }()
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewControllers = items.map({ (vc, title, image, imageH) -> UIViewController in
            let ctrl = vc
            ctrl.reloadTabarItem((title, image, imageH))
            return ctrl
        })
        
        view.addSubview(segmentCtl)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        children.forEach { $0.beginAppearanceTransition(true, animated: animated) }
    }
    
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        children.forEach { $0.endAppearanceTransition() }
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        children.forEach { $0.beginAppearanceTransition(false, animated: animated) }
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        children.forEach { $0.endAppearanceTransition() }
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
            if self.isTitleFollow {
                self.title = self.selectedViewController?.title
            }
        }
        delegate?.sementedVC?(self, didSelect: toVC)
    }
    
    func transitionViewAnimate(_ fromVC: UIViewController, toVC: UIViewController, type: AnimateType, inAnimationBlock: Bool) {
        guard let fromIndex = children.firstIndex(of: fromVC),
              let toIndex = children.firstIndex(of: toVC) else { return }
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
//        DDLog("__\(inAnimationBlock)_\(fromVC.vcName):\(fromVC.view.frame)_\(toVC.controllerName):\(toVC.view.frame)")
    }

}

