//
//  HomeViewController.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBar.tintColor = UIColor.yellow;
        tabBar.barTintColor = UIColor.white;

        self.viewControllers = self.getControllers(itemList: itemList);

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        self.configureCenterBtn();

    }
    
    func getControllers(itemList:Array<Array<Any>>) -> Array<UIViewController> {

        let marr = NSMutableArray.init();
        
        for obj in itemList {
            let controller = UIViewControllerFromString(vcName: obj.first! as! String);
            controller.title = obj[1] as? String;
            controller.tabBarItem.image = UIImage(named: obj[2] as! String)?.withRenderingMode(.alwaysOriginal);
            controller.tabBarItem.selectedImage = UIImage(named: obj[3] as! String)?.withRenderingMode(.alwaysOriginal);
            
            let navController = UINavigationController(rootViewController: controller);
            let dic:Dictionary = [NSAttributedStringKey.foregroundColor : UIColor.white,
                                  NSAttributedStringKey.font  : UIFont.boldSystemFont(ofSize: 17),
                                  ];
            
            navController.navigationBar.titleTextAttributes = dic;
            marr.add(navController);
            
        }
        return marr as! Array<UIViewController>;
    }
    
    lazy var btnCenter : UIButton = {
        let btn = UIButton();
        btn.backgroundColor = UIColor.yellow;
        btn.setImage(UIImage(named: "tabbar_add"), for:.normal);
        btn.addTarget(self, action: #selector(handleActionSender(_:)), for: .touchUpInside);
        
        return btn;
    }();
    
    func configureCenterBtn() -> Void {
        tabBar.addSubview(btnCenter);
        
        let width = tabBar.bounds.width / CGFloat(viewControllers!.count);
        let rect = CGRect(x: 0, y: 0, width: width, height:tabBar.bounds.height);
        btnCenter.frame = rect.offsetBy(dx: width*2, dy: 0);
        
        
    }
    
    @objc func handleActionSender(_ sender:UIButton){
        let navController = UINavigationController(rootViewController: CenterViewController());
        navController.navigationBar.tintColor = UIColor.white;
        navController.navigationBar.barTintColor = UIColor.red;
        let dic:NSDictionary = [NSAttributedStringKey.foregroundColor:UIColor.white,
                                NSAttributedStringKey.font:UIFont.systemFont(ofSize: 18),
                                ];
        navController.navigationBar.titleTextAttributes = dic as? [NSAttributedStringKey : Any];
        self.present(navController, animated: true, completion: nil);
        
        print("111111")

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let itemList:Array = { () -> Array<[String]> in
        let list:Array = [
            ["FirstViewController", "First", "tabbar_1", "tabbar_selected_1"],
            ["SecondViewController", "Second", "tabbar_selected_1", "tabbar_selected_2"],
            ["CenterViewController", "Center", "tabbar_selected_1", "tabbar_selected_2"],
            ["ThirdViewController", "Third",  "tabbar_3",  "tabbar_selected_3"],
            ["FourthViewController", "Fourth",  "tabbar_4",  "tabbar_selected_4"],
            
            ];
        return list;
    }();
    
}
