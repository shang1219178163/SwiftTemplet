//
//  ListViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/9.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SDWebImage

class ListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView);

        if title == nil {
            title = self.controllerName;
        }
        
        for _ in 0...0 {
            let marr : NSMutableArray = [];
            for j in 0...3{
                marr.add(j);
                
            }
            dataList.add(marr);
        }
        
        //        DDLog(dataList);
        tableView.reloadData();
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count;
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arraySection : NSArray = dataList[section] as! NSArray;
        return arraySection.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60;
    };
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = UITableViewCellZero.cellWithTableView(tableView) as! UITableViewCellZero;
        let cell = UITableViewCellTextField.cellWithTableView(tableView) as! UITableViewCellTextField;

       

        cell.getViewLayer();
        return cell;
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UITableViewCellZero;
        
        DDLog("------",cell.isSelected);

//        cell.isSelected = !cell.isSelected

//        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero);
        label.backgroundColor = .green;
        label.text = "header\(section)";
        return label;
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 45;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero);
        label.backgroundColor = .yellow;
        
        label.text = "footer\(section)";
        return label;
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
