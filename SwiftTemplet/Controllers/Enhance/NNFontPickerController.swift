//
//  NNFontPickerController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/18.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

///系统字体选择器(用 NNFoldTableController 代替)
class NNFontPickerController: UIViewController {
    
    public var block: ((UIFont?)->Void)?

    var indexP: IndexPath?

    var font: UIFont?

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
    
    
    lazy var data: [(String, [String], Bool)] = {
        return UIFont.familyNames.map({ return ($0, UIFont.fontNames(forFamilyName: $0), false) })
    }()

    // MARK: -lifecycle
    
    convenience init(block: ((UIFont?)->Void)?) {
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
        block?(self.font)
//        DDLog(presentationController, presentedViewController, presentingViewController)
        if presentingViewController != nil {
            navigationController?.dismiss(animated: true, completion: nil)
            return
        }
        navigationController?.popViewController(animated: true);
    }
    
}


extension NNFontPickerController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].2 ? data[section].1.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        
        let fontName = data[indexPath.section].1[indexPath.row]
        cell.textLabel?.font = UIFont(name: fontName, size: UIFont.labelFontSize)
        cell.textLabel?.text = "\(fontName) 中文效果！"

        cell.accessoryType = indexP != nil && indexP == indexPath ? .checkmark : .none
        cell.textLabel?.textColor = indexP != nil && indexP == indexPath ? .systemBlue : .black
        
        cell.backgroundColor = .white.withAlphaComponent(0.5)

        DDLog(cell.textLabel!.font.fontName)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
  
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        let fontName = data[section].0
        label.font = UIFont(name: fontName, size: UIFont.labelFontSize)
        label.text = "\(fontName)"


        let imageView = UIImageView(image: UIImage(named: "img_arrowRight_gray"))
        imageView.isUserInteractionEnabled = true
        imageView.transform = self.data[section].2 == false ? .identity : imageView.transform.rotated(by: CGFloat(Double.pi/2))
        
        let view = UIStackView.init(subviews: [UILabel(), label, imageView, UILabel()],
                                    axis: .horizontal,
                                    spacing: 8,
                                    alignment: .center,
                                    distribution: .fill)
        view.addGestureTap { reco in
            self.data[section].2.toggle()
            tableView.reloadSections([section], with: .fade)
        }
        
        view.backgroundColor = .white
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fontName = data[indexPath.section].1[indexPath.row]
        print("\(Date()) \(#function) \(#line): \(fontName)")
        
        self.font = UIFont(name: fontName, size: UIFont.systemFontSize)
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
