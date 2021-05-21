//
//  NNCycleTabbarController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/11/20.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class NNCycleTabbarController: NNCycleController {

    lazy var tabBar: UITabBar = {
        let tabBar = UITabBar()
        tabBar.tintColor = .systemBlue;
        tabBar.barTintColor = .white;
        tabBar.isTranslucent = false;
        
        tabBar.delegate = self
        return tabBar
    }()
    
    ///例[["FirstViewController", "First", "Item_first_N", "Item_first_H"],];
    var itemList = [(UIViewController, String, UIImage?, UIImage?)](){
        willSet{
            if newValue.count == 0 {
                return
            }
            updateItems(newValue)
        }
    }
    
    var scrollToItemAnimated = true
    
    ///滚动到某个页面
    var scrollViewBlock: ((Int)->Void)?
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(tabBar)
        
        scrollViewPageIdxBlock = { idx in
            self.tabBar.selectedItem = self.tabBar.items![idx]
            self.scrollViewBlock?(idx)
        }
        
        itemList = [
                (FirstViewController(), "首页", UIImage(named: "Item_first_N"), UIImage(named: "Item_first_H")),
                (ThirdViewController(), "总览", UIImage(named: "Item_third_N"), UIImage(named: "Item_third_H")),
                (TitleViewController(), "测试", UIImage(named: "Item_center_N"), UIImage(named: "Item_center_H")),

                ]
    }
    // MARK: -lifecycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(UIScreen.tabBarHeight);
        }
        
        collectionView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalTo(tabBar.snp.top).offset(0);
        }
                
        layout.itemSize = CGSize(width: view.bounds.width, height: view.bounds.height - UIScreen.tabBarHeight)
        collectionView.reloadData()
    }

    
    func updateItems(_ items: [(UIViewController, String, UIImage?, UIImage?)]) {
        viewControllers = items.map({ (vc, title, image, imageH) -> UIViewController in
            let ctrl = vc
            ctrl.reloadTabarItem((title, image, imageH))
            return ctrl
        })
        
        tabBar.items = viewControllers.map({ $0.tabBarItem })
        tabBar.selectedItem = tabBar.items?.first!
    }

}

extension NNCycleTabbarController: UITabBarDelegate{
        
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        guard let viewControllers = viewControllers, let fromVC = selectedViewController else { return }
//        guard let toVC = viewControllers[toIndex] as UIViewController? else { return }
        guard let toIndex = tabBar.items?.firstIndex(of: item) else { return }
        let indexP = IndexPath(row: toIndex, section: 0)
        collectionView.scrollToItem(at: indexP, at: .centeredHorizontally, animated: scrollToItemAnimated)
        
        self.scrollViewBlock?(indexP.row)
    }
}
