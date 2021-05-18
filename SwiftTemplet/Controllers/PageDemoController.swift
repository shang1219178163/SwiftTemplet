//
//  PageDemoController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/5/18.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SafariServices

@available(iOS 11.0, *)
class PageDemoController: UIViewController {
    var controllers = [UIViewController]()
    
    lazy var pageController: UIPageViewController = {
        let pageController = UIPageViewController(transitionStyle: .pageCurl,
                                                  navigationOrientation: .horizontal,
                                                  options: nil)
        pageController.dataSource = self
        pageController.delegate = self
        return pageController
    }()

    // MARK: -lifcycle
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
        
        createBarItem("Done") { (item) in
            self.showTutorial(1)
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pageController.setViewControllers([controllers[0]], direction: .forward, animated: false)
    }



    func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }

    func randomColor() -> UIColor {
        return UIColor(red: randomCGFloat(), green: randomCGFloat(), blue: randomCGFloat(), alpha: 1)
    }
    
    func showTutorial(_ which: Int) {
        if let url = URL(string: "https://www.hackingwithswift.com/read/\(which + 1)") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true

            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
}


@available(iOS 11.0, *)
extension PageDemoController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController) else { return nil }
        return index > 0 ? controllers[index - 1] : nil
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController) else { return nil }
        return index < controllers.count - 1 ? controllers[index + 1] : nil;
    }
}

