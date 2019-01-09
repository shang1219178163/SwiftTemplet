//
//  FirstViewController.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SDWebImage

class FirstViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var imgList = ["https://www.huizhubang.com/attachment/rotation/9.jpg",
        "https://www.huizhubang.com/attachment/rotation/8.jpg",
        "https://www.huizhubang.com/attachment/rotation/7.jpg",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
//        title = NSStringFromSelector(#function);
        
        view.addSubview(tableView);
        
        DDLog(self);
        DDLog(NSStringFromClass(self.classForCoder));

        if title == nil {
            title = self.controllerName;
        }
        
        for _ in 0...1 {
            let marr : NSMutableArray = [];
            for j in 0...6{
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
        
        switch indexPath.row {
        case 0:
            let cell = UITableViewCellDatePicker.cellWithTableView(tableView) as! UITableViewCellDatePicker;
            cell.labelLeft.text = "日期选择:";
            cell.block { (view0, view1, idx) in
                DDLog(view0,view1,idx);
                
            }
            cell.getViewLayer();
            return cell;
        case 1:
            let cell = UITableViewCellOne.cellWithTableView(tableView) as! UITableViewCellOne;
            
            cell.labelLeft.text = String(format: "section_%d,row_%d", indexPath.section,indexPath.row);
            cell.labelRight.text = "990" + "\(indexPath.row)";
            cell.imgViewLeft.image = UIImage(named: "dragon");
            
            //随机元素
            imgList = imgList.sorted(by: {$0 < $1});
            imgList = imgList.sorted(by:<);
            let imgUrl = imgList.randomElement()!;
            cell.imgViewLeft.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: kIMG_defaultPortrait))
//        cell.type = 1;
            
            cell.getViewLayer();
            return cell;
        case 2:
            let cell = UITableViewCellOne.cellWithTableView(tableView, identifier: "UITableViewCellOne1") as! UITableViewCellOne
            
            cell.labelLeft.text = String(format: "section_%d,row_%d", indexPath.section,indexPath.row);
            cell.labelRight.text = "990" + "\(indexPath.row)";
            cell.imgViewLeft.image = UIImage(named: "dragon");
            
            //随机元素
            imgList = imgList.sorted(by: {$0 < $1});
            imgList = imgList.sorted(by:<);
            let imgUrl = imgList.randomElement()!;
            cell.imgViewLeft.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: kIMG_defaultPortrait))
            cell.type = 1;
            
            cell.getViewLayer();
            return cell;
            
        case 3:
            let cell = UITableViewCellOne.cellWithTableView(tableView, identifier: "UITableViewCellOne2") as! UITableViewCellOne
            
            cell.labelLeft.text = String(format: "section_%d,row_%d", indexPath.section,indexPath.row);
            cell.labelRight.text = "990" + "\(indexPath.row)";
            cell.imgViewLeft.image = UIImage(named: "dragon");
            cell.imgViewRight.isHidden = true;

            //随机元素
            imgList = imgList.sorted(by: {$0 < $1});
            imgList = imgList.sorted(by:<);
            let imgUrl = imgList.randomElement()!;
            cell.imgViewLeft.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: kIMG_defaultPortrait))
//            cell.type = 1;
            cell.labelRight.textAlignment = .right
            
            cell.getViewLayer();
            return cell;
        case 4:
            let cell = UITableViewCellOne.cellWithTableView(tableView, identifier: "UITableViewCellOne3") as! UITableViewCellOne
            
            cell.labelLeft.text = String(format: "section_%d,row_%d", indexPath.section,indexPath.row);
            cell.labelRight.text = "990" + "\(indexPath.row)";
            cell.imgViewLeft.image = UIImage(named: "dragon");
            cell.imgViewRight.isHidden = true;

            //随机元素
            imgList = imgList.sorted(by: {$0 < $1});
            imgList = imgList.sorted(by:<);
            let imgUrl = imgList.randomElement()!;
            cell.imgViewLeft.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: kIMG_defaultPortrait))
            cell.type = 1;
            
            cell.getViewLayer();
            return cell;
            
        case 5:
            let cell = UITableViewCellOne.cellWithTableView(tableView, identifier: "UITableViewCellOne4") as! UITableViewCellOne
            
            cell.labelLeft.text = String(format: "section_%d,row_%d", indexPath.section,indexPath.row);
            cell.labelRight.text = "990" + "\(indexPath.row)";
            cell.imgViewLeft.image = UIImage(named: "dragon");
//            cell.imgViewRight.isHidden = true;

            //随机元素
            imgList = imgList.sorted(by: {$0 < $1});
            imgList = imgList.sorted(by:<);
            let imgUrl = imgList.randomElement()!;
            cell.imgViewLeft.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: kIMG_defaultPortrait))
            cell.type = 1;
            
            cell.getViewLayer();
            return cell;
        default:
            let cell = UITableViewCellZero.cellWithTableView(tableView) as! UITableViewCellZero;
            return cell;
            
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell");
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSStringFromCGRect(tableView.frame)
        DDLog(NSStringFromIndexPath(indexPath));
        
        let controller = UICtrFromString("DetailViewController");
        navigationController?.pushViewController(controller, animated: true);
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
    
    //MARK: - layz
    //    lazy var tableView: UITableView = {
    //        let table = UITableView(frame:self.view.bounds, style:UITableViewStyle.grouped);
    //        table.dataSource = self;
    //        table.delegate = self;
    //
    //        return table;
    //    }();
    
}

