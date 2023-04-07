//
//  NNButtonStudyController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/3/19.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
//import SnapKit
import SwiftExpand

class NNButtonStudyController: UIViewController{

    var normlImage = UIImage(named: "icon_selected_no_default")!
    var seletedImage = UIImage(named: "icon_selected_yes_green")!
    
    lazy var btn: UIButton = {
        let sender = UIButton(type: .custom)
        sender.setTitle("默认样式", for: .normal);
//        sender.adjustsImageWhenHighlighted = false
        
        if #available(iOS 13.0, *) {
            sender.setImage(UIImage.chevron_down, for: .normal)
            sender.setImage(UIImage.chevron_up, for: .selected)
        }

        sender.sizeToFit()
        sender.layoutButton(direction: 3, imageTitleSpace: 8)
        sender.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)

        setupTopMenuTarget(sender)
        return sender
    }()
    
    lazy var checkBox: UIButton = {
        let sender = UIButton(type: .custom)
        sender.setTitle("绿肥红瘦", for: .normal);

        sender.setImage(normlImage, for: .normal)
        sender.setImage(seletedImage, for: .selected)
        
        var normlTextColor: UIColor = UIColor.black.withAlphaComponent(0.3)
        var seletedTextColor: UIColor = UIColor.theme
        sender.setTitleColor(normlTextColor, for: .normal)
        sender.setTitleColor(seletedTextColor, for: .selected)
        
        sender.adjustsImageWhenHighlighted = false
        sender.sizeToFit()
//        sender.titleEdgeInsets = UIEdgeInsets(0, -sender.imageView!.bounds.width, 0, sender.imageView!.bounds.width)
//        sender.imageEdgeInsets = UIEdgeInsets(0, sender.titleLabel!.bounds.width+0.0, 0, -sender.titleLabel!.bounds.width-0.0)
        sender.layoutButton(direction: 0, imageTitleSpace: 16)
        sender.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)

