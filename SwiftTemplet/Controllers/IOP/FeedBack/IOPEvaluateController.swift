//
//  IOPEvaluateController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/19.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKit

class IOPEvaluateController: UIViewController {

    
    lazy var starView: NNStarEvaluateView = {
        let view = NNStarEvaluateView(frame: .zero)
        view.totalStarCount = 5
        view.currentStarCount = 3
//        view.isUserInteractionEnabled = false
        return view
    }()
    
    // MARK: -lifeycycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .clear
        
        view.addSubview(starView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        starView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.left.equalToSuperview().offset(10);
            make.width.equalTo(200);
            make.height.equalTo(25);
        }
    }
    



}
