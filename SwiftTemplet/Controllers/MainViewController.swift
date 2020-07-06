//
//  MainViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/4/24.
//  Copyright © 2018年 BN. All rights reserved.
//

import Foundation
import UIKit
import SwiftExpand


class MainViewController: UIViewController {
    
//    var dataList : NSMutableArray = [];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        title = "Main";
        
//        self.createBarItem(titile:"Next", imgName:nil, isLeft:false, isHidden:false, target:self, action:#selector(MainViewController.handActionBtn));
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "next", style: .done, target: self, action: #selector(handActionBtn));
        
        createBtnBarItem("next", imageName: nil, isLeft: false, isHidden: false) { (item) in
            let controller = UICtrFromString("DetailViewController");
            self.navigationController?.pushViewController(controller, animated: true);
        }

        print(view.frame,view.bounds)

        view.addSubview(tbView);
        
        for _ in 0...3{
            let marr : NSMutableArray = [];
            for j in 0...3{
                marr.add(j);
                
            }
            dataList.add(marr);
        }
        DDLog(dataList);
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
                
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        tbView.sizeHeight = view.bounds.height;
        print(view.frame,view.bounds)
    }
    
    @objc func handActionBtn(){
        DDLog("handActionBtn");
        
        let controller = UICtrFromString("DetailViewController");
        navigationController?.pushViewController(controller, animated: true);
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

extension MainViewController: UITableViewDataSource, UITableViewDelegate{

    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arraySection: NSArray = dataList[section] as! NSArray;
        return arraySection.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    };
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = UITableViewCellZero.dequeueReusableCell(tableView);
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
        
        let controller = UICtrFromString("DetailViewController");
        navigationController?.pushViewController(controller, animated: true);
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x:0,y:0,width:0,height:0));
        label.backgroundColor = .green;
        label.text = "header\(section)";
        return label;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 45;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: CGRect(x:0,y:0,width:0,height:0));
        label.backgroundColor = .yellow;

        label.text = "footer\(section)";
        return label;
    }
    
}
