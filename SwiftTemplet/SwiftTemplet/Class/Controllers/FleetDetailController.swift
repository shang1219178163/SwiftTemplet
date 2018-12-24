//
//  FleetDetailController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/24.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SDWebImage

class FleetDetailController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        if title == nil {
            title = self.controllerName;
        }
        
        view.addSubview(tableView);
        dataList = ["车场名称:","入\(kBlankTwo)口:",kBlankFour,"出\(kBlankTwo)口:",kBlankFour,"开始时间:","结束时间:","操作用户:","状\(kBlankTwo)态:",]
//        dataList = ["车场名称:","入        口:","                 ","出        口:","                 ","开始时间:","结束时间:","操作用户:","状        态:",]

        tableView.reloadData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);

        
        DDLog(dataList);
    }
    
    
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    };
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let cell = UITableViewCellOne.cellWithTableView(tableView) as! UITableViewCellOne;
        
        cell.labelLeft.text = String(format: "section_%d,row_%d", indexPath.section,indexPath.row);
        cell.labelRight.text = "990" + "\(indexPath.row)";
//            let imgUrl = imgList.randomElement()!;
//            cell.imgViewLeft.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: kIMG_defaultPortrait))
        cell.imgViewRight.isHidden = true;
        
        cell.labelLeft.text = (dataList[indexPath.row] as! String)
        cell.labelLeft.textAlignment = .justified
        cell.labelRight.textAlignment = .center
        cell.type = 1;
        
        let cellList = [1,3]
        
        if cellList.contains(indexPath.row) {
            cell.separatorInset = UIEdgeInsetsMake(0, 100, 0, 0)
//            cell.layoutMargins = UIEdgeInsetsMake(0, 100, 0, 0)
        }
//        cell.getViewLayer();
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSStringFromCGRect(tableView.frame)
        DDLog(NSStringFromIndexPath(indexPath));
        
        let controller = UICtrFromString("DetailViewController");
        navigationController?.pushViewController(controller, animated: true);
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kY_GAP;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero);
        label.backgroundColor = .green;
        label.text = "header\(section)";
        return label;
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 80;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero);
        label.backgroundColor = .yellow;
        label.isUserInteractionEnabled = true
//        label.text = "footer\(section)";
        
        btn.setTitle("关闭车队模式", for: .normal)
        label.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.left.right.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(45)
            
        }
        
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
    
    private lazy var btn:UIButton = {
        var view:UIButton = UIButton.createBtn(rect: .zero, title: "+ 新建", font: 17 as AnyObject, image: nil, tag: kTAG_BTN, type: 3) { (sender:UIControl) in
            if let obj = sender as? UIButton {
                DDLog(obj.currentTitle as Any)
                
            }
        }
        return view;
    }();
}



