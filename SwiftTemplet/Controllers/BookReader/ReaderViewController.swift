//
//  ReaderViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/15.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


class ReaderViewController: UIViewController, UIPageViewControllerDelegate {
    var controllers = [UIViewController]()

    var list = [String].init(count: 7) { _ in "abcd" }

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

        addChild(pageController)
        view.addSubview(pageController.view)
        pageController.didMove(toParent: self)

        let views = ["pageController": pageController.view] as [String: AnyObject]
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[pageController]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[pageController]|", options: [], metrics: nil, views: views))

        for _ in 1 ... 5 {
            let vc = UIViewController()
            vc.view.backgroundColor = randomColor()
            controllers.append(vc)
        }

        pageController.setViewControllers([controllers[0]], direction: .forward, animated: false)
    }    

    func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }

    func randomColor() -> UIColor {
        return UIColor(red: randomCGFloat(), green: randomCGFloat(), blue: randomCGFloat(), alpha: 1)
    }
}

extension ReaderViewController: UIPageViewControllerDataSource {
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return list.count
//    }
//
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        guard let controller = pageViewController.viewControllers?.first as? BookContentController,
//            let index = list.firstIndex(of: controller.content) else { return 0 }
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
