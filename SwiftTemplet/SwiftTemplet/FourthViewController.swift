
//
//  FourthViewController.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

typealias MyBlock = (_ message:UIViewController)->(Void);

class MyView:UIView{
    var mb:MyBlock?
    
    //假装我有一个button添加了点击事件
    @objc func buttonClick(){
        if mb != nil{
            mb!(CenterViewController());
            
        }
    }
    
}

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let mView = MyView();
        self.view.addSubview(mView);
        
        mView.mb = {(message:UIViewController)->(Void) in
            self.present(message, animated: true, completion: nil);
            
            
        }
        
        
        
        
        
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
