


//
//  OthersViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/7/13.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class OthersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        segmentCtlOne.frame = CGRectMake(0, 0, 240, 45)
        
        navigationItem.titleView = segmentCtlOne;

    }
    

//    lazy var segmentCtlOne: UISegmentedControl = {
//        let view: UISegmentedControl = UISegmentedControl.create(.bottomLine);
//        view.itemList = ["是", "否", "其他"]
//        view.addActionHandler({ (control) in
//            guard let sender = control as? UISegmentedControl else { return }
//            DDLog(sender)
//        }, for: .valueChanged)
//        return view;
//    }()
    lazy var segmentCtlOne: UISegmentedControl = {
        let view = NNSegmentedControl(frame: .zero)
        view.type = 2;
        view.normalColor = UIColor.white
        view.selectedColor = UIColor.green
        view.itemList = ["是", "否", "其他"]
        view.addActionHandler({ (control) in
            guard let sender = control as? UISegmentedControl else { return }
            DDLog(sender)
        }, for: .valueChanged)
        return view;
    }()
    
    
}
