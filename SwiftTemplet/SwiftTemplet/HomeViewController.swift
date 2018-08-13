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
        
      
//        self.addChildVC(controller: FirstViewController(), title: "first", imgName: "tabbar_1", imgName_H: "tabbar_selected_1");
//        self.addChildVC(controller: SecondViewController(), title: "second", imgName: "tabbar_selected_1", imgName_H: "tabbar_selected_2");
//        self.addChildVC(controller: CenterViewController(), title: "", imgName: "", imgName_H: "");
//        self.addChildVC(controller: ThirdViewController(), title: "Third", imgName: "tabbar_3", imgName_H: "tabbar_selected_3");
//        self.addChildVC(controller: FourthViewController(), title: "Fourth", imgName: "tabbar_4", imgName_H: "tabbar_selected_4");
        
        
        let itemList:Array = [
            ["FirstViewController", "first", "tabbar_1", "tabbar_selected_1"],
             ["SecondViewController", "second", "tabbar_selected_1", "tabbar_selected_2"],
//             ["CenterViewController",  "", "", ""],
             ["CenterViewController", "second", "tabbar_selected_1", "tabbar_selected_2"],
             ["ThirdViewController", "Third",  "tabbar_3",  "tabbar_selected_3"],
             ["FourthViewController", "Fourth",  "tabbar_4",  "tabbar_selected_4"],
        
            ];
        for obj in itemList {
            self.addChildVC(controller: self.getClassVC(className: obj.first!), title: obj[1], imgName: obj[2], imgName_H: obj[3]);
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        self.configureCenterBtn();

    }

    func addChildVC(controller:UIViewController, title:String, imgName:String, imgName_H:String) -> Void {
        let navController = UINavigationController(rootViewController: controller);
        navController.navigationBar.tintColor = UIColor.white;
        navController.navigationBar.barTintColor = UIColor.yellow;
        
        let dic:Dictionary = [NSAttributedStringKey.foregroundColor : UIColor.white,
                                NSAttributedStringKey.font  : UIFont.boldSystemFont(ofSize: 17),
                                ];
        
        navController.navigationBar.titleTextAttributes = dic;
        controller.title = title;
        controller.tabBarItem.tag = 1;
        controller.tabBarItem.image = UIImage(named: imgName)?.withRenderingMode(.alwaysOriginal);
        controller.tabBarItem.selectedImage = UIImage(named: imgName_H)?.withRenderingMode(.alwaysOriginal);
        self.addChildViewController(controller);
        
    }
    

    
    lazy var btnCenter : UIButton = {
        let btn = UIButton();
        btn.backgroundColor = UIColor.yellow;
        btn.setImage(UIImage(named: "tabbar_add"), for:.normal);
        btn.addTarget(self, action: #selector(handleActionSender), for: .touchUpInside);
        
        return btn;
    }();
    
    func configureCenterBtn() -> Void {
        tabBar.addSubview(btnCenter);
        
        let width = tabBar.bounds.width / CGFloat(viewControllers!.count);
        let rect = CGRect(x: 0, y: 0, width: width, height:tabBar.bounds.height);
        btnCenter.frame = rect.offsetBy(dx: width*2, dy: 0);
        
        
    }
    
    @objc func handleActionSender(){
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
