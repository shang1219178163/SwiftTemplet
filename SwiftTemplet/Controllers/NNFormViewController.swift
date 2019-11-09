//
//  NNFormViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/6.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

class NNFormViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem.create("Next")
        navigationItem.rightBarButtonItem?.addAction({ (item) in
            DDLog(item);
        })
                
        view.addSubview(formView)
        view.isUserInteractionEnabled = true;
        view.isMultipleTouchEnabled = true

        let tap = UITapGestureRecognizer(target: nil, action: nil);
        view.addGestureRecognizer(tap);
        tap.addAction { (reco) in
            DDLog(reco)
        }
        
        let swipe = UISwipeGestureRecognizer(target: nil, action: nil)
        swipe.direction = .left
        view.addGestureRecognizer(swipe);
        swipe.funcName = "left"
        swipe.addAction { (reco) in
           DDLog(reco.funcName)
        }
        
        let swipe1 = UISwipeGestureRecognizer(target: nil, action: nil)
        swipe1.direction = .right
        view.addGestureRecognizer(swipe1);
        swipe1.funcName = "right"
        swipe1.addAction { (reco) in
           DDLog(reco.funcName)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        formView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(20);
            make.left.equalToSuperview().offset(40);
            make.right.equalToSuperview().offset(-40);
            make.height.equalTo(225);
        }
        
//        navigationItem.leftBarButtonItem?.addAction({ (item) in
//            DDLog(item);
//        })
    }
    
    lazy var formView: NNFormView = {
        let view = NNFormView(frame: .zero)
        view.placeholders = ["000", "111", "222", "333", "444"]
        return view;
    }()
    

}
