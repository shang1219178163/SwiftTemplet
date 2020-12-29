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

class TitleViewController: NNTitleViewSelectController{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let list: [[String]] = [
                ["商品名称00:", "60.0", "", "cardName","0"],
                ["商品名称11:", "60.0", "", "cardName","0"],
                ["商品名称22:", "60.0", "", "cardName","0"],
                ["商品名称33:", "60.0", "", "cardName","0"],
                ["商品名称44:", "60.0", "", "cardName","0"],
                ["商品名称55:", "60.0", "", "cardName","0"],
                ["商品名称66:", "60.0", "", "cardName","0"],

                ]
        delegate = self
        topView.list = list
        topView.tableView.reloadData()
        
        view.addSubview(gemetryView)
        
        _ = gemetryView.addGestureTap { (recognizer) in
            self.gemetryView.subType = Int(arc4random_uniform(3))
        }
        
        let rightBtn = UIButton.createBtnBarItem("next")
        rightBtn.addActionHandler({ (sender) in
            let controller = SheetViewController()
            self.navigationController?.pushViewController(controller, animated: true);
        })
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)

        view.addSubview(segmentCtlOne)
        view.addSubview(checkBox)
        view.addSubview(boxButton)
        view.addSubview(radioButton)
        view.addSubview(button)
        view.addSubview(buttonTop)
        view.addSubview(buttonBottom)
        view.addSubview(buttonRight)
        
        view.addSubview(textFieldView)
        view.addSubview(textFieldBtnView)
        view.addSubview(chooseView)

        
        topView.btn = radioButton
        topView.btn.addActionHandler({[weak self] (sender) in
            guard let self = self else { return }
            UIApplication.shared.keyWindow?.endEditing(true)
            if let imgView = sender.imageView{
                imgView.transformRotationCycle()
            }
            
            if self.topView.btn.imageView?.transform.isIdentity == false {
                self.topView.show()
            } else {
                self.topView.dismiss()
            }
            
        }, for: .touchUpInside)
        view.getViewLayer()
        
        let obj = 3.repeatArray("334")
        DDLog(obj)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        segmentCtlOne.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100);
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        checkBox.snp.makeConstraints { (make) in
            make.top.equalTo(segmentCtlOne.snp.bottom).offset(15);
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
        
        textFieldView.snp.makeConstraints { (make) in
            make.top.equalTo(button.snp.bottom).offset(50);
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        
        textFieldBtnView.snp.makeConstraints { (make) in
            make.top.equalTo(textFieldView.snp.bottom).offset(5);
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        
        chooseView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
            make.height.equalTo(50)
        }
        
        topView.sender = radioButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        DDLog("viewWillAppear")
        
//        let model = Person()
//
//        var dic = [String: Any]()
//        model.enumeratePropertys { (property_t, name, value) in
//            dic[name] = value ?? "=="
//        }
//        DDLog(dic)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //MARK: -func
    @objc func handActionBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        DDLog(sender)
    }
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("闭包的回调方法", for: .normal);
        view.setTitleColor(.white, for: .normal);
        view.setImage(UIImage(named: kIMG_arrowDown), for: .normal)
//        view.setBackgroundImage(UIImage(color: .clear), for: .normal)
        view.adjustsImageWhenHighlighted = false

        return view
    }()
    
    //MARK: -lazy
    lazy var alertCtrl: UIAlertController = {
        let alertController = UIAlertController.createSheet("请选择", message: nil, items:nil, handler: { (action) in
            DDLog("完成取消")
            
            UIView.animate(withDuration: 0.5, animations: {
                self.btn.imageView?.transform = .identity
                
            }, completion: nil)
            
        })
        return alertController
    }()
    
    
    lazy var gemetryView: NNGeometryView = {
        let view = NNGeometryView(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
        view.type = 0
        view.subType = 3
        return view
    }()

    lazy var segmentCtlOne: NNSegmentedControl = {
        let view = NNSegmentedControl(frame: .zero)
        view.showStyle = .bottomLine
        view.selectedColor = .systemBlue
        view.items = ["是", "否", "其他"]
        view.addActionHandler({ (sender) in
            DDLog(sender)
            
        }, for: .valueChanged)
        return view;
    }()
    
    lazy var checkBox: UIButton = {
        let view = UIButton(type: .custom)
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
        
//        view.sizeToFit()
//        view.titleEdgeInsets = UIEdgeInsetsMake(0, -view.imageView!.bounds.width, 0, view.imageView!.bounds.width)
//        view.imageEdgeInsets = UIEdgeInsetsMake(0, view.titleLabel!.bounds.width+0.0, 0, -view.titleLabel!.bounds.width-0.0)
        view.layoutButton(direction: 3, imageTitleSpace: 2)
        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)

        return view
    }()
    
    lazy var boxButton: NNBoxButton = {
        let view = NNBoxButton(frame: .zero)
        view.isImageRight = true
        view.setTitle("蓝瘦香菇", for: .normal);
        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)

        return view
    }()
    
    lazy var radioButton: NNButton = {
        let view = NNButton(type:.custom);
        view.setTitle("荷塘夜色", for: .normal);
        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)

        return view
    }()
    
    lazy var button: NNButton = {
        let view = NNButton(type:.custom);
        view.setTitle("浪迹天涯", for: .normal);
        var normlImage: UIImage = UIImage(named: "photo_cancell")!
        var seletedImage: UIImage = UIImage(named: "photo_select")!
        view.setImage(normlImage, for: .normal)
        view.setImage(seletedImage, for: .selected)
        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)

        return view
    }()
    
    lazy var buttonTop: NNButton = {
        let view = NNButton(type:.custom);
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
        let view = NNButton(type:.custom);
        view.setTitle("浪迹天涯", for: .normal);
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
        let view = NNButton(type:.custom);
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
    
    lazy var chooseView: IOPOrdersChooseView = {
        let view = IOPOrdersChooseView(frame: .zero)
        view.count = 0
        view.amount = "0.00"
        return view
    }()
    
    lazy var textFieldView: NNTextFieldView = {
        let view = NNTextFieldView(frame: .zero)
        view.label.text = "手机号码:"
        view.textfield.placeholder = "请输入手机号码"
//        view.label.isHidden = true
        view.btn.addActionHandler { (sender) in
            
            DDLog(sender.currentTitle ?? "无标题")
        }
        view.block { (textFieldView, text) in
            DDLog(text)
        }
        return view
    }()
    
    lazy var textFieldBtnView: NNTextFieldView = {
        let view = NNTextFieldView(frame: .zero)
        view.label.text = "验  证  码:"
        view.textfield.placeholder = "请输入验证码"
        view.btn.isHidden = true
        view.label.isHidden = true

        view.btn.addActionHandler { (sender) in
            
            DDLog(sender.currentTitle ?? "无标题")
        }
        view.block { (textFieldView, text) in
            DDLog(text)
        }
        return view
    }()

}

extension TitleViewController: NNTitleViewSelectControllerDelegate{
    func titleViewSelect(_ controller: NNTitleViewSelectController, tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DDLog(indexPath.string)
    }
}
