//
//  AttrStringViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/11/26.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

import SwiftExpand
import SnapKit
        

///优雅的富文本
@objcMembers class AttrStringViewController: UIViewController{
    
    lazy var rightBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("保存", for: .normal)

        view.isHidden = true;
        view.sizeToFit()
        view.addActionHandler({ (sender) in
            
        }, for: .touchUpInside)
        return view
    }()
            
    // MARK: - lazy
    lazy var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .systemGreen
        view.numberOfLines = 0
        return view
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.isSelectable = true
        textView.isEditable = false
        textView.delegate = self
        return textView
    }()
    
    lazy var imgView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit

        view.isUserInteractionEnabled = true
        view.addGestureTap { (reco) in
            view.showImageEnlarge()
        }
        return view
    }()
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("自定义标题", for: .normal)
        view.setTitleColor(.red, for: .normal)
        view.setCustomType(.titleAndOutline)
        view.adjustsImageWhenHighlighted = false
        
        view.addActionHandler { (sender) in
            DDLog(sender.currentTitle ?? "-")
        }
        return view
    }()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = "SimpleListController"

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
                
        view.addSubview(label);
        view.addSubview(imgView);
        view.addSubview(btn);
        view.addSubview(textView);

//        label.isHidden = true
//        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15);
            make.left.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-15);
            make.height.equalTo(225);
        }
        
        imgView.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom).offset(15);
            make.left.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-15);
            make.height.equalTo(125);
        }
        
        btn.snp.makeConstraints { (make) in
            make.top.equalTo(imgView.snp.bottom).offset(15);
            make.left.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-15);
            make.height.equalTo(50);
        }
        
        textView.snp.makeConstraints { (make) in
            make.top.equalTo(btn.snp.bottom).offset(15);
            make.left.equalToSuperview().offset(15);
            make.right.equalToSuperview().offset(-15);
            make.bottom.equalToSuperview().offset(-15);
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        label.attributedText = AttrString.test()
//        label.attributedText = AttrString.testNew()

//        testSatues()
    }
    
    func testAttributedText() {
        imgView.image = UIImage(named: "WechatIMG375.png")
        
        let str1: AttrString = """
          Hello \("user", .color(.blue), .underline(.red, .single)), how do you like this?
          """
        
//        DDLog(AttrString.test().rangeSubAttStringDic)
        let tmp = NSMutableAttributedString(attributedString: label.attributedText!)
        tmp[0] = str1.attributedString
        label.attributedText = tmp
        
        let att0 = "Swift,".matt
            .fontChain(UIFont.systemFont(ofSize: 16))
            .foregroundColorChain(.systemBlue)
            .underlineChain(.single, .red)
            .obliqueChain(0.5)
            .linkChain("https://www.hackingwithswift.com")


//        let att1 = NSAttributedString(string: " how do you like this?", attributes: nil)
        let att1 = " how do you like this?".matt
            .fontChain(UIFont.systemFont(ofSize: 12))
            .foregroundColorChain(.systemGreen)
            .strikethroughChain(.single, .lightRed)
        
//        let att2 = NSAttributedString(string: ", YES?", attributes: nil)
        let att2 = ", YES?".matt
        .fontChain(UIFont.systemFont(ofSize: 20))
        .foregroundColorChain(.systemOrange)
        .obliqueChain(-0.5)
        
        let att3 = "666".matt
            .foregroundColorChain(.red)
            .backgroundColorChain(.green)
            .fontChain(UIFont.systemFont(ofSize: 15))
            .obliqueChain(0.3)
        
        textView.attributedText = (att0 + att1 + att2 + att3).matt
            .fontChain(UIFont.systemFont(ofSize: 30))
//            .color(.systemPink)
//            .bgColor(.lightGreen)
//            .obliqueChain(0.3)
    }
        
    func testSatues() {
        label.backgroundColor = .white
        
        let image = UIImage(named: "icon_routingInspection_normal")!
        let image1 = UIImage(named: "icon_routingInspection_ignore")!
        let image2 = UIImage(named: "icon_routingInspection_hiddenTrouble")!
        let image3 = UIImage(named: "icon_routingInspection_abnormal")!
        
        let att: AttrString = """
          \(image: image, scale: 1.0, verticalOffSet: 0) \(image: image1, scale: 1.0, verticalOffSet: -13) \(image: image2, scale: 1.0, verticalOffSet: 13) \(image: image3, scale: 1.0, verticalOffSet: -3) \("状态", .font(UIFont.systemFont(ofSize: 12)))
          """
        
        label.attributedText = att.attributedString

//        let textAttachment = NSTextAttachment()
//        textAttachment.image = image
//        textAttachment.bounds = CGRect(origin: CGPoint.zero, size: image.size)
//        let textAttachmentString = NSMutableAttributedString(attributedString: NSAttributedString(attachment: textAttachment))
//
//        label.attributedText = textAttachmentString + att.attributedString
    }
    
}


extension AttrStringViewController: UITextViewDelegate{
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        DDLog(URL.absoluteString, characterRange, interaction)
        return true
    }
}


