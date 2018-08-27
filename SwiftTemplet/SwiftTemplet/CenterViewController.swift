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

        title = "center";

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleActionSender));
        
        
        imgView.frame = CGRect.init(x: 10, y: 80, width: 220, height: 100);
        view.addSubview(imgView);
        
        imgView.addActionHandler { (tap, view, idx) in
            print(tap,view,idx);
            
        }
      
       

//        self.imgView.addActionHandler = { (_ obj:AnyObject, _ item:AnyObject, _ idx:NSInteger) -> Void in
//
//            print(obj,item,idx);
//
//        };

//        print(self.block);
//
//        let btn = UIButton.init(setImage: "Pinterest_round", frame: CGRect.init(x:10, y: 200, width: 50, height: 50)) {
//            // 点击的回调
//            print("btn")
//        }
//        view.addSubview(btn)
//
//        let btn1 = UIButton.init(){
//            print("btn11111")
//
//        }
        let btn2 = UIButton.init(setImage: "Pinterest_round", frame: CGRect.init(x:10, y: 200, width: 50, height: 50)) { (sender) in
       
            print("btn11111")
            print(self,sender)

        }
        view.addSubview(btn2)

        
        let btn = UIButton.init();
        btn.frame = CGRect.init(x:200, y: 200, width: 50, height: 50);
        btn.titleLabel?.text = "99999";
        btn.backgroundColor = UIColor.green
        view.addSubview(btn)

        btn.addActionBlock { (sender) in
            
            print("btn2222",sender);
            
        };
        
        
        let btnNew = UIButton.createBtn(rect: CGRect.init(x:260, y: 260, width: 50, height: 50), title: "title", font: 15 as AnyObject, image: nil, tag: 101, type: 1);
        view.addSubview(btnNew);
        
        btnNew.setTitle("99+", for: UIControlState.normal);
//        btnNew.addActionBlock { (sender) in
//            print("33333",sender,sender.tag);
//
//        };
        

    
        
        btnNew.addActionHandler { (tap, view, idx) in
            print(tap,view,idx);
            
        }
        
        view.getViewLayer();
        
        
        loadData { (string) in
            print("获取结果 \(string)")

        }
        
       
    }

   
    //加载请求数据
    func loadData(completion: @escaping (_ result:[String]) -> ()) -> () {
        
        DispatchQueue.global().async {
            print("耗时操作 \(Thread.current)")
            
            //获取到的json结果数据
            let json = ["姓名","年龄","爱好"]
            
            //主队列回调
            DispatchQueue.main.async {
                print("主线程更新 UI \(Thread.current)")
                
                //回调异步获取的结果
                completion(json)
            }
        }
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
