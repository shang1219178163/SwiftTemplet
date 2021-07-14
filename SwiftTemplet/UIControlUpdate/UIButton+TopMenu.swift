//
//  UIButton+DropMenu.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/7/8.
//  Copyright © 2021 BN. All rights reserved.
//


import UIKit

public class NNTopMenuTarget: NSObject {
    
    public weak var button: UIButton?

    private(set) lazy var tableView: UITableView = {
        let view = UITableView(rect: .zero, style: .plain)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        view.rowHeight = 55
        view.tableFooterView = UIView()
        view.backgroundView = UIView()

        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    private lazy var dimView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = .black.withAlphaComponent(0.3)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapAction(_:)))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    public var items: [String] = [String]()

    public var tableViewHeight: CGFloat = 275

    public var isTapBackViewDismiss: Bool = true

    public var indexP = IndexPath(row: 0, section: 0)

    private weak var senderView: UIView?

    public var selectedBlock:((Int)->Void)?

    public var cellForRowBlock: ((UITableView, IndexPath) -> UITableViewCell)?

    // MARK: -functions
    
    func show(_ animated: Bool = true) {
        senderView = UIApplication.shared.keyWindow
                
        tableView.frame = CGRect(x: 0,
                                 y: UIScreen.navBarHeight,
                                 width: UIScreen.sizeWidth,
                                 height: 0)
        
        var dimViewRect = dimView.frame
        dimViewRect.origin.y = UIScreen.navBarHeight
        dimView.frame = dimViewRect
        
        senderView?.addSubview(dimView)
        senderView?.addSubview(tableView)
        tableView.reloadData()

        var rect = tableView.frame
        rect.size.height = tableViewHeight

        UIView.animate(withDuration: animated ? 0.35 : 0) {
            self.tableView.frame = rect
        }
    }
    
    @objc func dismiss(_ animated: Bool = true) {
        var rect = tableView.frame
        rect.size.height = 0
        
        UIView.animate(withDuration: animated ? 0.35 : 0) {
            self.tableView.frame = rect

        } completion: { isFinished in
            if !isFinished {
                return
            }
            self.dimView.alpha = 1
            self.dimView.removeFromSuperview()
            self.tableView.removeFromSuperview()
            
            self.button?.isSelected = false
        }
    }
    
    @objc func handleTapAction(_ gesture: UITapGestureRecognizer) {
        if isTapBackViewDismiss == false {
            return
        }
        dismiss(true)
    }
    
}

extension NNTopMenuTarget: UITableViewDataSource, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = cellForRowBlock?(tableView, indexPath) {
            cell.accessoryType = indexP == indexPath ? .checkmark : .none
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = indexP == indexPath ? .systemBlue : .black
        cell.accessoryType = indexP == indexPath ? .checkmark : .none
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexP != indexPath {
            let newCell = tableView.cellForRow(at: indexPath)
            newCell?.accessoryType = .checkmark
            
            let oldCell = tableView.cellForRow(at: indexP)
            oldCell?.accessoryType = .none
            indexP = indexPath
        }
        selectedBlock?(indexPath.row)
        dismiss(true)
    }
    
}

public extension UIButton{
    private struct AssociateKeys {
        static var topMenuTarget = "UIButton" + "DropMenu"
    }
    /// dropMenu 对象
    var topMenuTarget: NNTopMenuTarget {
        get {
            if let obj = objc_getAssociatedObject(self, &AssociateKeys.topMenuTarget) as? NNTopMenuTarget {
                return obj
            }

            let target = NNTopMenuTarget()
            target.button = self
            objc_setAssociatedObject(self, &AssociateKeys.topMenuTarget, target, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            return target
        }
    }
}

