//
//  TestScrollViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/16.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class TestScrollViewController: UIViewController {

    lazy var animatedView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
//        view.panGestureRecognizer.addTarget(self, action:#selector(handleScrollViewPanGesture(_:)))
        view.backgroundColor = .systemYellow

        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .systemGreen
        
        view.addSubview(animatedView)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        animatedView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
        }
    }

}
