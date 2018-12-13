//
//  MainViewController.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/4/24.
//  Copyright © 2018年 BN. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
//    var dataList : NSMutableArray = [];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        title = "Main";
        
//        self.createBarItem(titile:"Next", imgName:nil, isLeft:false, isHidden:false, target:self, action:#selector(MainViewController.handActionBtn));
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "next", style: .done, target: self, action: #selector(handActionBtn));

        print(view.frame,view.bounds)

        view.addSubview(self.tableView);
        
        for _ in 0...3{
            let marr : NSMutableArray = [];
            for j in 0...3{
                marr.add(j);
                
            }
            self.dataList.add(marr);
        }
        DDLog(self.dataList);
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
                
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        self.tableView.height = view.bounds.height;
        print(view.frame,view.bounds)
    }
    
    @objc func handActionBtn(){
        DDLog("handActionBtn");
        
        let controller = UICtrFromString("DetailViewController");
        navigationController?.pushViewController(controller, animated: true);
    }
    
//   @objc func handActionBtn(sender:UIButton) -> Void{
//        DDLog("__%@",sender.titleLabel?.text as Any);
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
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = UITableViewCellZero.cellWithTableView(tableView);
//        cell.textLabel?.text = String(format: "section_%d,row_%d", indexPath.section,indexPath.row);
//
//        return cell;
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier : String = "identifier";
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier);
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier);
        }
        cell?.separatorInset = .zero;
        cell?.layoutMargins = .zero;
        cell?.textLabel?.text = String.init(format: "section_%d,row_%d", indexPath.section,indexPath.row);

        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DDLog(NSStringFromIndexPath(indexPath as NSIndexPath));
        
        let controller = UICtrFromString("DetailViewController");
        navigationController?.pushViewController(controller, animated: true);
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x:0,y:0,width:0,height:0));
        label.backgroundColor = .green;
        label.text = "header";
        return label;
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 45;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x:0,y:0,width:0,height:0));
        label.backgroundColor = .yellow;

        label.text = "footer";
        return label;
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - layz
//    lazy var tableView: UITableView = {
//        let table = UITableView(frame:self.view.bounds, style:UITableViewStyle.grouped);
//        table.dataSource = self;
//        table.delegate = self;
//
//        return table;
//    }();
    
}
