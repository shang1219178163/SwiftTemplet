//
//  CenterViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/13.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class CenterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        title = "Center"
                
        navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .reply, action: { item in
            self.dismiss(animated: true, completion: nil)

            if item.systemType == UIBarButtonItem.SystemItem.redo {
                DDLog("111111");
            }
            
            if item.systemType == UIBarButtonItem.SystemItem.reply {
                DDLog("4444");
            }
            DDLog(item.tag)
        })

        
        imgView.frame = .init(x: 10, y: 80, width: 220, height: 100);
        imgView.tag = 111;
        view.addSubview(imgView);
        
        imgView.addGestureTap { (tap) in
            DDLog(tap.view?.tag);
        }
        
        view.tag = 999
        view.addGestureTap { (tap) in
            DDLog(tap.view?.tag);
            
        }
        
        let rect = CGRect(x:260, y: 260, width: 50, height: 50)
        let btn = UIButton(type: .custom)
        btn.setTitle("title", for: .normal)
        btn.setBackgroundImage(UIImage(color: .theme), for: .normal)
        btn.setBackgroundImage(UIImage(color: .lightGray), for: .disabled)
        btn.addActionHandler({ (sender) in
            if "asdfsdgf".contains("as") {
                DDLog(1111);
                
            }
//            DDLog(String.timeNow().toTimeStamp());
            DDLog(NSStringFromClass(self.classForCoder));
        }, for: .touchUpInside)
     
      
        view.addSubview(btn);
        btn.setTitle("99+", for: .normal);
        btn.backgroundColor = .red;
        
        let rectOne = CGRect(x: imgView.frame.minX, y: imgView.frame.maxY + 20, width: 100, height: 100)
        let btnOne = UIButton(type: .custom)
        btnOne.setTitle("666+", for: .normal)
        view.addSubview(btnOne)
        
        btnOne.addActionHandler({ (sender) in
            DDLog(btnOne.titleLabel?.text)
            
        }, for: .touchUpInside)
    
        view.getViewLayer();
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let rightBtn = UIButton(barItem: "done")
        rightBtn.addActionHandler({ (sender) in
            DDLog(sender);
        })
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
    }

    @objc func handleActionSender() {
        self.dismiss(animated: true, completion: nil)
        
    }
    

    
    lazy var imgView:UIImageView = {
        let view = UIImageView.init();
        view.backgroundColor = .red;
        
        
        return view;
    }();

    
//    layz var btn:UIButton = {
//        let btn = UIButton.init();
//        btn.frame = .init(x:10, y: 200, width: 50, height: 50);
//        btn.titleLabel?.text = "99999";
//        return btn;
//    }();

    //加载请求数据
    func loadData(completion: @escaping (_ result:[String]) -> ()) -> () {
        
        DispatchQueue.global().async {
            DDLog("耗时操作 \(Thread.current)")
            
            //获取到的json结果数据
            let json = ["姓名","年龄","爱好"]
            
            //主队列回调
            DispatchQueue.main.async {
                DDLog("主线程更新 UI \(Thread.current)")
                
                //回调异步获取的结果
                completion(json)
            }
        }
    }
    
}
