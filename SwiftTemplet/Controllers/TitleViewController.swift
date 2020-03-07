//
//  TitleViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/14.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand

class TitleViewController: UIViewController{

    var indexP: IndexPath = IndexPath(row: 0, section: 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        setupTitleView()
        topView.block { (tableView, indexPath) -> UITableViewCell in
            let itemList = self.list[indexPath.row]
            let value0 = itemList[0]
            let value1 = itemList[1]
            let value2 = itemList[2]
            let value3 = itemList[3]
            let value4 = itemList[4]
            let value5 = itemList[5]

            let cell = UITableViewCellOne.dequeueReusableCell(tableView)
            cell.imgViewLeft.image = UIImage(named: "img_meetStandard")
            cell.labelLeft.text = "标题"
            cell.labelRight.text = indexPath.string
            cell.isHidden = value2.cgFloatValue <= 0.0
            cell.accessoryType = self.topView.indexP == indexPath ? .checkmark : .none
            
//            cell.getViewLayer()
            return cell
        }

        topView.blockSelected { (tableview, indexPath) in
            DDLog(indexPath.string)
        }
        
//        self.navigationItem.titleView?.getViewLayer()

        
        view.addSubview(gemetryView)
        
        let _ = gemetryView.addGestureTap { (recognizer) in
            self.gemetryView.subType = Int(arc4random_uniform(3))

        }
        
        createBtnBarItem("other") { (tap, supView, idx) in
            let ctrl = OthersViewController()
            self.navigationController?.pushViewController(ctrl, animated: true)
        }

        view.addSubview(segmentView)
        view.addSubview(segmentCtlOne)
        view.addSubview(checkBox)
        view.addSubview(checkBoxNew)
        view.addSubview(chooseView)

        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        segmentView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100);
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        segmentCtlOne.snp.makeConstraints { (make) in
            make.top.equalTo(segmentView.snp.bottom).offset(20);
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        
        checkBox.sizeToFit()
        checkBox.snp.makeConstraints { (make) in
            make.top.equalTo(segmentCtlOne.snp.bottom).offset(20);
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(checkBox.frame.size.width + 15)
//            make.height.equalTo(40)
        }
        
        checkBoxNew.snp.makeConstraints { (make) in
            make.top.equalTo(checkBox.snp.bottom).offset(20);
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        chooseView.snp.makeConstraints { (make) in
            make.top.equalTo(checkBoxNew.snp.bottom).offset(20);
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.height.equalTo(50)
        }
    }
    
    //MARK: -func
    func setupTitleView() {        
        btn.frame = CGRect(x: 0, y: 0, width: 150, height: 35)
//        btn.setImage(UIImageColor( .red, size: CGSize(width: 20, height: 20)), for: .normal);
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.imageView!.bounds.width, 0, btn.imageView!.bounds.width)
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, btn.titleLabel!.bounds.width+5, 0, -btn.titleLabel!.bounds.width)

        DDLog(btn.titleEdgeInsets, btn.imageEdgeInsets)
        btn.contentHorizontalAlignment = .left
        btn.addActionHandler({ (sender) in
            if let imgView = (sender as! UIButton).imageView{
                UIView.animate(withDuration: 0.35, animations: {
                    imgView.transform = imgView.transform.isIdentity == true ? imgView.transform.rotated(by: CGFloat(Double.pi)) : .identity;
                })
            }

            UIApplication.shared.keyWindow?.endEditing(true)
            self.show(self)
            
        }, for: .touchUpInside)
     
        navigationItem.titleView = btn
        
