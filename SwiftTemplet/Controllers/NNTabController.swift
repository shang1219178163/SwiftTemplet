//
//  NNTabController.swift
//  CloudCustomerService
//
//  Created by Bin Shang on 2019/9/16.
//  Copyright © 2019 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit
import SwiftExpand

class NNTabController: UIViewController, UIScrollViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollViewTop)
        view.addSubview(scrollViewContent)

        
       
        view.getViewLayer()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollViewTop.snp.makeConstraints { (make) in
            make.top.equalToSuperview();
            make.left.right.equalToSuperview();
            make.height.equalTo(50);
        }
        
        scrollViewContent.snp.makeConstraints { (make) in
            make.top.equalTo(scrollViewTop.snp.bottom);
            make.left.right.equalToSuperview();
            make.bottom.equalToSuperview();
        }

//        DDLog(scrollViewContent)

        scrollViewContent.contentSize = CGSize(width: contentList.count.toCGFloat*UIScreen.sizeWidth,
                                               height: scrollViewContent.sizeHeight)
        for e in contentList.enumerated() {
            let controller = UICtrFromString(e.element.last!)
            controller.view.frame = CGRectMake(e.offset.toCGFloat*scrollViewContent.sizeWidth,
                                               0,
                                               scrollViewContent.sizeWidth,
                                               scrollViewContent.sizeHeight)
            scrollViewContent.addSubview(controller.view)
            controller.view.backgroundColor = UIColor.random
        }
    
    }
    
    // MARK: -funtions
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == scrollViewContent {
            let index = scrollView.contentOffset.x / scrollView.sizeWidth;
            scrollViewTop.selectIndexPath = IndexPath(row: Int(index), section: 0)
        }
    }

    // MARK: -lazy
    lazy var scrollViewTop: NNSegmentView = {
        let view = NNSegmentView(frame: .zero)
        view.list = ["进出信息", "支付信息", "授权信息", "优惠券", "修改车牌", ];
        view.indicatorType = 2;
        view.showItemNum = 4.5;
        
        view.collectionView.register(cellType: UICTViewCellOne.self)
        view.blockCellForItem({ (collectionView, indexPath) -> UICollectionViewCell? in
            let cell: UICTViewCellOne = collectionView.dequeueReusableCell(for: UICTViewCellOne.self, indexPath: indexPath)
            cell.label.text = "标题\(indexPath.row)"
            cell.label.text = view.list[indexPath.row] as! String;
            
            cell.label.textColor = view.selectIndexPath == indexPath ? view.selectedColor : view.normalColor;
            //            cell.contentView.backgroundColor = UIColor.random;
            cell.imgView.isHidden = true;
            return cell;
        });
        
        view.blockDidSelectItem({ (collectionView, indexPath) in
            DDLog(indexPath);
            collectionView.reloadData();
            
            let offset = CGPointMake(indexPath.row.toCGFloat * self.scrollViewContent.sizeWidth, 0);
            self.scrollViewContent.setContentOffset(offset, animated: true)
            
            DDLog(offset);

        })
        
        return view;
    }()
    
    
    lazy var scrollViewContent: UIScrollView = {
        let view = UIScrollView();
        view.isPagingEnabled = true;
        view.delegate = self;
        
        return view;
    }()
    
    lazy var contentList: [[String]] = {
        var list: [[String]] = [
            ["车场记录", "TestViewController"],
             ["支付下发记录", "TestViewController"],
             ["授权记录", "TestViewController"],
             ["优惠券记录", "TestViewController"],
             ["车牌修改", "TestViewController"],
        ]
        return list
    }()
}
