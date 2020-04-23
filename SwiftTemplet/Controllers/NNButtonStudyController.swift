//
//  NNButtonStudyController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/3/19.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

class NNButtonStudyController: UIViewController{

    var indexP: IndexPath = IndexPath(row: 0, section: 0)
    
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
    
    lazy var topView: NNTopSheetView = {
        var view = NNTopSheetView()
        view.parController = self
//        view.indexP = IndexPath(row: 0, section: 0)
        view.setupTitleView()
        
        return view
    }()
    
    lazy var btn: UIButton = {
        var view = UIButton(type: .custom)
        view.frame = CGRect(x: 0, y: 0, width: 80, height: 35)
        view.setTitle("默认样式", for: .normal);

        view.setTitleColor(UIColor.red, for: .normal)
//        view.adjustsImageWhenHighlighted = false
//        view.titleLabel?.adjustsFontSizeToFitWidth = true
        
        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)

        return view
    }()
    
    lazy var checkBox: UIButton = {
        var view = UIButton(type: .custom)
        view.frame = CGRect(x: 0, y: 0, width: 150, height: 35)
        view.setTitle("绿肥红瘦", for: .normal);

        var normlImage: UIImage = UIImage(named: "photo_cancell")!
        var seletedImage: UIImage = UIImage(named: "photo_select")!
        view.setImage(normlImage, for: .normal)
        view.setImage(seletedImage, for: .selected)
        
        var normlTextColor: UIColor = UIColor.black.withAlphaComponent(0.3)
        var seletedTextColor: UIColor = UIColor.theme
        view.setTitleColor(normlTextColor, for: .normal)
        view.setTitleColor(seletedTextColor, for: .selected)
        
        view.adjustsImageWhenHighlighted = false
        view.titleLabel?.adjustsFontSizeToFitWidth = true
        
        view.sizeToFit()
//        view.titleEdgeInsets = UIEdgeInsetsMake(0, -view.imageView!.bounds.width, 0, view.imageView!.bounds.width)
//        view.imageEdgeInsets = UIEdgeInsetsMake(0, view.titleLabel!.bounds.width+0.0, 0, -view.titleLabel!.bounds.width-0.0)
        view.layoutButton(direction: 3, imageTitleSpace: 2)
        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)

        return view
    }()
    
    lazy var boxButton: NNBoxButton = {
        var view = NNBoxButton(frame: .zero)
        view.isImageRight = true
        view.setTitle("蓝瘦香菇", for: .normal);
        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)

        return view
    }()
    
    lazy var radioButton: NNButton = {
        var view = NNButton(type:.custom);
        view.setTitle("荷塘夜色", for: .normal);

        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)

        return view
    }()
    
    lazy var button: NNButton = {
        var view = NNButton(type:.custom);
        view.setTitle("浪迹天涯", for: .normal);
        
//        var normlImage: UIImage = UIImage(named: "photo_cancell")!
//        var seletedImage: UIImage = UIImage(named: "photo_select")!
//        view.setImage(normlImage, for: .normal)
//        view.setImage(seletedImage, for: .selected)
        
        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)

        return view
    }()
    
    lazy var buttonTop: NNButton = {
        var view = NNButton(type:.custom);
        view.setTitle("浪迹天涯", for: .normal);
        view.direction = .top
        view.iconLocation = .leftTop

        var normlImage: UIImage = UIImage(named: "photo_cancell")!
        var seletedImage: UIImage = UIImage(named: "photo_select")!
        view.setImage(normlImage, for: .normal)
        view.setImage(seletedImage, for: .selected)
        
        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)

        return view
    }()
    
    lazy var buttonBottom: NNButton = {
        var view = NNButton(type:.custom);
//        view.setTitle("浪迹天涯", for: .normal);
        view.direction = .bottom
        view.iconLocation = .leftBottom

        var normlImage: UIImage = UIImage(named: "photo_cancell")!
        var seletedImage: UIImage = UIImage(named: "photo_select")!
        view.setImage(normlImage, for: .normal)
        view.setImage(seletedImage, for: .selected)

        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)

        return view
    }()
    
    lazy var buttonRight: NNButton = {
        var view = NNButton(type:.custom);
        view.setTitle("浪迹天涯", for: .normal);
        view.direction = .right
        view.iconLocation = .rightBottom

        var normlImage: UIImage = UIImage(named: "photo_cancell")!
        var seletedImage: UIImage = UIImage(named: "photo_select")!
        view.setImage(normlImage, for: .normal)
        view.setImage(seletedImage, for: .selected)

        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)
        return view
    }()
    
    @objc func handActionBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        DDLog(sender)
    }

    // MARK: -life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        topView.btn.getViewLayer()
        
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
        
        view.addSubview(checkBox)
        view.addSubview(boxButton)
        view.addSubview(radioButton)
        view.addSubview(button)
        view.addSubview(buttonTop)
        view.addSubview(buttonBottom)
        view.addSubview(buttonRight)
        view.addSubview(btn)

        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
                
        checkBox.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20);
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        boxButton.snp.makeConstraints { (make) in
            make.top.equalTo(checkBox).offset(0);
            make.left.equalTo(checkBox.snp.right).offset(15)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
                
        radioButton.snp.makeConstraints { (make) in
            make.top.equalTo(checkBox).offset(0);
            make.left.equalTo(boxButton.snp.right).offset(15)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
            
        button.snp.makeConstraints { (make) in
            make.top.equalTo(radioButton.snp.bottom).offset(15);
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        buttonTop.snp.makeConstraints { (make) in
            make.top.equalTo(button).offset(0);
            make.left.equalTo(button.snp.right).offset(15)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        
        buttonBottom.snp.makeConstraints { (make) in
            make.top.equalTo(button).offset(0);
            make.left.equalTo(buttonTop.snp.right).offset(15)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        
        buttonRight.snp.makeConstraints { (make) in
            make.top.equalTo(button).offset(0);
            make.left.equalTo(buttonBottom.snp.right).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        btn.snp.makeConstraints { (make) in
            make.bottom.equalTo(buttonRight.snp.bottom).offset(60);
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
    
    //MARK: -func
}

