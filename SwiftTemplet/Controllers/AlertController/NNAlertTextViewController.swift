//
//  NNAlertTextViewController.swift
//  HFNavigationController_Example
//
//  Created by Bin Shang on 2020/4/16.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SwiftExpand

@objc protocol NNAlertViewControllerDelegate: NSObjectProtocol {
    @objc func alertVC(_ controller: NNAlertTextViewController, sender: UIButton);
    
}

class NNAlertTextViewController: UIViewController {
        
    weak var delegate: NNAlertViewControllerDelegate?
    
    let contentInset = UIEdgeInsets.zero
    
    var actionTitles = ["取消", "确定"]{
        willSet{
            btns.removeAll()
            for e in newValue.enumerated() {
                let button: UIButton = {
                    let button = UIButton(type: .custom);
                    button.setTitle(e.element, for: .normal);
                    button.setTitleColor(UIColor.theme, for: .normal)
                    button.titleLabel?.font = UIFont.systemFont(ofSize: 15);
                    button.titleLabel?.adjustsFontSizeToFitWidth = true;
                    button.titleLabel?.minimumScaleFactor = 1.0;
                    button.isExclusiveTouch = true;
                    
                    button.backgroundColor = UIColor.white;
                    button.tag = e.offset;
                    button.addActionHandler({ (control) in
                        guard let sender = control as? UIButton else { return }
//                        DDLog(sender.currentTitle)
                        self.delegate?.alertVC(self, sender: sender)
                        if sender.currentTitle == "取消" {
                            self.navigationController?.dismiss(animated: false, completion: nil)
                        }
                        
                        if self.delegate == nil {
                            self.dismiss(animated: true, completion: nil)
                        }
                        
                    }, for: .touchUpInside)
                    
                    return button;
                }()
                btns.append(button)
            }
        }
    }
    
    var btns: [UIButton] = []
    var btnSeprateView: [UIView] = []

    lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.isSelectable = true
        textView.isEditable = false
        return textView
    }()
    
//    lazy var bottomView: UIView = {
//        let view = UIView(frame: .zero)
//
//        return view
//    }()
    
    private lazy var horLineView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.line
        return view
    }()

//    private lazy var verLineView: UIView = {
//        let view = UITextView(frame: .zero)
//
//        return view
//    }()
//
//    private lazy var verLineView: UIView = {
//        let view = UITextView(frame: .zero)
//
//        return view
//    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        actionTitles = ["取消", "确定"]

        view.addSubview(textView)
        view.addSubview(horLineView)

        for e in btns.enumerated() {
            view.addSubview(e.element)
        }
        
//        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupConstraints()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ///UIImage()透明
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(color: .white), for: .default)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.8)]
        setupConstraints()
    }
    
    func setupConstraints() {
        let itemHeight: CGFloat = 50

        textView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(12);
            make.right.equalToSuperview().offset(-12);
            make.bottom.equalToSuperview().offset(-itemHeight-5);
        }
        
        horLineView.snp.makeConstraints { (make) in
            make.top.equalTo(textView.snp.bottom).offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.height.equalTo(0.33);
        }
        
        switch btns.count {
        case 1:
            btns[0].snp.remakeConstraints { (make) in
                make.left.equalToSuperview().offset(0);
                make.right.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(0);
                make.height.equalTo(itemHeight);
            }
                        
        case 3:
            btns[0].snp.remakeConstraints { (make) in
                make.left.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(0);
                make.width.equalToSuperview().multipliedBy(0.33)
                make.height.equalTo(itemHeight);
            }
                        
            btns[2].snp.remakeConstraints { (make) in
                make.right.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(0);
                make.width.equalToSuperview().multipliedBy(0.33)
                make.height.equalTo(itemHeight);
            }

            btns[1].snp.remakeConstraints { (make) in
                make.left.equalTo(btns[0].snp.right).offset(0);
                make.right.equalTo(btns[2].snp.left).offset(0);
                make.bottom.equalToSuperview().offset(0);
                make.height.equalTo(itemHeight);
            }
            
//            DDLog(view.frame, btns[0], btns[1], btns[2])

        default:
            btns[0].snp.remakeConstraints { (make) in
                make.left.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(0);
                make.width.equalToSuperview().multipliedBy(0.5)
                make.height.equalTo(itemHeight);
            }
            
            btns[1].snp.remakeConstraints { (make) in
                make.right.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(0);
                make.width.equalToSuperview().multipliedBy(0.5)
                make.height.equalTo(itemHeight);
            }
        }
//        DDLog(self.btns)

    }
    

}