        navigationItem.titleView?.getViewLayer()
    }
    
    func show(_ inController: UIViewController) {
        self.view.addSubview(self.containView)
        self.tbView.originY = -self.tbView.sizeHeight
        
        self.containView.alpha = 0.0
        UIView.animate(withDuration: 0.5, animations: {
            self.containView.alpha = 1.0

            self.tbView.originY += self.tbView.sizeHeight
            
        }, completion: nil)
        
    }
    
    func dismiss() {
        UIView.animate(withDuration: 0.5, animations: {
            self.containView.alpha = 0.0
            self.tbView.originY -= self.tbView.sizeHeight
            
        }, completion:{ (isFinish:Bool) in
            self.containView.removeFromSuperview()

        })
    }
    
    lazy var btn: UIButton = {
        var view = UIButton(type: .custom)
        view.setTitle("闭包的回调方法", for: .normal);
        view.setTitleColor(.white, for: .normal);
        view.setImage(UIImageNamed(kIMG_arrowDown), for: .normal)
//        view.setBackgroundImage(UIImage(color: .clear), for: .normal)
        view.adjustsImageWhenHighlighted = false

        return view
    }()
    
    //MARK: -lazy
    lazy var alertCtrl: UIAlertController = {
        var alertController = UIAlertController.createSheet("请选择", msg: nil, items:nil, handler: { (controller: UIAlertController, action:UIAlertAction) in
            DDLog("完成取消")
            
            UIView.animate(withDuration: 0.5, animations: {
                self.btn.imageView?.transform = .identity
                
            }, completion: nil)
            
        })
        return alertController
    }()

    lazy var list:[[String]] = {
        var array: [[String]] = [
            ["商品名称:", "1", "60.0", "", "cardName","0"],
            ["商品名称:", "1", "60.0", "", "cardName","0"],
            ["商品名称:", "1", "60.0", "", "cardName","0"],
            ["商品名称:", "1", "60.0", "", "cardName","0"],
            ["商品名称:", "1", "60.0", "", "cardName","0"],

            ]
        return array
    }()
    
    lazy var containView: UIView = {
        var view = UIView(frame: self.view.bounds)
        view.backgroundColor = .green
        
        tbView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height*0.4)
        view.addSubview(tbView)
        
        return view
    }()
    
    lazy var gemetryView: NNGeometryView = {
        var view = NNGeometryView(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        view.type = 0
        view.subType = 3
        return view
    }()
    
    
    lazy var segmentView: NNSegmentViewZero = {
        var view = NNSegmentViewZero(frame: .zero)
        view.segmentCtl.itemList = ["one","two","three","four"]
        view.indicatorHeight = 1
        view.type = 1
        view.block({ (segmentView: NNSegmentViewZero, control: UISegmentedControl) in
            DDLog(control.selectedSegmentIndex)


        })
        return view
    }()
    
    lazy var topView: NNTopSheetView = {
        var view = NNTopSheetView()
        view.parController = self
        view.indexP = IndexPath(row: 0, section: 0)
        view.setupTitleView()
        
        return view
    }()


    lazy var segmentCtlOne: NNSegmentedControl = {
        let view = NNSegmentedControl(frame: .zero)
        view.type = 2;
        view.selectedColor = .red
        view.itemList = ["是", "否", "其他"]
        view.addActionHandler({ (control) in
            guard let sender = control as? UISegmentedControl else { return }
            DDLog(sender)
        }, for: .valueChanged)
        return view;
    }()
    
    lazy var checkBox: UIButton = {
        var view = UIButton(type: .custom)
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 35)
        view.setTitle("绿肥红瘦", for: .normal);
        view.setTitleColor(.theme, for: .normal);
        view.setImage(UIImageNamed("photo_cancell"), for: .normal)
        //        view.setBackgroundImage(UIImage(color: .clear), for: .normal)
        view.adjustsImageWhenHighlighted = false
        
        view.sizeToFit()
//        view.titleEdgeInsets = UIEdgeInsetsMake(0, -view.imageView!.bounds.width, 0, view.imageView!.bounds.width)
//        view.imageEdgeInsets = UIEdgeInsetsMake(0, view.titleLabel!.bounds.width+0.0, 0, -view.titleLabel!.bounds.width-0.0)
        view.layoutButton(style: 1, imageTitleSpace: 2)
        view.addActionHandler({ (control) in
            control.isSelected = !control.isSelected
            
//            let name = control.isSelected == true ? "photo_select" : "photo_cancell";
//            view.setImage(UIImageNamed(name), for: .normal)
            
            guard let sender = control as? UIButton else { return }
            if let sender = control as? UIButton {
            }
            DDLog(sender)
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var checkBoxNew: NNCheckBoxButton = {
        var view = NNCheckBoxButton(frame: .zero)
        view.isImageRight = true
        view.setTitle("蓝瘦香菇", for: .normal);

        view.addActionHandler({ (control) in
            control.isSelected = !control.isSelected
            guard let sender = control as? UIButton else { return }
            if let sender = control as? UIButton {
            }
            DDLog(sender)
        }, for: .touchUpInside)
        return view
    }()
    
    lazy var chooseView: IOPOrdersChooseView = {
        var view = IOPOrdersChooseView(frame: .zero)
        view.count = 0
        view.amount = 0.00
        return view
    }()
    
    
}


//extension TitleViewController: UITableViewDataSource, UITableViewDelegate{
//    //    MARK: - tableView
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1;
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return list.count;
//    };
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let itemList = list[indexPath.row]
//        let itemHeight = (itemList[2]).cgFloatValue
//        return itemHeight
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let itemList = list[indexPath.row]
//        let value0 = itemList[0]
//        let value1 = itemList[1]
//        let value2 = itemList[2]
//        let value3 = itemList[3]
//        let value4 = itemList[4]
//        let value5 = itemList[5]
//
//        switch (itemList[1]).intValue {
//        case 1:
//            let cell = UITableViewCellOne.dequeueReusableCell(tableView)
//                cell.isHidden = value2.cgFloatValue <= 0.0
//            cell.labelLeft.text = value0
//            cell.labelRight.text = value4
//            cell.labelRight.text = indexPath.string
//
//            cell.getViewLayer()
//            return cell
//
//        default:
//            break
//
//        }
//        let cell = UITableViewCellZero.dequeueReusableCell(tableView)
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexP != indexPath  {
//            let newCell = tableView.cellForRow(at: indexPath)
//            newCell?.accessoryType = .checkmark
//
//            let oldCell = tableView.cellForRow(at: indexP)
//            oldCell?.accessoryType = .none
//            indexP = indexPath
//        }
//        dismiss()
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 10;
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UIView();
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0.01;
//    }
//
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let label = UILabel(frame: .zero);
//        //        label.backgroundColor = .green;
//        //        label.text = "header\(section)";
//        return label;
//    }
//}
