//
//  NNTitleViewSelectController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/29.
//  Copyright © 2020 BN. All rights reserved.
//

import SnapKit
import SwiftExpand


@objc protocol NNTitleViewSelectControllerDelegate{
    @objc func titleViewSelect(_ controller: NNTitleViewSelectController, tableView: UITableView, didSelectRowAt indexPath: IndexPath);

    @objc optional func titleViewSelect(_ controller: NNTitleViewSelectController, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell;
    @objc optional func titleViewSelect(_ controller: NNTitleViewSelectController, tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat;
}

/// 导航栏下拉菜单
@objcMembers class NNTitleViewSelectController: UIViewController{
    
    weak var delegate: NNTitleViewSelectControllerDelegate?

    lazy var topView: NNTopSheetView = {
        var view = NNTopSheetView()
        view.parController = self
        view.indexP = IndexPath(row: 0, section: 0)
        view.setupTitleView()

        view.delegate = self
        return view
    }()
    
    lazy var list: [[String]] = {
        var array: [[String]] = [
            ["商品0:", "50.0", "", "cardName","0"],
            ["商品1:", "50.0", "", "cardName","0"],
            ["商品2:", "50.0", "", "cardName","0"],
            ["商品3:", "50.0", "", "cardName","0"],
            ["商品4:", "50.0", "", "cardName","0"],
            ["商品5:", "50.0", "", "cardName","0"],
            ["商品6:", "50.0", "", "cardName","0"],
            ["商品7:", "50.0", "", "cardName","0"],
            ["商品8:", "50.0", "", "cardName","0"],
            ["商品9:", "50.0", "", "cardName","0"],

            ]
        return array
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        topView.list = list
        topView.tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    //MARK: -func

    
}

extension NNTitleViewSelectController: NNTopSheetViewDelegate {

    func topSheetView(_ sheetView: NNTopSheetView, tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let height = delegate?.titleViewSelect?(self, tableView: tableView, heightForRowAt: indexPath) as CGFloat? else {
            return tableView.rowHeight
        }
        return height
    }
    
    func topSheetView(_ sheetView: NNTopSheetView, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let delegateCell = delegate?.titleViewSelect?(self, tableView: tableView, cellForRowAt: indexPath) {
            delegateCell.accessoryType = topView.indexP == indexPath ? .checkmark : .none
            return delegateCell;
        }
        
        let itemList = sheetView.list[indexPath.row]
        let value0 = itemList[0]
        let value1 = itemList[1]
        let value2 = itemList[2]
        let value3 = itemList[3]
        let value4 = itemList[4]

        let cell = UITableViewCellOne.dequeueReusableCell(tableView)
        cell.imgViewLeft.image = UIImage(named: "img_meetStandard")
        cell.labelRight.textAlignment = .left

        cell.labelLeft.text = value0
        cell.labelRight.text = indexPath.string
        cell.isHidden = value1.cgFloatValue <= 0.0

//        cell.getViewLayer()
        return cell
    }

    func topSheetView(_ sheetView: NNTopSheetView, tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.titleViewSelect(self, tableView: tableView, didSelectRowAt: indexPath)
        guard let cell = tableView.cellForRow(at: indexPath) as? UITableViewCellOne,
            let value = cell.labelLeft.text as String? else {
                return
        }
        sheetView.btn.setTitle(value, for: .normal)
    }
}

