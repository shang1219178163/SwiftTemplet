//
//  BNPickListView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/12.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class BNPickListView: UIView,UITableViewDataSource,UITableViewDelegate {

    var title: String?
    var tips: String?
//    var indexP: IndexPath?
    var indexP: IndexPath = IndexPath(row: 0, section: 0)

    private var viewBlock: ((BNPickListView, IndexPath) -> Void)? = nil

    var itemList: [[String]]? {
        willSet{
            DDLog(newValue as Any)
            list.removeAll()
            for e in (newValue?.enumerated())! {
                list.append(e.element.first!)
            }
            tableView.reloadData()
            
            setupContainViewSize(list);
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = UIScreen.main.bounds
        self.containView.y = UIScreen.height

        self.addSubview(containView)
        self.addSubview(backView)

        let _ = backView.addGestureTap { (sender:UIGestureRecognizer) in
            if sender is UITapGestureRecognizer {
                self.dismiss()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
        return tableView.rowHeight
    };
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCellZero.cellWithTableView(tableView) as! UITableViewCellZero;
        cell.textLabel!.text = list[indexPath.row]
        cell.textLabel!.textAlignment = .center
        cell.accessoryType = indexP == indexPath ? .checkmark : .none
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
        
        if viewBlock != nil {
            viewBlock!(self, indexPath)
        }
        dismiss()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height = title != nil ? tableView.rowHeight : 0.01;
        return height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let height = title != nil ? tableView.rowHeight : 0.01;
        return UIView.createSectionView(tableView, text: title, textAlignment: .center, height:height)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let height = tips != nil ? tableView.rowHeight : 0.01;
        return height
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let height = tips != nil ? tableView.rowHeight : 0.01;
        return UIView.createSectionView(tableView, text: tips, textAlignment: .left, height: height)
    }
    
    // MARK: - funtions
    func show() -> Void {
        assert(itemList != nil)
        
        setupContainViewSize(list)
        
        UIApplication.shared.keyWindow?.addSubview(self);
        backView.height = UIScreen.height - containView.height
        containView.y = UIScreen.height
        
        UIView.animate(withDuration: 0.5, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.5);
            self.containView.y -= self.containView.frame.height;

        }, completion: { (isFinished: Bool) in
            
        });
    }
    
    func dismiss() -> Void {
        UIView.animate(withDuration: 0.5, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0);
            self.containView.y = UIScreen.height
            
        }) { (isFinished) in
            self.removeFromSuperview();
        }
    }
    
    func block(_ action:@escaping ((BNPickListView, IndexPath) -> Void)) -> Void {
        self.viewBlock = action;
    }
    
    func setupContainViewSize(_ list:[String]) -> Void {
        var rows = list.count + (title != nil ? 1 : 0) + (tips != nil ? 1 : 0)
        rows = rows < 6 ? rows : 6
        self.containView.height = tableView.rowHeight * CGFloat(rows)
    }
    
    //MARK: - layz
    lazy var containView:UIView = {
        let view = UIView(frame: self.bounds)
        
        tableView.frame = view.bounds
        view.addSubview(tableView)
        return view;
    }()
    
    lazy var backView:UIView = {
        let view = UIView(frame: self.bounds)
        view.backgroundColor = self.backgroundColor
        return view;
    }();

    lazy var tableView: UITableView = {
        var table = UIView.createTableView(bounds, style: .grouped, rowHeight: kH_CellHeight);
            table.dataSource = self
            table.delegate = self
        
        return table
    }()
    
    lazy var list: [String] = {
        var list = ["one","two","three"];
        return list
    }()
    
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = ((touches as NSSet).anyObject() as AnyObject)     //进行类  型转化
//        let point = touch.location(in:self)     //获取当前点击位置
//        let pointprevious = touch.previousLocation(in:self)     //和上面一样
//
//        if self.containView.frame.contains(point) {
//            return
//        }
//        
//    }
}
