//
//  NNFoldTableController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/18.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

///折叠列表选择器
class NNFoldTableController<E: Any>: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
        
    public var cellForRowBlock: ((UITableView, IndexPath, E) -> UITableViewCell)?
    
    public var headerViewForSectionBlock: ((UITableView, Int, (String, [E], Bool)) -> UIView)?

    public var block: ((E?)->Void)?

    var indexP: IndexPath?

    var element: E?

    let identifier = String(describing: UITableViewCell.self)
    
    public var tableView: UITableView {
        let view = UITableView(frame: self.view.bounds, style: .plain)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.separatorStyle = .singleLine
        view.separatorInset = .zero
        view.rowHeight = 50
//        view.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        view.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        view.keyboardDismissMode = .onDrag
        view.backgroundColor = .groupTableViewBackground
//        view.tableHeaderView = UIView();
//        view.tableFooterView = UIView()

        view.estimatedRowHeight = 0;
        view.estimatedSectionHeaderHeight = 0;
        view.estimatedSectionFooterHeight = 0;
        
        view.dataSource = self
        view.delegate = self
        
        return view
    }
    
    public var heightForHeaderInSection: CGFloat = 45
    ///数据源(section 标题, 子数组, 折叠/展开)
    public var data: [(String, [E], Bool)] = []

    ///只是箭头
    var indicator: UIImage?

    // MARK: -lifecycle
    convenience init(block: ((E?)->Void)?) {
        self.init()
        self.block = block
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        title = "请选择"
        navigationItem.rightBarButtonItems = ["确定",]
            .map { UIBarButtonItem(title: $0, style: .plain, target: self, action: #selector(actionItem(_:))) }
        
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
    }
    
    @objc func actionItem(_ sender: UIBarButtonItem) {
        block?(element)
//        DDLog(presentationController, presentedViewController, presentingViewController)
        if presentingViewController != nil {
            navigationController?.dismiss(animated: true, completion: nil)
            return
        }
        navigationController?.popViewController(animated: true);
    }
    
    // MARK: -tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].2 ? data[section].1.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        
        cell.backgroundColor = .white.withAlphaComponent(0.5)

        let element = data[indexPath.section].1[indexPath.row]
        guard let newCell = cellForRowBlock?(tableView, indexPath, element) else {
            if let text = element as? String {
                cell.textLabel?.text = text
                
                if let font = UIFont(name: text, size: UIFont.labelFontSize) {
                    cell.textLabel?.font = font
                }

                cell.accessoryType = indexP != nil && indexP == indexPath ? .checkmark : .none
                cell.textLabel?.textColor = indexP != nil && indexP == indexPath ? .systemBlue : .black
            }
            return cell }
        
        return newCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightForHeaderInSection
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = data[section].0

        let imageView = UIImageView(image: indicator ?? UIImage(named: "img_arrowRight_gray"))
        imageView.isUserInteractionEnabled = true
        imageView.isHidden = data[section].1.count == 0
        imageView.transform = data[section].2 == false ? .identity : imageView.transform.rotated(by: CGFloat(Double.pi/2))
        
        let items = [UILabel(), label, imageView, UILabel()].filter { $0.isHidden == false }
        let view = UIStackView.init(subviews: items,
                                    axis: .horizontal,
                                    spacing: 8,
                                    alignment: .center,
                                    distribution: .fill)
        view.addGestureTap { reco in
            self.data[section].2.toggle()
            tableView.reloadSections([section], with: .automatic)
        }
        
        view.backgroundColor = .white
        
        guard let headerView = headerViewForSectionBlock?(tableView, section, data[section]) else {
            return view
        }
        headerView.addGestureTap { reco in
            self.data[section].2.toggle()
            tableView.reloadSections([section], with: .automatic)
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        element = data[indexPath.section].1[indexPath.row]
//        print("\(Date()) \(#function) \(#line): \(element)")
        
        if indexP == nil {
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            indexP = indexPath

        } else if indexP != indexPath  {
            let newCell = tableView.cellForRow(at: indexPath)
            newCell?.accessoryType = .checkmark
            newCell?.textLabel?.textColor = .systemBlue

            let oldCell = tableView.cellForRow(at: indexP!)
            oldCell?.accessoryType = .none
            oldCell?.textLabel?.textColor = .black
            indexP = indexPath
        }
    }
}
