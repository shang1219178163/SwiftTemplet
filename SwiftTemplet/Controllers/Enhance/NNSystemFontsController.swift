//
//  NNSystemFontsController.swift
//  TMP_Example
//
//  Created by Bin Shang on 2021/6/18.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class NNSystemFontsController: UIViewController {
    
    var block: ((UIFont) -> Void)?
    

    let identifier = String(describing: UITableViewCell.self)
    
    var tableView: UITableView {
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
    
    
    lazy var fontList: [[String: Any]] = {
        var fontList = [[String: Any]]()
        
        UIFont.familyNames.forEach { familyName in
            var familyDic = [String: Any]()
            familyDic["name"] = familyName

            let fontDics = UIFont.fontNames(forFamilyName: familyName).map({
                return ["name": $0,
                        "font": UIFont(name: $0, size: UIFont.labelFontSize) as Any
                        ]
            })
            familyDic["fonts"] = fontDics
            fontList.append(familyDic)
        }
        return fontList
    }()
    

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}


extension NNSystemFontsController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return fontList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dic = fontList[section]
        guard let fonts = dic["fonts"] as? [Any] else {
            return 0 }
        return fonts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        
        let dic = fontList[indexPath.section]
        guard let fonts = dic["fonts"] as? [Any] else {
            return cell }
        guard let fontDic = fonts[indexPath.row] as? [String: Any],
              let font = fontDic["font"] as? UIFont,
              let fontName = fontDic["name"] as? String
              else {
            return cell }
        cell.textLabel?.font = font.withSize(15)
        cell.textLabel?.text = "\(fontName) 中文效果！English."

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let dic = fontList[section]
        guard let name = dic["name"] as? String else {
            return "" }
        return "    \(name)"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dic = fontList[indexPath.section]
        guard let fonts = dic["fonts"] as? [Any] else {
            return }
        guard let fontDic = fonts[indexPath.row] as? [String: Any],
              let font = fontDic["font"] as? UIFont,
              let fontName = fontDic["name"] as? String
              else {
            return }
        print("\(Date()) \(#function) \(#line): \(fontName)")
        block?(font)
    }
}
