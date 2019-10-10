//
//  HomeViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class HomeViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBar.tintColor = UIColor.theme;
        tabBar.barTintColor = UIColor.white;
        tabBar.isTranslucent = false;
        viewControllers = UINavListFromList(itemList);

        selectedIndex = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
//        configureCenterBtn();

    }
    
    func configureCenterBtn() -> Void {
        tabBar.addSubview(btnCenter);
        
        let width = tabBar.bounds.width / CGFloat(viewControllers!.count);
        let rect = CGRect(x: 0, y: 0, width: width, height:tabBar.bounds.height);
        btnCenter.frame = rect.offsetBy(dx: width*2, dy: 0);
        
    }
    
    @objc func handleActionSender(_ sender:UIButton){
        let navController = UINavigationController(rootViewController: CenterViewController());
        self.present(navController, animated: true, completion: nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Delegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//        DDLog(tabBar.selectedItem as Any);
        
        
    }
    
    //MARK:属性
    let itemList:Array = { () -> Array<[String]> in
        let list:Array = [
            ["FirstViewController", "首页", "Item_first_N", "Item_first_H"],
            ["SecondViewController", "圈子", "Item_second_N", "Item_second_H"],
//            ["CenterViewController", "总览",  "Item_center_N",  "Item_center_H"],
            ["ThirdViewController", "总览", "Item_third_N", "Item_third_H"],
            ["FourthViewController", "消息",  "Item_fourth_N",  "Item_fourth_H"],
//            ["FifthViewControlle", "我的",  "Item_center_N",  "Item_center_H"],
//            ["TmpViewController", "我的",  "Item_center_N",  "Item_center_H"],
//            ["CCSCouponRecordController", "我的",  "Item_center_N",  "Item_center_H"],
            ["CellListController", "测试",  "Item_center_N",  "Item_center_H"],            
            
            ];
        return list;
    }();
    
    lazy var btnCenter : UIButton = {
        let btn = UIButton();
        btn.backgroundColor = UIColor.theme;
        btn.setImage(UIImage(named: "tabbar_add"), for:.normal);
        btn.addTarget(self, action: #selector(handleActionSender(_:)), for: .touchUpInside);
        
        return btn;
    }();
}
