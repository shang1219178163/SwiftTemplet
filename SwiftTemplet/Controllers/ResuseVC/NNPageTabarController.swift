//
//  NNPageTabarController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/10/24.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class NNPageTabarController: NNCycleViewController {

    lazy var tabBar: UITabBar = {
        let tabBar = UITabBar()
        tabBar.tintColor = .systemBlue;
        tabBar.barTintColor = .white;
        tabBar.isTranslucent = false;
        
        tabBar.delegate = self
        return tabBar
    }()
    
    lazy var itemList: [[String]] = {
        return [
            ["FirstViewController", "First", "Item_first_N", "Item_first_H"],
            ["SecondViewController", "Second", "Item_second_N", "Item_second_H"],
            ["ThirdViewController", "Third", "Item_third_N", "Item_third_H"],
            ["FourthViewController", "Fourth",  "Item_fourth_N",  "Item_fourth_H"],
            ];
    }()
    
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(tabBar)
        
        scrollViewPageIdxBlock = { idx in
            self.tabBar.selectedItem = self.tabBar.items![idx]
        }
        
        tabBar.items = UITabBar.barItems(itemList)
        tabBar.selectedItem = tabBar.items?.first!
        viewControllers = itemList.map({ UICtrFromString($0.first!) })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tabBar.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(49);
        }
        
        collectionView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalTo(tabBar.snp.top).offset(0);
        }
                
        layout.itemSize = CGSize(width: view.bounds.width, height: view.bounds.height - 49)
        collectionView.reloadData()
    }


}

extension NNPageTabarController: UITabBarDelegate{
        
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        guard let viewControllers = viewControllers, let fromVC = selectedViewController else { return }
//        guard let toVC = viewControllers[toIndex] as UIViewController? else { return }
        guard let toIndex = tabBar.items?.firstIndex(of: item) else { return }
        let indexP = IndexPath(row: toIndex, section: 0)
        collectionView.scrollToItem(at: indexP, at: .centeredHorizontally, animated: true)
    }
}
