//
//  BlankSpaceViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/27.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class BlankSpaceViewController: UIViewController {

    
    lazy var spaceView: PKParkSpaceView = {
        let view = PKParkSpaceView(frame: .zero)
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .background

        view.addSubview(spaceView)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        spaceView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(180);
        }
    }
    


}
