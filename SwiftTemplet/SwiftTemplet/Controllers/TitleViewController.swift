//
//  TitleViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/14.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand

class TitleViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var indexP: IndexPath = IndexPath(row: 0, section: 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        setupTitleView()
  
        topView.block { (tableView, indexPath) -> UITableViewCell in
            let itemList = self.list[indexPath.row]
            let value0 = itemList[0] as! String
            let value1 = itemList[1] as! String
            let value2 = itemList[2] as! String
            let value3 = itemList[3] as! String
            let value4 = itemList[4] as! String
            let value5 = itemList[5] as! String
            
            let cell = UITableViewCellOne.cellWithTableView(tableView) as! UITableViewCellOne
            cell.labelLeft.text = "标题"
            cell.labelRight.text = NSStringFromIndexPath(indexPath)
            cell.isHidden = value2.cgFloatValue() > 0.0 ? false : true
            cell.accessoryType = self.topView.indexP == indexPath ? .checkmark : .none

            cell.getViewLayer()
            return cell
        }
        
        topView.blockSelected { (tableview, indexPath) in
            DDLog(NSStringFromIndexPath(indexPath))
        }
        
        self.navigationItem.titleView?.getViewLayer()

        
        view.addSubview(gemetryView)
        
        let _ = gemetryView.addGestureTap { (recognizer) in
            self.gemetryView.subType = Int(arc4random_uniform(3))

        }
        
        segmentCtl.frame = CGRect(x: 20, y: gemetryView.frame.maxY+20, width: kScreenWidth - 40, height: 40)
        view.addSubview(segmentCtl)

        
        indicator.frame = CGRect(x: segmentCtl.frame.minX, y: segmentCtl.frame.minY - 1, width: segmentCtl.bounds.width/CGFloat(segmentCtl.numberOfSegments), height: 1)
//        view.layer.addSublayer(indicator)
        segmentCtl.superview?.layer.addSublayer(indicator)


        segmentView.frame = CGRect(x: 20, y: segmentCtl.frame.maxY+20, width: kScreenWidth - 40, height: 40)
        view.addSubview(segmentView)

        //        view.getViewLayer()
    }

    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let itemList = list[indexPath.row]
        let itemHeight = (itemList[2] as! String).cgFloatValue()
        return itemHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemList = list[indexPath.row]
        let value0 = itemList[0] as! String
        let value1 = itemList[1] as! String
        let value2 = itemList[2] as! String
        let value3 = itemList[3] as! String
        let value4 = itemList[4] as! String
        let value5 = itemList[5] as! String
        
        switch (itemList[1] as! String).intValue() {
        case 1:
            let cell = UITableViewCellOne.cellWithTableView(tableView) as! UITableViewCellOne
            cell.labelLeft.text = value0
            cell.labelRight.text = value4
            cell.labelRight.text = NSStringFromIndexPath(indexPath)

            cell.isHidden = value2.cgFloatValue() > 0.0 ? false : true
            cell.getViewLayer()
            return cell
            
        default:
            break
            
        }
        let cell = UITableViewCellZero.cellWithTableView(tableView) as! UITableViewCellZero;
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexP != indexPath  {
            let newCell = tableView.cellForRow(at: indexPath)
            newCell?.accessoryType = .checkmark
            
            let oldCell = tableView.cellForRow(at: indexP)
            oldCell?.accessoryType = .none
            indexP = indexPath
        }
        dismiss()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero);
        //        label.backgroundColor = .green;
        //        label.text = "header\(section)";
        return label;
    }
    
    //MARK: -func
    func setupTitleView() -> Void {        
        btn.frame = CGRect(x: 0, y: 0, width: 150, height: 35)
//        btn.setImage(UIImageColor( .red, size: CGSize(width: 20, height: 20)), for: .normal);
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.imageView!.bounds.width, 0, btn.imageView!.bounds.width)
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, btn.titleLabel!.bounds.width+5, 0, -btn.titleLabel!.bounds.width)

        DDLog(btn.titleEdgeInsets, btn.imageEdgeInsets)
        btn.contentHorizontalAlignment = .left
        btn.addActionHandler({ (sender) in
            UIApplication.shared.keyWindow?.endEditing(true)
            self.show(self)
            
        }, for: .touchUpInside)
     
        navigationItem.titleView = btn
        
        navigationItem.titleView?.getViewLayer()
    }
    
    func show(_ inController: UIViewController) -> Void {
        self.view.addSubview(self.containView)
        self.tableView.y = -self.tableView.height
        
        self.containView.alpha = 0.0
        UIView.animate(withDuration: 0.5, animations: {
            self.containView.alpha = 1.0

            self.btn.imageView?.transform = (self.btn.imageView?.transform.rotated(by:  CGFloat(Double.pi)))!
            self.tableView.y += self.tableView.height
            
        }, completion: nil)
        
    }
    
    func dismiss() -> Void {

        UIView.animate(withDuration: 0.5, animations: {
            self.containView.alpha = 0.0
            
            self.btn.imageView?.transform = (self.btn.imageView?.transform.rotated(by:  CGFloat(Double.pi)))!
            self.tableView.y -= self.tableView.height
            
        }, completion:{ (isFinish:Bool) in
            self.containView.removeFromSuperview()

        })
    }
    
    lazy var btn: UIButton = {
        var view = UIButton(type: .custom)
        view.setTitle("闭包的回调方法", for: .normal);
        view.setTitleColor(.white, for: .normal);
        view.setImage(UIImageNamed(kIMG_arrowDown), for: .normal)
//        view.setBackgroundImage(UIImage(color: .clear), for: .normal)
        view.adjustsImageWhenHighlighted = false

        return view
    }()
    
    //MARK: -lazy
    lazy var alertCtrl: UIAlertController = {
        var alertController = UIAlertController.createSheet("请选择", itemDic:nil, cancelTitle: "取消", cancellStyle: .destructive, completion: { (action:UIAlertAction) in
            DDLog("完成取消")
            
            UIView.animate(withDuration: 0.5, animations: {
                self.btn.imageView?.transform = .identity
                
            }, completion: nil)
            
        })
        return alertController
    }()

    lazy var list:[[Any]] = {
        //        return self.allList.first!;
        var array: [[Any]] = [
            ["商品名称:", "1", "60.0", "", "cardName","0"],
            ["商品名称:", "1", "60.0", "", "cardName","0"],
            ["商品名称:", "1", "60.0", "", "cardName","0"],
            ["商品名称:", "1", "60.0", "", "cardName","0"],
            ["商品名称:", "1", "60.0", "", "cardName","0"],

            ]
        return array
    }()
    
    lazy var containView: UIView = {
        var view = UIView(frame: self.view.bounds)
        view.backgroundColor = .green
        
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height*0.4)
        view.addSubview(tableView)
        
        return view
    }()
    
    lazy var gemetryView: BNGeometryView = {
        var view = BNGeometryView(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        view.type = 0
        view.subType = 3
        return view
    }()
    
    //MARK: -lazy
    lazy var segmentCtl: UISegmentedControl = {
        var view = UIView.createSegmentRect( .zero, items: ["是","否","其他"], selectedIdx: 0, type: 2);
        view.addActionHandler({ (sender:UIControl) in
            
            if let control = sender as? UISegmentedControl {
                DDLog(control.selectedSegmentIndex)
                
                var rect = self.indicator.frame
                rect.origin.x = control.frame.minX + CGFloat(control.selectedSegmentIndex) * self.indicator.frame.width
                self.indicator.frame = rect
                
            }
            
        }, for: .valueChanged)
        return view
    }()
    
    lazy var indicator: CALayer = {
        var layer = CALayer()
//        layer.frame = CGRect(x: 0, y: -1, width: segmentCtl.bounds.width/CGFloat(segmentCtl.numberOfSegments), height: 1)
        layer.backgroundColor = UIColor.theme.cgColor
        return layer
    }()
    
    
    lazy var segmentView: BNSegmentView = {
        var view = BNSegmentView(frame: .zero)
        view.segmentCtl.itemList = ["one","two","three","four"]
        view.indicatorHeight = 1
        view.type = 2
        view.block({ (segmentView: BNSegmentView, control: UISegmentedControl) in
            DDLog(control.selectedSegmentIndex)
            self.goController("EntryViewController", obj: nil, objOne: nil)

        })
        return view
    }()
    
    lazy var topView: BNTopSheetView = {
        var view = BNTopSheetView()
        view.parController = self
        view.indexP = IndexPath(row: 0, section: 0)
        view.setupTitleView()
        
        return view
    }()
}
