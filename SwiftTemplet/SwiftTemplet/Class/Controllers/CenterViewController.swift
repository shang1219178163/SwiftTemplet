//
//  CenterViewController.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/13.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit


class CenterViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.cyan;

//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleActionSender));
        
        let itemLeft = createBarItem(systemItem: UIBarButtonSystemItem.reply, isLeft: true) { (sender) in
//            DDLog(sender);
            self.dismiss(animated: true, completion: nil)

            let style = (sender as! UIBarButtonItem).value(forKey: "systemItem");
            if UIBarButtonSystemItem(rawValue: style as! Int) == UIBarButtonSystemItem.redo {
                DDLog("111111");
                
            }
            
            if (sender as! UIBarButtonItem).systemType == UIBarButtonSystemItem.reply {
                DDLog("4444");
                
            }
         
        }

        let itemRight = createBtnBarItem(title: "done", image: nil, tag: 17, isLeft: false, isHidden: false) { (tap, view, idx) in
            DDLog(tap,view,idx);
        };
        DDLog(itemRight);
        
        
        imgView.frame = CGRect.init(x: 10, y: 80, width: 220, height: 100);
        view.addSubview(imgView);
        
        imgView.addActionHandler { (tap, view, idx) in
            DDLog(tap,view,idx);
            
        }
      
        
        let btn = UIButton.createBtn(rect: CGRect(x:260, y: 260, width: 50, height: 50),title: "title", font: 15 as AnyObject, image: nil, tag: 101, type: 1);
        view.addSubview(btn);
        btn.setTitle("99+", for: UIControlState.normal);
        btn.backgroundColor = UIColor.red;
//        btnNew.addActionBlock { (sender) in
//            DDLog("33333",sender,sender.tag);
//
//        };

        btn.addActionHandler { (tap, view, idx) in
//            DDLog(tap,view,idx);
//            DDlog(view);
            DDLog(view);
            
            
            if "asdfsdgf".contains("as") {
                DDLog(1111);
                
            }
            DDLog(String.timeNow().toTimeStamp());
            
//            let string = "按时发生发生的发生发达的发送到发斯蒂芬";
//            
//            let size = self.sizeWithText(text: string as AnyObject, font: 15 as AnyObject, width:50);
//            DDLog(size);
            
            DDLog(NSStringFromClass(self.classForCoder));
        }
        
        view.getViewLayer();
        
        
    }


    @objc func handleActionSender() -> Void {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var imgView:UIImageView = {
        let view = UIImageView.init();
        view.backgroundColor = UIColor.red;
        
        
        return view;
    }();

    
//    layz var btn:UIButton = {
//        let btn = UIButton.init();
//        btn.frame = CGRect.init(x:10, y: 200, width: 50, height: 50);
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
