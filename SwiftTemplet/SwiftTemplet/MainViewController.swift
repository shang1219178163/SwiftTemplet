//
//  MainViewController.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/4/24.
//  Copyright © 2018年 BN. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController{
    
    
    
}

class MainViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    var dataList : NSMutableArray = [];
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        title = "Main";
        view.backgroundColor = UIColor.red;
        
//        self.createBarItem(titile:"Next", imgName:nil, isLeft:false, isHidden:false, target:self, action:#selector(MainViewController.handActionBtn));
        
        self.view.addSubview(self.tableView);
        
        
        for _ in 0...5{
            let marr : NSMutableArray = [];
            for j in 0...3{
                marr.add(j);
                
            }
            self.dataList.add(marr);
        }
        print(self.dataList);
        
    }
    
    @objc func handActionBtn(){
        print("handActionBtn");
        
        
    }
    
//   @objc func handActionBtn(sender:UIButton) -> Void{
//        print("__%@",sender.titleLabel?.text as Any);
//
//
//    }
    
//    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataList.count;
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arraySection : NSArray = self.dataList[section] as! NSArray;
        return arraySection.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60;
    };
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  identifier : String = "identifier";
        var  cell = tableView.dequeueReusableCell(withIdentifier: identifier);
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier);
        }

        cell?.textLabel?.text = String.init(format: "section_%d,row_%d", indexPath.section,indexPath.row);
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x:0,y:0,width:0,height:0));
        label.backgroundColor = UIColor.green;
        label.text = "header";
        return label;
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 45;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x:0,y:0,width:0,height:0));
        label.backgroundColor = UIColor.yellow;

        label.text = "footer";
        return label;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - layz
    lazy var tableView: UITableView = {
        let table = UITableView(frame:self.view.bounds, style:UITableViewStyle.grouped);
        table.dataSource = self;
        table.delegate = self;
        
        return table;
    }();
    
}
