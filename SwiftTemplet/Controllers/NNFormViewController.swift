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

        view.addSubview(formView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        formView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(20);
            make.left.equalToSuperview().offset(40);
            make.right.equalToSuperview().offset(-40);
            make.height.equalTo(200);
        }
        
    }
    
    lazy var formView: NNFormView = {
        let view = NNFormView(frame: .zero)
        view.placeholders = ["000", "111", "222", "333", "444"]
        return view;
    }()
    

}
