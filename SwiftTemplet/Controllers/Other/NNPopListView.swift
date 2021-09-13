//
//	NNPopListView.swift
//	MacTemplet
//
//	Created by shang on 2020/05/21 15:27
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit

import SnapKit
import SwiftExpand
        
///
class NNPopListView: UIView {

    var title: String?
    var tips: String?
//    var indexP: IndexPath?
    var indexP: IndexPath = IndexPath(row: 0, section: 0)

    private var viewBlock: ((NNPopListView, IndexPath) -> Void)? = nil

    var itemList: [[String]]? {
        willSet{
            DDLog(newValue)
            list.removeAll()
            for e in (newValue?.enumerated())! {
                list.append(e.element.first!)
            }
            tableView.reloadData()
            
            setupContentViewSize(list);
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = UIScreen.main.bounds
        self.contentView.originY = UIScreen.sizeHeight

        self.addSubview(contentView)
        self.addSubview(backView)

        backView.isHidden = true
        _ = backView.addGestureTap { (sender:UIGestureRecognizer) in
            if sender is UITapGestureRecognizer {
                self.dismiss()
            }
        }
        
        _ = addGestureTap { (sender:UIGestureRecognizer) in
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
    
//    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//
//    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard isUserInteractionEnabled, !isHidden, alpha >= 0.01, self.point(inside: point, with: event) else { return nil }
        
        for e in subviews.enumerated().reversed() {
            let convertPoint = e.element.convert(point, from: self)
            if let hitView = e.element.hitTest(convertPoint, with: event) as UIView? {
                return hitView
            }
        }
        return super.hitTest(point, with: event)
    }
    
    // MARK: -funtions
    func show() {
        assert(itemList != nil)
        
        setupContentViewSize(list)
        
        UIApplication.shared.keyWindow?.endEditing(true)
        UIApplication.shared.keyWindow?.addSubview(self)
        backView.sizeHeight = UIScreen.sizeHeight - contentView.sizeHeight
        contentView.originY = UIScreen.sizeHeight
        
        UIView.animate(withDuration: 0.5, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.3);
            self.contentView.originY -= self.contentView.frame.height;

        }, completion: { (isFinished: Bool) in
            
        });
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.5, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0);
            self.contentView.originY = UIScreen.sizeHeight
            
        }) { (isFinished) in
            self.removeFromSuperview();
        }
    }
    
    func block(_ action:@escaping ((NNPopListView, IndexPath) -> Void)) {
        self.viewBlock = action;
    }
    
    func setupContentViewSize(_ list:[String]) {
        var rows = list.count + (title != nil ? 1 : 0) + (tips != nil ? 1 : 0)
        rows = rows < 6 ? rows : 6
        self.contentView.sizeHeight = tableView.rowHeight * CGFloat(rows)
    }
    
    //MARK: - layz
    lazy var contentView: UIView = {
        let view = UIView(frame: self.bounds)
        
        tableView.frame = view.bounds
        view.addSubview(tableView)
        return view;
    }()
    
    lazy var backView: UIView = {
        let view = UIView(frame: self.bounds)
        view.backgroundColor = self.backgroundColor
        return view;
    }();

    lazy var tableView: UITableView = {
        let table = UITableView(rect: bounds, style: .grouped, rowHeight: 60);
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
//        if self.contentView.frame.contains(point) {
//            return
//        }
//
//    }
}

extension NNPopListView: UITableViewDataSource,UITableViewDelegate {
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
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        cell.textLabel?.text = list[indexPath.row]
        cell.textLabel?.textAlignment = .center
        
        cell.textLabel?.textColor = indexP == indexPath ? .systemBlue : .gray
        cell.accessoryType = indexP == indexPath ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexP != indexPath  {
            let newCell = tableView.cellForRow(at: indexPath)
            newCell?.accessoryType = .checkmark
            newCell?.textLabel?.textColor = .systemBlue

            let oldCell = tableView.cellForRow(at: indexP)
            oldCell?.accessoryType = .none
            oldCell?.textLabel?.textColor = .gray

            indexP = indexPath
        }
        viewBlock?(self, indexPath)
        dismiss()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height: CGFloat = title != nil ? tableView.rowHeight : 0.01;
        return height
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let height: CGFloat = title != nil ? tableView.rowHeight : 0.01;
        return tableView.createSectionViewLabel(height) { (label) in
            label.text = self.title
            label.textAlignment = .center
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let height: CGFloat = tips != nil ? tableView.rowHeight : 0.01;
        return height
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let height: CGFloat = tips != nil ? tableView.rowHeight : 0.01;
        return tableView.createSectionViewLabel(height) { (label) in
            label.text = self.tips
            label.textAlignment = .left
        }
    }

}
