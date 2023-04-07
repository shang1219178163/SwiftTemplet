//
//  NNScrollViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/10/24.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class NNScrollViewController: UIViewController{
    
    var inset = UIEdgeInsets(0, 0, 0, 0)
    

    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: self.view.bounds)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.bounces = true
        view.alwaysBounceHorizontal = true
        view.alwaysBounceVertical = false
        view.scrollsToTop = false
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        
        view.delegate = self;
        return view;
    }()
    
    var viewControllers: [UIViewController]?{
        willSet{
            guard let newValue = newValue else {
                return
            }
            scrollView.contentSize = CGSize(width: CGFloat(newValue.count) * scrollView.bounds.width, height: scrollView.bounds.height)
            
            for (i, e) in newValue.enumerated() {
                scrollView.addSubview(e.view)
                
                let offsetX = CGFloat(i) * scrollView.bounds.width
                e.view.frame = CGRect(x: offsetX + inset.left,
                                      y: inset.top,
                                      width: scrollView.bounds.width - inset.left - inset.right,
                                      height: scrollView.bounds.height - inset.top - inset.bottom)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        
        viewControllers = [FirstViewController(), SecondViewController(), ThirdViewController()]
        DDLog(children.count)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    

}


extension NNScrollViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        DDLog(scrollView.contentOffset.y)
//        if scrollView.contentOffset.y < 0 {
//            scrollView.contentOffset = CGPoint(scrollView.contentOffset.x, 0)
//            return
//        }

//        if scrollView.contentOffset.x > scrollView.contentOffset.y {
//            scrollView.contentOffset = CGPoint(scrollView.contentOffset.x, 0)
//        } else {
//            scrollView.contentOffset = CGPoint(0, scrollView.contentOffset.y)
//        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollView.resignFirstResponder()

        let idx = Int(scrollView.contentOffset.x/scrollView.bounds.width)
        
        let childVC: UIViewController = viewControllers![idx]
        childVC.view.becomeFirstResponder()

    }
}
