//
//  NNTabController.swift
//  CloudCustomerService
//
//  Created by Bin Shang on 2019/9/16.
//  Copyright © 2019 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit
import SwiftExpand

@objc protocol NNTabControllerDelegate: NSObjectProtocol {
    @objc optional func tabController(_ tabController: NNTabController, willSelect viewController: UIViewController);
    @objc func tabController(_ tabController: NNTabController, didSelect viewController: UIViewController);
}

class NNTabController: UIViewController, UIScrollViewDelegate {
   

    var selectedViewController: UIViewController?

    var viewControllers: [UIViewController]?{
        willSet{
            if newValue == nil {
                return;
            }
            scrollViewContent.removeAllSubViews()

            let listName: NSMutableArray = [];
            for e in (newValue?.enumerated())! {
                listName.add(e.element.title ?? "\(e.offset)")
                scrollViewContent.addSubview(e.element.view)
                
                if e.element.title != nil {
                    listName.replaceObject(at: e.offset, with: e.element.title as Any)
                }
//                DDLog("element_\(e.element.title)",e.offset)
            }
            scrollViewTop.list = listName as! [String];
            selectedViewController = newValue?.first;
            selectedViewController?.beginAppearance(true, animated: true);
        }
    }
    
    var selectedIndex: Int = 0{
        didSet{
            scrollViewTop.selectIndexPath = IndexPath(row: oldValue, section: 0);
            
            let offset = CGPointMake(oldValue.toCGFloat * scrollViewContent.sizeWidth, 0);
            scrollViewContent.setContentOffset(offset, animated: true)
            
            selectedViewController = viewControllers![oldValue];
        }
    }
    
    weak var delegate: NNTabControllerDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollViewTop)
        view.addSubview(scrollViewContent)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let scrollViewTopHeight = scrollViewTop.isHidden ? 0.0 : 50
        scrollViewTop.snp.makeConstraints { (make) in
            make.top.equalToSuperview();
            make.left.right.equalToSuperview();
            make.height.equalTo(scrollViewTopHeight);
        }
        
        scrollViewContent.snp.makeConstraints { (make) in
            make.top.equalTo(scrollViewTop.snp.bottom);
            make.left.right.equalToSuperview();
            make.bottom.equalToSuperview();
        }
        
    
//        scrollViewContent.frame = CGRectMake(0, 50, view.bounds.width, view.bounds.height - 50)
//        DDLog(scrollViewContent.frame)
        guard viewControllers!.count > 0 else {
            return;
        }
        
        scrollViewContent.contentSize = CGSize(width: viewControllers!.count.toCGFloat * scrollViewContent.sizeWidth,
                                               height: scrollViewContent.sizeHeight)
        for e in viewControllers!.enumerated() {
            let controller = e.element;
            controller.view.frame = CGRectMake(e.offset.toCGFloat*scrollViewContent.sizeWidth,
                                               0,
                                               scrollViewContent.sizeWidth,
                                               scrollViewContent.sizeHeight)
//            controller.view.backgroundColor = UIColor.random
        }
        
    }
    
    // MARK: -UIScrollView
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == scrollViewContent {
            let index = scrollView.contentOffset.x / scrollView.sizeWidth;
            
            let chooseVC = viewControllers![Int(index)];
            if (self.delegate != nil) && self.delegate!.conforms(to: NNTabControllerDelegate.self) {
                self.delegate!.tabController?(self, willSelect: chooseVC);
            }
            scrollViewTop.selectIndexPath = IndexPath(row: Int(index), section: 0)
            
            handleSelectedViewController(chooseVC)
        }
    }
    // MARK: -funtions
    func handleSelectedViewController(_ chooseVC: UIViewController) {
        if (self.delegate != nil) && self.delegate!.conforms(to: NNTabControllerDelegate.self) {
            self.delegate!.tabController(self, didSelect: chooseVC);
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.selectedViewController?.transitionTo(VC: chooseVC)
            self.selectedViewController = chooseVC;
        }
    }
    
    // MARK: -lazy
    lazy var scrollViewTop: NNSegmentView = {
        let view = NNSegmentView(frame: .zero)
        view.list = ["0", "1", "2", "3", "4", ];
        view.showItemNum = 4.5;
        
        view.collectionView.register(cellType: UICTViewCellOne.self)
        view.blockCellForItem({ (collectionView, indexPath) -> UICollectionViewCell? in
            let cell: UICTViewCellOne = collectionView.dequeueReusableCell(for: UICTViewCellOne.self, indexPath: indexPath)
            cell.lab.text = "标题\(indexPath.row)"
            if let title = view.list[indexPath.row] as? String {
                cell.lab.text = title;
            }
            
            cell.lab.textColor = view.selectIndexPath == indexPath ? view.selectedColor : view.normalColor;
//            cell.contentView.backgroundColor = UIColor.random;
            cell.imgView.isHidden = true;
            return cell;
        });
        
        view.blockDidSelectItem({ (collectionView, indexPath) in
            collectionView.reloadData();
            
            let chooseVC = self.viewControllers![indexPath.row];
            if (self.delegate != nil) && self.delegate!.conforms(to: NNTabControllerDelegate.self) {
                self.delegate!.tabController?(self, willSelect: chooseVC);
            }
            
            let offset = CGPointMake(indexPath.row.toCGFloat * self.scrollViewContent.sizeWidth, 0);
            self.scrollViewContent.setContentOffset(offset, animated: true)
            
            self.handleSelectedViewController(chooseVC)

        })
        return view;
    }()
    
    
    lazy var scrollViewContent: UIScrollView = {
        let view = UIScrollView();
        view.isPagingEnabled = true;
        view.delegate = self;
        
        return view;
    }()
}

