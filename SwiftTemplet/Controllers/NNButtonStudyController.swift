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

    var normlImage: UIImage = UIImage(named: "icon_selected_no_default")!
    var seletedImage: UIImage = UIImage(named: "icon_selected_yes_green")!
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("默认样式", for: .normal);

        view.setTitleColor(UIColor.red, for: .normal)
//        view.adjustsImageWhenHighlighted = false
//
        
        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)

        return view
    }()
    
    lazy var checkBox: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("绿肥红瘦", for: .normal);

        view.setImage(normlImage, for: .normal)
        view.setImage(seletedImage, for: .selected)
        
        var normlTextColor: UIColor = UIColor.black.withAlphaComponent(0.3)
        var seletedTextColor: UIColor = UIColor.theme
        view.setTitleColor(normlTextColor, for: .normal)
        view.setTitleColor(seletedTextColor, for: .selected)
        
        view.adjustsImageWhenHighlighted = false
        
        
        view.sizeToFit()
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
        var view = NNButton(type:.custom);
//        var view = NNButton(frame: .zero)

        view.setTitle("浪迹天涯", for: .normal)
        view.setImage(normlImage, for: .normal)
        view.setImage(seletedImage, for: .selected)
        
        view.setBorderColor(.lightGray, for: .normal)
        view.setBorderColor(.systemBlue, for: .selected)
        view.setCornerRadius(4, for: .normal)
        
        view.observerBlock = { keyPath, sender, change in
            guard let keyPath = keyPath,
                  let sender = sender,
                  let change = change
                  else { return }
            DDLog(keyPath)
        }

        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)
        return view
    }()
    
    lazy var buttonTop: NNButton = {
        let view = NNButton(type:.custom);
        view.setTitle("浪迹天涯", for: .normal)
        
        view.setImage(normlImage, for: .normal)
        view.setImage(seletedImage, for: .selected)
        
        view.setBorderColor(.lightGray, for: .normal)
        view.setBorderColor(.systemBlue, for: .selected)
        view.setCornerRadius(4, for: .normal)

        view.direction = .top
        view.iconLocation = .leftTop
        
        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)
        return view
    }()
    
    lazy var buttonBottom: NNButton = {
        let view = NNButton(type:.custom)
        view.setTitle("浪迹天涯", for: .normal)

        view.setImage(normlImage, for: .normal)
        view.setImage(seletedImage, for: .selected)
        
        view.setBorderColor(.lightGray, for: .normal)
        view.setBorderColor(.systemBlue, for: .selected)
        view.setCornerRadius(4, for: .normal)

        view.direction = .bottom
        view.iconLocation = .leftBottom

        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)
        return view
    }()
    
    lazy var buttonRight: NNButton = {
        let view = NNButton(type:.custom);
        view.setTitle("浪迹天涯", for: .normal);
        
        view.setImage(normlImage, for: .normal)
        view.setImage(seletedImage, for: .selected)
        
        view.setBorderColor(.lightGray, for: .normal)
        view.setBorderColor(.systemBlue, for: .selected)
        view.setCornerRadius(4, for: .normal)

        view.direction = .right
        view.iconLocation = .rightBottom

        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)
        return view
    }()
    
    lazy var buttonAdd: NNButton = {
        let view = NNButton(type:.custom);
        view.setTitle("浪迹天涯", for: .normal);
        
        view.setImage(normlImage, for: .normal)
        view.setImage(seletedImage, for: .selected)
        view.titleLabel?.isHidden = true

        view.setBorderColor(.lightGray, for: .normal)
        view.setBorderColor(.systemBlue, for: .selected)
        view.setCornerRadius(4, for: .normal)
        
        view.direction = .none
        view.iconLocation = .rightTop
        
        view.iconSize = GGSizeMake(20, 20)
        view.iconOffset = UIOffsetMake(8, -8)
        view.eventInsetDX = 8;
        view.eventInsetDY = 8;
        view.iconBtn.setBackgroundImage(UIImage(named: "icon_delete"), for: .normal)
        view.iconBtn.addTarget(self, action: #selector(handActionDelete(_:)), for: .touchUpInside)

        view.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)
        return view
    }()
    
    @objc func handActionBtn(_ sender: NNButton) {
        sender.isSelected = !sender.isSelected
        DDLog(sender.frame, sender.titleLabel?.frame)
        
    }

    @objc func handActionDelete(_ sender: UIButton) {
        DDLog(sender)
    }
    
    // MARK: -life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(button)
        view.addSubview(buttonRight)
        view.addSubview(buttonTop)
        view.addSubview(buttonBottom)
        view.addSubview(buttonAdd)

        view.addSubview(btn)
        view.addSubview(checkBox)
        view.addSubview(boxButton)
        view.addSubview(radioButton)
        
//        if #available(iOS 14.0, *) {
//            let destruct = UIAction(title: "Destruct", attributes: .destructive) { DDLog($0.title) }
//
//            let items = UIMenu(title: "More", options: .displayInline, children: [
//                UIAction(title: "Item 1", image: UIImage(systemName: "mic"), handler: { DDLog($0.title) }),
//                UIAction(title: "Item 2", image: UIImage(systemName: "envelope"), handler: { DDLog($0.title) }),
//                UIAction(title: "Item 3", image: UIImage(systemName: "flame.fill"), handler: { DDLog($0.title) }),
//                UIAction(title: "Item 4", image: UIImage(systemName: "video"), state: .on, handler: { DDLog($0.title) })
//            ])
//
//            button.menu = UIMenu(title: "", children: [items, destruct])
//        }
                
//        button.isHidden = true
        checkBox.isHidden = true

//        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
                
        button.frame = CGRectMake(20, 20, 120, 30);
        buttonRight.frame = CGRectMake(20, button.frame.maxY + 20, 120, 35);
        buttonTop.frame = CGRectMake(20, buttonRight.frame.maxY + 20, 120, 35*2);
        buttonBottom.frame = CGRectMake(20, buttonTop.frame.maxY + 20, 120, 35*2);
        buttonAdd.frame = CGRectMake(20, buttonBottom.frame.maxY + 20, 75, 75);
        
        btn.frame = CGRectMake(20, buttonAdd.frame.maxY + 20, 120, 35);
        checkBox.frame = CGRectMake(20, btn.frame.maxY + 20, 120, 35);
        boxButton.frame = CGRectMake(20, checkBox.frame.maxY + 20,  120, 35);
        radioButton.frame = CGRectMake(20, boxButton.frame.maxY + 20,  120, 35);

        return
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

