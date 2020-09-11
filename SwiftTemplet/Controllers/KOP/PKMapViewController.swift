//
//  PKMapViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/4.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class PKMapViewController: UIViewController {

    
    lazy var parkBriefView: PKParkBriefView = {
        let view = PKParkBriefView(frame: .zero)
        view.delegate = self
        return view
    }()
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        parkBriefView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(190);
        }
    }

}

extension PKMapViewController: PKParkBriefViewDelegate{
    func parkBriefView(_ view: PKParkBriefView, index: Int) {
//        switch index {
//        case 0:
//
//        case 1:
//
//
//        default:
//            break
//        }
    }
    
    func parkBriefView(_ view: PKParkBriefView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
