//
//  BookReaderController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/15.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

///阅读器视图
@objcMembers class BookReaderController: UIViewController {
    
    var list = 7.repeatArray("sdfasdfasdfa")
    
    var currentIndex: Int = 0
    
    lazy var pageController: UIPageViewController = {
        let options = [UIPageViewController.OptionsKey.interPageSpacing: 5,
                       UIPageViewController.OptionsKey.spineLocation: UIPageViewController.SpineLocation.min
            ] as [UIPageViewController.OptionsKey : Any]
        let pageVC = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        pageVC.dataSource = self
        pageVC.delegate = self
        return pageVC
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "BookReader"
        
//        pageController.dataSource = self
//        pageController.delegate = self
        
        let viewControllers = [viewControllerAt(currentIndex)]
        pageController.setViewControllers((viewControllers as! [UIViewController]), direction: .forward, animated: false, completion: nil)
        
        pageController.view.frame = view.bounds
        addChild(pageController)
        view.addSubview(pageController.view)
        pageController.didMove(toParent: self)
    }
    
    func viewControllerAt(_ index: Int) -> BookContentController? {
        if list.count == 0 || index >= list.count {
            return nil
        }

        let controller = BookContentController()
        controller.view.backgroundColor = UIColor.random
        controller.content = list.first!
        controller.index = index
        return controller
    }
    
    func viewControllerAt(_ viewController: UIViewController, showAfter: Bool) -> BookContentController? {
        guard let controller = viewController as? BookContentController else { return nil }
        var index = controller.index
        if showAfter {
            index += 1
        } else {
            if index == 0 {
                return nil
            }
            index -= 1
        }
        return viewControllerAt(index)
    }

//    func indexFromViewController(_ controller: BookContentController) -> Int {
//        guard let index = list.firstIndex(of: controller.content) else { return LONG_MAX }
//        return index
//    }

}

extension BookReaderController: UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        DDLog("111")

        return list.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        DDLog("111")

        guard let controller = pageViewController.viewControllers?.first as? BookContentController else { return 0 }
        return controller.index
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        DDLog("111")

        return viewControllerAt(viewController, showAfter: false)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
       DDLog("111")

        return viewControllerAt(viewController, showAfter: true)
    }

}

extension BookReaderController: UIPageViewControllerDelegate {

    //开始动画
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        DDLog("111")
    }

    //动画结束
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        DDLog("111")
    }

    //书脊位置
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewController.SpineLocation {
        if UIDevice.current.userInterfaceIdiom == .phone || orientation == .portrait {
            guard let controller = pageViewController.viewControllers?.first as? BookContentController else { return .min }
            pageViewController.setViewControllers([controller], direction: .forward, animated: false, completion: nil)
            pageViewController.isDoubleSided = false
            
            return .min
        }
        guard let controller = pageViewController.viewControllers?.first as? BookContentController,
            let nextVC = self.pageViewController(pageViewController, viewControllerAfter: controller) else { return .mid }

        pageViewController.setViewControllers([controller, nextVC], direction: .forward, animated: false, completion: nil)
        pageViewController.isDoubleSided = true;
        
        return .mid
    }

    //支持旋转
    func pageViewControllerSupportedInterfaceOrientations(_ pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
        return [.portrait, .landscapeLeft, .landscapeRight]
    }
    //旋转屏幕
    func pageViewControllerPreferredInterfaceOrientationForPresentation(_ pageViewController: UIPageViewController) -> UIInterfaceOrientation {
        return .portrait
    }

}
