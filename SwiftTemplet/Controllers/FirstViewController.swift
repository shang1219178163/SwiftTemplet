//
//  FirstViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SDWebImage

class FirstViewController: UIViewController {

    //MARK: - layz
    //    lazy var tableView: UITableView = {
    //        let table = UITableView(frame:self.view.bounds, style:UITableViewStyle.grouped);
    //        table.dataSource = self;
    //        table.delegate = self;
    //
    //        return table;
    //    }();
    
    var imgList = ["https://www.huizhubang.com/attachment/rotation/9.jpg",
        "https://www.huizhubang.com/attachment/rotation/8.jpg",
        "https://www.huizhubang.com/attachment/rotation/7.jpg",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
//        title = NSStringFromSelector(#function);
        createBarItem( .done, isLeft: false) {[weak self] (obj:AnyObject?) in
            self!.goController("IOPAuthRechargeController", obj: "1234" as AnyObject, objOne: nil)
        }
        view.addSubview(tbView);
        
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
        tbView.reloadData();
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tbView.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate{
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = UITableViewCellDatePicker.dequeueReusableCell(tableView);
            cell.labelLeft.text = "日期选择:";
            cell.textfield.asoryView(true, text: "小时")
            cell.block { ( sender: UITableViewCellDatePicker, view: NNDatePicker, idx: Int) in
                let dateStr = DateFormatter.stringFromDate(view.datePicker.date, fmt: kDateFormat)

                DDLog(dateStr);
                
            }
        
            cell.getViewLayer();
            return cell;
        case 1:
            let cell = UITableViewCellOne.dequeueReusableCell(tableView)
            
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
            let cell = UITableViewCellOne.dequeueReusableCell(tableView, identifier: "UITableViewCellOne1")
            
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
            let cell = UITableViewCellOne.dequeueReusableCell(tableView, identifier: "UITableViewCellOne2")
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
            let cell = UITableViewCellOne.dequeueReusableCell(tableView, identifier: "UITableViewCellOne3")
            
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
            let cell = UITableViewCellOne.dequeueReusableCell(tableView, identifier: "UITableViewCellOne4")
            
            cell.labelLeft.text = String(format: "section_%d,row_%d", indexPath.section,indexPath.row);
            cell.labelRight.text = "990" + "\(indexPath.row)";
            cell.imgViewLeft.image = UIImage(named: "dragon");
//            cell.imgViewRight.isHidden = true;

            
            //随机元素
//            imgList = imgList.sorted(by: {$0 < $1});
//            imgList = imgList.sorted(by:<);
//            let imgUrl = imgList.randomElement()!;
//            cell.imgViewLeft.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: kIMG_defaultPortrait))
//            cell.type = 1;
            
            cell.getViewLayer();
            return cell;
        case 6:
            let cell = UITableViewCellOne.dequeueReusableCell(tableView, identifier: "UITableViewCellOne4")
            
            cell.labelLeft.text = String(format: "section_%d,row_%d", indexPath.section,indexPath.row);
            cell.labelRight.text = "990" + "\(indexPath.row)";
            cell.imgViewLeft.image = UIImage(named: "dragon");
            cell.imgViewRight.isHidden = true;
            
//随机元素
//            imgList = imgList.sorted(by: {$0 < $1});
//            imgList = imgList.sorted(by:<);
//            let imgUrl = imgList.randomElement()!;
//            cell.imgViewLeft.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: kIMG_defaultPortrait))
//            cell.type = 1;
            
            cell.getViewLayer();
            return cell;
        default:
            break
        }
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        
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
        
}


extension FirstViewController: UIScrollViewDelegate{

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetToShow: CGFloat = 60.0;
        let alpha: CGFloat = (offsetToShow - scrollView.contentOffset.y) / offsetToShow;
        
//        DDLog("\(#function):\(alpha)")
        let image = UIImage(color: UIColor.theme.alpha(alpha))
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
}
