//
//  NNTopSheetView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/14.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand

class NNTopSheetView: UIView,UITableViewDataSource,UITableViewDelegate {
    
    var indexP: IndexPath = IndexPath(row: 0, section: 0)
    weak var parController: UIViewController?
    var viewBlock: CellForRowClosure?
    var viewBlockOne: DidSelectRowClosure?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        btn.titleLabel!.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    convenience init(frame: CGRect, parController: UIViewController!) {
        self.init(frame: frame)
        self.parController = parController
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        btn.titleLabel!.removeObserver(self, forKeyPath: "text", context: nil)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
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
        let itemHeight = (itemList[1] as! String).cgFloatValue()
        return itemHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemList = list[indexPath.row]
        let value0 = itemList[0] as! String
        let value1 = itemList[1] as! String

        let cell = UITableViewCellZero.cellWithTableView(tableView) as! UITableViewCellZero;
        cell.textLabel?.text = value0 + NSStringFromIndexPath(indexPath)
        cell.textLabel?.textAlignment = .center
        cell.isHidden = value1.cgFloatValue() > 0.0 ? false : true
        cell.accessoryType = indexP == indexPath ? .checkmark : .none
        if self.viewBlock != nil && self.viewBlock!(tableView, indexPath) != nil {
            return self.viewBlock!(tableView, indexPath)!;
        }
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
        
        let itemList = list[indexPath.row]
        let value0 = itemList[0] as! String
        btn.setTitle(value0 + NSStringFromIndexPath(indexPath), for: .normal)
        if self.viewBlockOne != nil {
            self.viewBlockOne!(tableView,indexPath)
        }
        dismiss()
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01;
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
    
    // observeValue
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            btn.sizeToFit()
            btn.titleEdgeInsets = UIEdgeInsetMake(0, -btn.imageView!.bounds.width, 0, btn.imageView!.bounds.width)
            btn.imageEdgeInsets = UIEdgeInsetMake(0, btn.titleLabel!.bounds.width+5.0, 0, -btn.titleLabel!.bounds.width-5.0)
        }
    }
    
    //MARK: -func
    func setupTitleView() -> Void {
        
        btn.addActionHandler({ (sender) in
            UIApplication.shared.keyWindow?.endEditing(true)
            if let imgView = (sender as! UIButton).imageView{
                UIView.animate(withDuration: 0.35, animations: {
                    imgView.transform = imgView.transform.isIdentity == true ? imgView.transform.rotated(by: CGFloat(Double.pi)) : CGAffineTransform.identity;
                })
            }
            
            if self.btn.imageView?.transform.isIdentity == false {
                self.show(self.parController!)

            } else {
                self.dismiss()
                
            }
            
        }, for: .touchUpInside)
        
        self.parController!.navigationItem.titleView = btn
    }
    
    func show(_ inController: UIViewController) -> Void {
        self.parController!.view.addSubview(self.containView)
        self.tableView.transform = self.tableView.transform.translatedBy(x: 0, y: -self.tableView.height)

        self.containView.alpha = 0.0
        UIView.animate(withDuration: kDurationShow, animations: {
            self.containView.alpha = 1.0
            
            self.tableView.transform = CGAffineTransform.identity

        }, completion: nil)
        
    }
    
    func dismiss() -> Void {
        UIView.animate(withDuration: kDurationShow, animations: {
            self.containView.alpha = 0.0
            
            self.tableView.transform = self.tableView.transform.translatedBy(x: 0, y: -self.tableView.height)

        }, completion:{ (isFinish:Bool) in
            self.containView.removeFromSuperview()
            
        })
    }
    
    func block(_ action: @escaping CellForRowClosure) -> Void {
        self.viewBlock = action;
    }
    
    func blockSelected(_ action: @escaping DidSelectRowClosure) -> Void {
        self.viewBlockOne = action;
    }
    
    lazy var btn: UIButton = {
        var view = UIButton(type: .custom)
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 35)
        view.setTitle("请选择", for: .normal);
        view.setTitleColor(.white, for: .normal);
        view.setImage(UIImageNamed(kIMG_arrowDown), for: .normal)
        //        view.setBackgroundImage(UIImage(color: .clear), for: .normal)
        view.adjustsImageWhenHighlighted = false
        
//        view.titleEdgeInsets = UIEdgeInsetMake(0, -view.imageView!.bounds.width, 0, view.imageView!.bounds.width)
//        view.imageEdgeInsets = UIEdgeInsetMake(0, view.titleLabel!.bounds.width+5.0, 0, -view.titleLabel!.bounds.width-5.0)
        view.layoutButton(style: 3, imageTitleSpace: 5)
        return view
    }()
    
    //MARK: -lazy
    lazy var alertCtrl: UIAlertController = {
        var alertController = UIAlertController.createSheet("请选择", msg: nil, items:nil, handler: { (controller: UIAlertController, action:UIAlertAction) in
            DDLog("完成取消")
            
            UIView.animate(withDuration: 0.5, animations: {
                self.btn.imageView?.transform = .identity
                
            }, completion: nil)
            
        })
        return alertController
    }()
    
    lazy var list:[[Any]] = {
        var array: [[Any]] = [
            ["标题名称:0", "50.0",],
            ["标题名称:1", "50.0",],
            ["标题名称:2", "50.0",],
            ["标题名称:3", "50.0", ],
            ["标题名称:4", "50.0",],
            
            ]
        return array
    }()
    
    lazy var containView: UIView = {
        var view = UIView(frame: parController!.view.bounds)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3);

        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height*0.4)
        view.addSubview(tableView)
        
        return view
    }()
    
    lazy var tableView: UITableView = {
        var table = UIView.createTableView(bounds, style: .plain, rowHeight: kH_CellHeight)
        table.dataSource = self
        table.delegate = self
        return table
    }()
}

