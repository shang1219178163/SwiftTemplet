//
//  NNPageController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/16.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

///支持水平滚动和垂直滚动
@objcMembers class NNPageController: UIViewController {
    
    var controllers = [UIViewController](){
        willSet{
            guard let first = newValue.first else { return }
            pageController.setViewControllers([first], direction: .forward, animated: false)
        }
    }

    lazy var pageController: UIPageViewController = {
        let options: [UIPageViewController.OptionsKey : Any] = [
            .interPageSpacing: 5,
            .spineLocation: UIPageViewController.SpineLocation.min
        ]
        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.dataSource = self
        pageController.delegate = self
        return pageController
    }()
        
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        addChild(pageController)
        view.addSubview(pageController.view)
        pageController.didMove(toParent: self)
        
        let views = ["pageController": pageController.view] as [String: AnyObject]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[pageController]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[pageController]|", options: [], metrics: nil, views: views))
        
//        var list = [UIViewController]()
//        for idx in 1 ... 5 {
//            let vc = UIViewController()
//            vc.view.backgroundColor = UIColor.random
//            vc.title = "\(idx)"
//            list.append(vc)
//        }
//        controllers = list
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
}

extension NNPageController: UIPageViewControllerDataSource {
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return controllers.count
//    }
//
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        guard let controller = pageViewController.viewControllers?.first,
//            let index = controllers.firstIndex(of: controller) else { return 0 }
//        return index
//    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController), index > 0 {
            return controllers[index - 1]
        }
        return nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = controllers.firstIndex(of: viewController), index < controllers.count - 1 {
            return controllers[index + 1]
        }
        return nil
    }

}

extension NNPageController: UIPageViewControllerDelegate {

    //开始动画
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        guard let controller = pendingViewControllers.first else { return }
        title = controller.title
        
        controller.beginAppearanceTransition(true, animated: true);
    }

    //动画结束
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed == false {
            return
        }

        guard let controller = previousViewControllers.first else { return }
        controller.endAppearanceTransition();
    }

    //书脊位置
//    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewController.SpineLocation {
//        return .mid
//    }
//    //支持旋转
//    func pageViewControllerSupportedInterfaceOrientations(_ pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
//        return [.portrait, .landscapeLeft, .landscapeRight]
//    }
//    //旋转屏幕
//    func pageViewControllerPreferredInterfaceOrientationForPresentation(_ pageViewController: UIPageViewController) -> UIInterfaceOrientation {
//        return .portrait
//    }

}
