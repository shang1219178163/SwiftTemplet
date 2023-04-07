//
//  NNPopView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/10/9.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class NNPopView: UIView {

    weak var parController: UIViewController?
    var indexP: IndexPath = IndexPath(row: 0, section: 0)
    var sender: UIButton? = nil {
        willSet{
            guard let newValue = newValue, let parController = parController else { return }
            let rect = parController.view.convert(newValue.frame, to: parController.view)
            
            self.originX = 0;
            self.originY = rect.maxY;
            self.sizeWidth = kScreenWidth;
            self.sizeHeight = parController.view.frame.maxY - newValue.frame.maxY;
            
            let maxHeight = parController.view.sizeHeight - frame.minY - tableView.rowHeight*2;
            
            tableView.sizeHeight = CGFloat(list.count)*tableView.rowHeight;
            if tableView.sizeHeight >= maxHeight {
                tableView.sizeHeight = maxHeight;
            }
        }
    }
    
    var list: [[String]] = [["无数据", "70.0"]] {
        didSet{
            tableView.reloadData();
        }
    }

    var blockCellForRow: ((UITableView, IndexPath) ->UITableViewCell?)?
    var blockDidSelectRow: ((UITableView, IndexPath) ->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.black.withAlphaComponent(0.3);
        addSubview(tableView);
        
        sender?.titleLabel!.addObserver(self, forKeyPath: "text", options: .new, context: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
    }
      
    // observeValue
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            sender!.sizeToFit()
            sender!.titleEdgeInsets = UIEdgeInsets(0, -sender!.imageView!.bounds.width, 0, sender!.imageView!.bounds.width)
            sender!.imageEdgeInsets = UIEdgeInsets(0, sender!.titleLabel!.bounds.width+5.0, 0, -sender!.titleLabel!.bounds.width-5.0)
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    // MARK: -funtions
    func show() {
        parController!.view.addSubview(self)
        
        self.alpha = 0.0
        UIView.animate(withDuration: kDurationShow, animations: {
            self.alpha = 1.0
            self.sender?.imageView?.transformRotationCycle()
            
        }, completion: nil)
        
    }
    
    func dismiss() {
        UIView.animate(withDuration: kDurationShow, animations: {
            self.alpha = 0.0
            self.sender?.imageView?.transformRotationCycle()

        }, completion:{ (isFinish:Bool) in
            self.removeFromSuperview()
            
        })
    }
    
    func viewBlockCellForRow(_ action: @escaping ((UITableView, IndexPath) ->UITableViewCell?)) {
        self.blockCellForRow = action;
    }
    
    func viewBlockDidSelectRow(_ action: @escaping ((UITableView, IndexPath) ->Void)) {
        self.blockDidSelectRow = action;
    }
    
    //MARK: -lazy
    @objc lazy var tableView: UITableView = {
        var table = UITableView(rect: bounds, style: .plain, rowHeight: 60)
        table.dataSource = self
        table.delegate = self
        return table
    }()

}

extension NNPopView: UITableViewDataSource, UITableViewDelegate {

    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let itemList = list[indexPath.row]
        let itemHeight = itemList[1].cgFloatValue
        return itemHeight;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemList = list[indexPath.row]
        let value0 = itemList[0]
        let value1 = itemList[1]
        
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        cell.textLabel?.text = value0
        cell.textLabel?.textColor = indexP == indexPath ? UIColor.theme : UIColor.black;
        cell.accessoryType = indexP == indexPath ? .checkmark : .none
        cell.isHidden = value1.cgFloatValue > 0.0 ? false : true
        if self.blockCellForRow != nil && self.blockCellForRow!(tableView, indexPath) != nil {
            return self.blockCellForRow!(tableView, indexPath)!;
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
        tableView.reloadData();
        
//        let itemList = list[indexPath.row]
//        DDLog(itemList);
        
        if self.blockDidSelectRow != nil {
            self.blockDidSelectRow!(tableView,indexPath)
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
}
