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
        view.backgroundColor = .cyan;

//        DispatchQueue.main.after(time: .now() + 2, block: {
//            IOPProgressHUD.dismiss();
//            self!.navigationController?.popViewController(animated: true)
//        })
        
        DDLog("_%@_",UIApplication.mainWindow);
        DDLog("__%@_",UIApplication.shared.keyWindow);
        DDLog(view.hashValue,UIApplication.mainWindow.hashValue)
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleActionSender));
        
        let itemLeft = createBarItem( UIBarButtonItem.SystemItem.reply, isLeft: true) { (sender) in
//            DDLog(sender);
            self.dismiss(animated: true, completion: nil)

            let btnItem = sender as! UIBarButtonItem
            let style = btnItem.value(forKey: "systemItem");
            if UIBarButtonItem.SystemItem(rawValue: style as! Int) == UIBarButtonItem.SystemItem.redo {
                DDLog("111111");
                
            }
            
            if (sender as! UIBarButtonItem).systemType == UIBarButtonItem.SystemItem.reply {
                DDLog("4444");
                
            }
            DDLog(btnItem.tag)
         
        }

        
        imgView.frame = .init(x: 10, y: 80, width: 220, height: 100);
        imgView.tag = 111;
        view.addSubview(imgView);
        
        imgView.addActionClosure { (tap, view, idx) in
            DDLog(idx);
            
        }
        
        view.tag = 999
        view.addActionClosure { (tap, view, idx) in
            DDLog(idx);
            
        }
        
        let rect = CGRect(x:260, y: 260, width: 50, height: 50)
        let btn = UIButton.create(rect, title: "title", textColor: .white, backgroundColor: .clear)
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
        let btnOne = UIButton.create( rectOne, title: "666+", textColor: .white, backgroundColor: .theme)
        view.addSubview(btnOne)
        
        btnOne.addActionHandler({ (sender: UIControl) in
            DDLog(btnOne.titleLabel?.text as Any)
            
        }, for: .touchUpInside)
    
        view.getViewLayer();
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let rightBtn = UIButton.createBtnBarItem("done")
        rightBtn.addActionHandler({ (control) in
            DDLog(control);
        })
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
    }

    @objc func handleActionSender() {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
