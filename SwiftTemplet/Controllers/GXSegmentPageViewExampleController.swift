//
//  GXSegmentPageViewExampleController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/10/10.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class GXSegmentPageViewExampleController: UIViewController {
    let inset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    
     var titleView0: GXSegmentTitleView = GXSegmentTitleView(frame: CGRectMake(0, 0, kScreenWidth, 50))
     var titleView1: GXSegmentTitleView = GXSegmentTitleView(frame: CGRectMake(0, 0, kScreenWidth, 50))
     var titleView2: GXSegmentTitleView = GXSegmentTitleView(frame: CGRectMake(0, 0, kScreenWidth, 50))
     var titleView3: GXSegmentTitleView = GXSegmentTitleView(frame: CGRectMake(0, 0, kScreenWidth, 50))
     var titleView4: GXSegmentTitleView = GXSegmentTitleView(frame: CGRectMake(0, 0, kScreenWidth, 50))
     var pageView: GXSegmentPageView = GXSegmentPageView(frame: CGRectMake(0, 0, kScreenWidth, 50))
    
    private lazy var items: [String] = {
        return ["要闻", "推荐", "抗肺炎", "视频", "新时代",
                "娱乐", "体育", "军事", "小视频", "微天下"]
    }()
    
    private lazy var childVCs: [UIViewController] = {
        var children: [UIViewController] = []
        for (index, title) in self.items.enumerated() {
            let vc = SimpleListController()
            vc.title = title
            children.append(vc)
        }
        return children
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleView0)
        view.addSubview(titleView1)
        view.addSubview(titleView2)
        view.addSubview(titleView3)
        view.addSubview(titleView4)
        view.addSubview(pageView)

        let config0 = GXSegmentTitleView.Configuration()
        config0.positionStyle = .none
        config0.indicatorStyle = .dynamic
        config0.indicatorFixedWidth = 30.0
        config0.indicatorFixedHeight = 2.0
        config0.indicatorAdditionWidthMargin = 5.0
        config0.indicatorAdditionHeightMargin = 2.0
        config0.isShowSeparator = true
        config0.separatorInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        self.titleView0.setupSegmentTitleView(config: config0, titles: self.items)
        
        let config1 = GXSegmentTitleView.Configuration()
        config1.positionStyle = .top
        config1.indicatorStyle = .dynamic
        config1.indicatorFixedWidth = 30.0
        config1.indicatorFixedHeight = 2.0
        config1.indicatorAdditionWidthMargin = 5.0
        config1.indicatorAdditionHeightMargin = 2.0
        config1.isShowSeparator = false
        config1.indicatorDuration = 0.0
        config1.separatorInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        self.titleView1.setupSegmentTitleView(config: config1, titles: self.items)

        let config2 = GXSegmentTitleView.Configuration()
        config2.positionStyle = .center
        config2.indicatorStyle = .dynamic
        config2.indicatorColor = UIColor.lightGray
        config2.indicatorCornerRadius = 11.0
        config2.indicatorFixedWidth = 0.0
        config2.indicatorFixedHeight = 22.0
        config2.indicatorAdditionWidthMargin = 10.0
        config2.indicatorAdditionHeightMargin = 0.0
        config2.titleSelectedColor = UIColor.white
        config2.isShowSeparator = false
        self.titleView2.setupSegmentTitleView(config: config2, titles: self.items)

        let config3 = GXSegmentTitleView.Configuration()
        config3.positionStyle = .bottom
        config3.indicatorStyle = .dynamic
        config3.indicatorFixedWidth = 30.0
        config3.indicatorFixedHeight = 2.0
        config3.indicatorAdditionWidthMargin = 5.0
        config3.indicatorAdditionHeightMargin = 2.0
        config3.isShowSeparator = true
        config3.separatorInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        self.titleView3.setupSegmentTitleView(config: config3, titles: self.items)
        
        let config4 = GXSegmentTitleView.Configuration()
        config4.positionStyle = .bottom
        config4.indicatorStyle = .dynamic
        config4.indicatorFixedWidth = 30.0
        config4.indicatorFixedHeight = 2.0
        config4.indicatorAdditionWidthMargin = 5.0
        config4.indicatorAdditionHeightMargin = 2.0
        config4.isShowSeparator = false
        self.titleView4.setupSegmentTitleView(config: config4, titles: self.items)
        self.titleView4.delegate = self
        
        self.pageView.setupSegmentPageView(parent: self, children: childVCs)
        self.pageView.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let items = [titleView0, titleView1, titleView2, titleView3, titleView4]
        items.snp.distributeViewsAlong(axisType: .vertical, fixedSpacing: 0, leadSpacing: inset.top, tailSpacing: 400)
        items.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(inset.left)
            make.right.equalToSuperview().offset(-inset.right)
            
        }
    }

}

extension GXSegmentPageViewExampleController: GXSegmentPageViewDelegate {
    func segmentPageView(_ segmentPageView: GXSegmentPageView, at index: Int) {
        NSLog("index = %d", index)
    }
    func segmentPageView(_ page: GXSegmentPageView, progress: CGFloat) {
        NSLog("select = %d, will = %d, progress = %f", page.selectIndex, page.willSelectIndex, progress)
        self.titleView4.setSegmentTitleView(selectIndex: page.selectIndex, willSelectIndex: page.willSelectIndex, progress: progress)
    }
}

extension GXSegmentPageViewExampleController: GXSegmentTitleViewDelegate {
    func segmentTitleView(_ page: GXSegmentTitleView, at index: Int) {
        self.pageView.scrollToItem(to: index, animated: true)
    }
}
