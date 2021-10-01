//
//  NNSheetViewBaseController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/9/28.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

public class NNSheetViewBaseController: UIViewController {

    var indexP = IndexPath(row: 0, section: 0)

    lazy var sheetView: NNSheetView = {
        let view = NNSheetView()
        view.parController = self
        view.indexP = IndexPath(row: 0, section: 0)
        view.setupTitleView()

//        view.delegate = self
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
    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = "SheetViewBase"
        
        sheetView.list = list
        sheetView.tableView.reloadData()
    }
}


//extension NNSheetViewBaseController: NNSheetViewDelegate {
//
//    func sheetView(_ sheetView: NNSheetView, tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return tableView.rowHeight
//    }
//    
//    func sheetView(_ sheetView: NNSheetView, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let itemList = sheetView.list[indexPath.row]
//        let value0 = itemList[0]
//        let value1 = itemList[1]
//        let value2 = itemList[2]
//        let value3 = itemList[3]
//        let value4 = itemList[4]
//
//        let cell = UITableViewCellOne.dequeueReusableCell(tableView)
//        cell.imgViewLeft.image = UIImage(named: "img_meetStandard")
//        cell.labelRight.textAlignment = .left
//
//        cell.labelLeft.text = value0
//        cell.labelRight.text = indexPath.toString
//        cell.isHidden = value1.cgFloatValue <= 0.0
//
//        let isChoose: Bool = (indexP == indexPath)
//        DDLog(isChoose, indexPath.toString)
//        cell.labelLeft.textColor = isChoose ? .systemBlue : .gray;
//        cell.labelRight.textColor = isChoose ? .systemBlue : .gray;
//        cell.accessoryType = isChoose ? .checkmark : .none
//        cell.accessoryType = .checkmark
//
////        cell.getViewLayer()
//        return cell
//    }
//
//    func sheetView(_ sheetView: NNSheetView, tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexP != indexPath  {
//            let newCell = tableView.cellForRow(at: indexPath) as! UITableViewCellOne
//            newCell.accessoryType = .checkmark
//            newCell.labelLeft.textColor = .systemBlue
//            newCell.labelRight.textColor = .systemBlue
//
//            let oldCell = tableView.cellForRow(at: indexP) as! UITableViewCellOne
//            oldCell.accessoryType = .none
//            oldCell.labelLeft.textColor = .gray;
//            oldCell.labelRight.textColor = .gray
//
//            indexP = indexPath
//        }
//        
//        guard let cell = tableView.cellForRow(at: indexPath) as? UITableViewCellOne,
//            let value = cell.labelLeft.text as String? else {
//                return
//        }
//        sheetView.btn.setTitle(value, for: .normal)
//    }
//    
//}



public class NNSheetViewBaseDemoController: NNSheetViewBaseController {

    public override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
