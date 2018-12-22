
//
//  ThirdViewController.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let controller = UICtrFromString("UICollectionDispalyController")
        
        self.addChildViewController(controller)
        self.view.addSubview(controller.view)
        
        DDLog(UICTReusableViewZero.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        return;
        self.sortArray();
        self.sortDictiony();
       
        let num = 123456
        let num1 = 123456.2

        let number = NSNumber(floatLiteral: 0.55);
        let str = number.stringValue
        let one = num.string
        let two = num.number
        
        let three = num1.string
//        let four = num1.string
        print(number,str,0.66.string)
        
    }
    
    func sortArray() -> Void {
        let list = [1,2,4,3,9,8];
        
        let b = list[2...5];// ArraySlice
        
        let c = list.subarray(NSMakeRange(1, 3));
        let d = list.subarray(1, 3);
        
        DDLog(b);
        DDLog(c);
        DDLog(d);
        
        
    }
    //MARK:字典排序
    func sortDictiony() -> Void {
        //字典排序
        /*
         字典中$0 来表示闭包的第一个参数，$1 来表示第二个，以此类推，in 也可以省略
         元组 **(key: String, value: String) 第0个是 key，第一个是 value **
         dict.sorted { (<#(key: String, value: String)#>, <#(key: String, value: String)#>) -> Bool in
         <#code#>
         }
         */
        
        let dict = ["27":"w","15":"t","36":"b"]
        
        let dicSortedByKey = dict.sorted(by: {$0.0 < $1.0})
        let dicSortedByValue = dict.sorted(by: {$0.1 < $1.1})
        
        DDLog(dicSortedByKey)
        DDLog(dicSortedByValue)
        
        let dicSortedByKeyNew = dict.sorted(by:<)
        let dicSortedByValueNew = dict.sorted(by:>)
        
        DDLog(dicSortedByKeyNew)
        DDLog(dicSortedByValueNew)
        
        
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
