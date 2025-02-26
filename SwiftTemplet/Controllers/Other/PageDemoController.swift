//
//  PageDemoController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/5/18.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SnapKit
import SafariServices

@available(iOS 11.0, *)
class PageDemoController: UIViewController {
    var controllers = [UIViewController]()
    
    lazy var pageController: UIPageViewController = {
        let pageController = UIPageViewController(transitionStyle: .pageCurl,
                                                  navigationOrientation: .horizontal
                                                  )
        pageController.dataSource = self
        pageController.delegate = self
        return pageController
    }()

    // MARK: -lifcycle
    override func viewDidLoad() {
        super.viewDidLoad()

        edgesForExtendedLayout = []
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .done, action: { item in
            self.showTutorial(1)
        })
        
        
        addChild(pageController)
        view.addSubview(pageController.view)
        pageController.didMove(toParent: self)

//        let views: [String: AnyObject] = ["pageController": pageController.view]
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[pageController]|", options: [], metrics: nil, views: views))
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[pageController]|", options: [], metrics: nil, views: views))

        for e in 1 ... 10 {
            let vc = PageDetailController()
            vc.content = "index: \(e)"
            vc.view.backgroundColor = randomColor()
            controllers.append(vc)
        }
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pageController.view.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20);
            make.left.equalToSuperview().offset(20);
            make.right.equalToSuperview().offset(-20);
            make.bottom.equalToSuperview().offset(-20);
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
    
//    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewController.SpineLocation {
//        return .mid
//    }
}



class PageDetailController: UIViewController {
    
    var content: String? // The equivalent of the 'content' property in Swift

    private var contentLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = randomColor()
        
        contentLabel = UILabel(frame: CGRect(x: 0, y: 50, width: self.view.bounds.size.width, height: 100))
        contentLabel.numberOfLines = 0
        contentLabel.backgroundColor = randomColor()
        self.view.addSubview(contentLabel)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        contentLabel.text = content
    }

    private func randomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(256)) / 255.0
        let green = CGFloat(arc4random_uniform(256)) / 255.0
        let blue = CGFloat(arc4random_uniform(256)) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