//        sender.getViewLayer()
        return sender
    }()
    
    lazy var radioButton: NNButton = {
        let sender = NNButton(type:.custom);
        sender.setTitle("荷塘夜色", for: .normal);
        sender.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)

        return sender
    }()
    
        
    lazy var button: NNButton = {
        var sender = NNButton(type:.custom);
//        var sender = NNButton(frame: .zero)

        sender.setTitle("浪迹天涯", for: .normal)
        sender.setImage(normlImage, for: .normal)
        sender.setImage(seletedImage, for: .selected)
        
        sender.setBorderColor(.lightGray, for: .normal)
        sender.setBorderColor(.systemBlue, for: .selected)
        sender.setCornerRadius(4, for: .normal)
        sender.setCornerRadius(14, for: .selected)
//        sender.setTitleColor(.green, for: .normal)
//        sender.setTitleColor(.systemBlue, for: .selected)
        sender.setTitleColor(.darkGray, for: .disabled)

        sender.setBorderColor(.darkGray, for: .disabled)
        sender.setBorderWidth(4, for: .disabled)

//        sender.isEnabled = false
        sender.observerBlock = { keyPath, sender, change in
            guard let keyPath = keyPath,
                  let sender = sender,
                  let change = change
                  else { return }
            DDLog(keyPath)
        }

        sender.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)
        return sender
    }()
    
    lazy var buttonTop: NNButton = {
        let sender = NNButton(type:.custom);
        sender.setTitle("浪迹天涯", for: .normal)
        
        sender.setImage(normlImage, for: .normal)
        sender.setImage(seletedImage, for: .selected)
        
        sender.setBorderColor(.lightGray, for: .normal)
        sender.setBorderColor(.systemBlue, for: .selected)
        sender.setCornerRadius(4, for: .normal)

        sender.direction = .top
        sender.iconLocation = .leftTop
        
        sender.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)
        return sender
    }()
    
    lazy var buttonBottom: NNButton = {
        let sender = NNButton(type:.custom)
        sender.setTitle("浪迹天涯", for: .normal)

        sender.setImage(normlImage, for: .normal)
        sender.setImage(seletedImage, for: .selected)
        
        sender.setBorderColor(.lightGray, for: .normal)
        sender.setBorderColor(.systemBlue, for: .selected)
        sender.setCornerRadius(4, for: .normal)

        sender.direction = .bottom
        sender.iconLocation = .leftBottom

        sender.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)
        return sender
    }()
    
    lazy var buttonRight: NNButton = {
        let sender = NNButton(type:.custom);
        sender.setTitle("浪迹天涯", for: .normal);
        
        sender.setImage(normlImage, for: .normal)
        sender.setImage(seletedImage, for: .selected)
        
        sender.setBorderColor(.lightGray, for: .normal)
        sender.setBorderColor(.systemBlue, for: .selected)
        sender.setCornerRadius(4, for: .normal)

        sender.direction = .right
        sender.iconLocation = .rightBottom

        sender.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)
        return sender
    }()
    
    lazy var buttonAdd: NNButton = {
        let sender = NNButton(type:.custom);
        sender.setTitle("浪迹天涯", for: .normal);
        
        sender.setImage(normlImage, for: .normal)
        sender.setImage(seletedImage, for: .selected)
        sender.titleLabel?.isHidden = true

        sender.setBorderColor(.lightGray, for: .normal)
        sender.setBorderColor(.systemBlue, for: .selected)
        sender.setCornerRadius(4, for: .normal)
        
        sender.direction = .none
        sender.iconLocation = .rightTop
        
        sender.iconSize = CGSize(20, 20)
        sender.iconOffset = UIOffset(8, -8)
        sender.eventInsetDX = 8;
        sender.eventInsetDY = 8;
        sender.iconBtn.setBackgroundImage(UIImage(named: "icon_delete"), for: .normal)
        sender.iconBtn.addTarget(self, action: #selector(handActionDelete(_:)), for: .touchUpInside)

        sender.addTarget(self, action: #selector(handActionBtn(_:)), for: .touchUpInside)
        return sender
    }()

    
    // MARK: -life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = vcName
        view.addSubview(button)
        view.addSubview(buttonRight)
        view.addSubview(buttonTop)
        view.addSubview(buttonBottom)
        view.addSubview(buttonAdd)

        view.addSubview(btn)
        view.addSubview(checkBox)
        view.addSubview(radioButton)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(handActionItem(_:)));
        navigationItem.titleView = btn
//        button.isHidden = true
//        checkBox.isHidden = true

//        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(20, 20, 120, 30);
        buttonRight.frame = CGRect(20, button.frame.maxY + 20, 120, 35);
        buttonTop.frame = CGRect(20, buttonRight.frame.maxY + 20, 120, 35*2);
        buttonBottom.frame = CGRect(20, buttonTop.frame.maxY + 20, 120, 35*2);
        buttonAdd.frame = CGRect(20, buttonBottom.frame.maxY + 20, 75, 75);
        
        btn.frame = CGRect(20, buttonAdd.frame.maxY + 20, 120, 35);
        checkBox.frame = CGRect(20, btn.frame.maxY + 20, 80, 80);
        radioButton.frame = CGRect(20, checkBox.frame.maxY + 20,  120, 35);
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        btn.topMenuTarget.dismiss(false)
    }
    
    //MARK: -functions
    @objc func handActionBtn(_ sender: NNButton) {
        sender.isSelected.toggle()
//        DDLog(sender.isSelected)

        setupTopMenuTarget(sender)
        if sender.isSelected {
            sender.topMenuTarget.show()
        } else {
            sender.topMenuTarget.dismiss()
        }
    }

    @objc func handActionDelete(_ sender: UIButton) {
        DDLog(sender)
    }
    
    @objc func handActionItem(_ sender: UIBarItem) {
        let vc = NNButtonStudyController()
        navigationController?.pushViewController(vc, animated: true)
    }
    ///配置下拉列表
    func setupTopMenuTarget(_ sender: UIButton) {
        sender.topMenuTarget.items = [String].init(count: 20, generator: { "选择_\($0)" })
        sender.topMenuTarget.selectedBlock = {
            let title = sender.topMenuTarget.items[$0]
            sender.setTitle(title, for: .normal)
            sender.sizeToFit()
            sender.layoutButton(direction: 3, imageTitleSpace: 8)
        }
        sender.topMenuTarget.cellForRowBlock = { tableView, indexPath in
            let cell = UITableViewCellOne.dequeueReusableCell(tableView, identifier: UITableViewCellOne.reuseIdentifier, style: .subtitle)
            
            cell.imageView?.image = UIImage.img_update
            cell.textLabel?.text = sender.topMenuTarget.items[indexPath.row]
            cell.detailTextLabel?.text = sender.topMenuTarget.items[indexPath.row]
            return cell
        }
    }
}
