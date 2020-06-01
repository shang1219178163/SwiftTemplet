//
//	NNSheetView.swift
//	MacTemplet
//
//	Created by shang on 2020/05/15 17:43
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit

import SnapKit
import SwiftExpand
        
///
import SwiftExpand

@objc protocol NNSheetViewDelegate{
    @objc func sheetView(_ sheetView: NNSheetView, tableView: UITableView, didSelectRowAt indexPath: IndexPath);

    @objc optional func sheetView(_ sheetView: NNSheetView, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell;
    @objc optional func sheetView(_ sheetView: NNSheetView, tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat;
}

enum SheetDirection: Int {
    case top
    case bottom
    case other
}

@objcMembers class NNSheetView: UIView {
    
    weak var delegate: NNSheetViewDelegate?
    
    var fromDirection: SheetDirection = .other
    
    var indexP: IndexPath = IndexPath(row: 0, section: 0)
    
    weak var parController: UIViewController?
    var sender: UIView?{
        willSet{
            guard let newValue = newValue else { return }
            let rect = parController!.view.convert(newValue.frame, to: parController!.view)
            self.contentView.originY = rect.maxY;
            self.tableView.sizeHeight = parController!.view.bounds.height - rect.maxY
        }
    }

    // MARK: -lifecycle
    deinit {
        btn.titleLabel!.removeObserver(self, forKeyPath: "text", context: nil)
    }
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    // observeValue
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
//            btn.layoutButton(direction: 3, imageTitleSpace: 5)
            btn.sizeToFit()
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.imageView!.bounds.width, 0, btn.imageView!.bounds.width)
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, btn.titleLabel!.bounds.width+5.0, 0, -btn.titleLabel!.bounds.width-5.0)
        }
    }
    
    //MARK: -func
    func setupTitleView() {
        btn.addActionHandler({ (sender) in
            UIApplication.shared.keyWindow?.endEditing(true)
            if let imgView = (sender as! UIButton).imageView{
                imgView.transformRotationCycle()
            }
            
            if self.btn.imageView?.transform.isIdentity == false {
                self.show()
            } else {
                self.dismiss()
            }
            
        }, for: .touchUpInside)
        
        self.parController!.navigationItem.titleView = btn
        fromDirection = .top
    }
    
    func show() {
        changeTableViewLocation(true, inblock: false)
        
        self.parController!.view.addSubview(self.contentView)

        self.contentView.alpha = 0.0
        UIView.animate(withDuration: kDurationShow, animations: {
            self.contentView.alpha = 1.0
            self.changeTableViewLocation(true, inblock: true)

        }) { (finished) in
            if finished {
                self.tableView.reloadData()
            }
        }
    }
    
    func dismiss() {
        changeTableViewLocation(false, inblock: false)
        
        UIView.animate(withDuration: kDurationShow, animations: {
            self.contentView.alpha = 0.0
            self.changeTableViewLocation(true, inblock: false)

            self.btn.imageView?.transform = .identity;

        }, completion:{ (isFinish:Bool) in
            self.contentView.removeFromSuperview()
            
        })
    }
    
    func changeTableViewLocation(_ isShow: Bool, inblock: Bool) {
        switch self.fromDirection {
        case .top:
            if isShow {
                tableView.transform = inblock == false ? tableView.transform.translatedBy(x: 0, y: -tableView.sizeHeight) : .identity
            } else {
                tableView.transform = inblock == true ? tableView.transform.translatedBy(x: 0, y: -tableView.sizeHeight) : .identity
            }
            
        case .bottom:
            contentView.backgroundColor = .white
            if isShow {
                tableView.transform = inblock == false ? tableView.transform.translatedBy(x: 0, y: tableView.sizeHeight) : .identity
            } else {
                tableView.transform = inblock == true ? tableView.transform.translatedBy(x: 0, y: tableView.sizeHeight) : .identity
            }
            
        default:
            break
        }
    }
    
    //MARK: -lazy

    lazy var btn: UIButton = {
        var view = UIButton(type: .custom)
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 35)
        view.setTitle("请选择", for: .normal);
        view.setTitleColor(.white, for: .normal);
        let image = UIImage.image(named: kIMG_arrowDown, podClassName: "SwiftExpand")
        view.setImage(image, for: .normal)
        view.adjustsImageWhenHighlighted = false
        
        view.layoutButton(direction: 3, imageTitleSpace: 5)
//        view.sizeToFit()
//        view.titleEdgeInsets = UIEdgeInsetsMake(0, -view.imageView!.bounds.width, 0, view.imageView!.bounds.width)
//        view.imageEdgeInsets = UIEdgeInsetsMake(0, view.titleLabel!.bounds.width+5.0, 0, -view.titleLabel!.bounds.width-5.0)
        return view
    }()
        
    lazy var list: [[String]] = {
        var array: [[String]] = [
            ["标题名称:0", "50.0",],
            ["标题名称:1", "50.0",],
            ["标题名称:2", "50.0",],
            ["标题名称:3", "50.0",],
            ["标题名称:4", "50.0",],
            
            ]
        return array
    }()
    
    lazy var contentView: UIView = {
        var view = UIView(frame: parController!.view.bounds)
//        var view = UIView(frame: CGRectMake(0, 50, parController!.view.bounds.width, parController!.view.bounds.height))

        view.backgroundColor = UIColor.black.withAlphaComponent(0.3);

        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height*0.5)
        view.addSubview(tableView)
        
        return view
    }()
    
    lazy var tableView: UITableView = {
        var table = UITableView.create(bounds, style: .plain, rowHeight: 50)
        table.dataSource = self
        table.delegate = self
        return table
    }()
}

extension NNSheetView: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let height = delegate?.sheetView?(self, tableView: tableView, heightForRowAt: indexPath) as CGFloat? else {
            return tableView.rowHeight
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let delegateCell = delegate?.sheetView?(self, tableView: tableView, cellForRowAt: indexPath) {
            delegateCell.accessoryType = indexP == indexPath ? .checkmark : .none
            return delegateCell;
        }
        
        let itemList = list[indexPath.row]
        let value0 = itemList[0]
        let value1 = itemList[1]

        let cell = UITableViewCell.dequeueReusableCell(tableView)
        cell.textLabel?.text = value0 + indexPath.string
        cell.textLabel?.textAlignment = .center
        cell.isHidden = value1.cgFloatValue > 0.0 ? false : true
        cell.textLabel?.textColor = indexP == indexPath ? .systemBlue : .gray;
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
            oldCell?.textLabel?.textColor = .gray;
            indexP = indexPath
        }
        dismiss()
        if delegate != nil {
            delegate?.sheetView(self, tableView: tableView, didSelectRowAt: indexPath)
            return
        }
        
        guard let cell = tableView.cellForRow(at: indexPath),
            let value = cell.textLabel?.text as String? else {
                return
        }
        btn.setTitle(value, for: .normal)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1.01;
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
