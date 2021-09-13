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

    //MARK: -lazy
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: self.view.bounds)
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        stackView.spacing = 20
        stackView.axis = .vertical
        //子视图的高度或宽度保持一致
//        stackView.distribution = .fillProportionally
        stackView.distribution = .fillEqually

        return stackView;
    }()

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        let tuple: [(String, Selector)] = [
            ("topSheet", #selector(handleActionItem(_:))),
            ("next", #selector(handleActionItem(_:))),
        ]
                
        navigationItem.rightBarButtonItems = tuple.enumerated().map { e -> UIBarButtonItem in
            let barItem = UIBarButtonItem(title: e.element.0, style: .plain, target: self, action: e.element.1)
            barItem.tag = e.offset
            return barItem
        }
        

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
                
        topView.btn = btn
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
            let color = sender.titleColor(for:.normal)
            DDLog(color)
            DDLog(UIColor.white)
        }, for: .touchUpInside)
        
        view.addSubview(stackView)

        let items = [btn, btn1, gemetryView, textFieldView, textFieldBtnView, chooseView,]
        stackView.addArrangedSubviews(items)

//        view.getViewLayer()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        stackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalToSuperview().offset(-10)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //MARK: -func
    @objc func handActionBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        DDLog(sender)
    }
    
    @objc func handleActionItem(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            let controller = SheetViewController()
            navigationController?.pushViewController(controller, animated: true)
            
        case 1:
            let vc = NNBottomSheetController()
            vc.title = "\(Date())"

            vc.block = { value, item in
                DDLog(value, item.title)
            }
            
            let redVC = UIViewController()
            redVC.view.backgroundColor = .red
            
            vc.setContent(vc: redVC, height: kScreenHeight*0.6)
            
            vc.present()
//            present(vc, animated: true, completion: nil)
//            vc.modalPresentationStyle = .overFullScreen
//            present(vc, animated: true, completion: nil)
            
        default:
            break
        }
    }
    
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("Button", for: .normal)

        view.setImage(UIImage(named: "img_arrowDown_black"), for: .normal)
//        view.setBackgroundImage(UIImage(color: .clear), for: .normal)
        view.adjustsImageWhenHighlighted = false
        return view
    }()
    
    lazy var btn1: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("Button", for: .normal)

        view.setImage(UIImage.img_elemet_increase, for: .normal)
        view.setImage(UIImage.img_elemet_decrease, for: .selected)

//        view.setBackgroundImage(UIImage(color: .clear), for: .normal)
        view.adjustsImageWhenHighlighted = false
        
        view.addActionHandler { sender in
            sender.isSelected.toggle()
            DDLog(sender.currentTitle)
        }
        return view
    }()
    
    //MARK: -lazy
    lazy var alertCtrl: UIAlertController = {
        let alertController = UIAlertController.createSheet("请选择", message: nil, items:nil, handler: { (alertVC, action) in
            DDLog("完成取消")
            
            UIView.animate(withDuration: 0.5, animations: {
                self.btn.imageView?.transform = .identity
                
            }, completion: nil)
            
        })
        return alertController
    }()
    
    
    lazy var gemetryView: NNGeometryView = {
        let view = NNGeometryView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.type = 0
        view.subType = 3
        view.addGestureTap { (recognizer) in
            view.subType = Int(arc4random_uniform(3))
        }
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
            DDLog(sender.currentTitle)
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
            DDLog(sender.currentTitle)
        }
        view.block { (textFieldView, text) in
            DDLog(text)
        }
        return view
    }()

}

extension TitleViewController: NNTitleViewSelectControllerDelegate{
    func titleViewSelect(_ controller: NNTitleViewSelectController, tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DDLog(indexPath.toString)
    }
}
