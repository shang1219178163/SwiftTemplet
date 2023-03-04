//
//  SegmentControlStyleController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/7/8.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKit

class SegmentControlStyleController: UIViewController {

    //MARK: -lazy
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.axis = .vertical
        //子视图的高度或宽度保持一致
        stackView.distribution = .fillEqually

        return stackView;
    }()
    
    lazy var segmentCtl: NNSegmentedControl = {
        let rect = CGRect(0, 0, 240, 44)
        let view = NNSegmentedControl(frame: rect)
        view.showStyle = .bottomLine
        view.normalColor = .black
        view.selectedColor = .theme
        view.items = ["过去", "现在", "将来"]
        view.addActionHandler({ (sender) in
            DDLog(sender.selectedSegmentIndex)
            
        }, for: .valueChanged)
        return view;
    }()
    
    
    //MARK: -lazy
    lazy var segmentCtl1: NNSegmentedControl = {
        let rect = CGRect(0, 0, 240, 44)
        let view = NNSegmentedControl(frame: rect)
        view.showStyle = .topLine
        view.normalColor = .black
        view.selectedColor = .theme
        view.items = ["过去", "现在", "将来"]
        view.addActionHandler({ (sender) in
            DDLog(sender.selectedSegmentIndex)
            
        }, for: .valueChanged)
        return view;
    }()
    
    
    //MARK: -lazy
    lazy var segmentCtl2: NNSegmentedControl = {
        let rect = CGRect(0, 0, 240, 44)
        let view = NNSegmentedControl(frame: rect)
        view.showStyle = .box
        view.normalColor = .black
        view.selectedColor = .theme
        view.items = ["过去", "现在", "将来"]
        view.addActionHandler({ (sender) in
            DDLog(sender.selectedSegmentIndex)
            
        }, for: .valueChanged)
        return view;
    }()
    
    lazy var segmentCtl3: NNSegmentedControl = {
        let rect = CGRect(0, 0, 240, 44)
        let view = NNSegmentedControl(frame: rect)
        view.showStyle = .bottomLine
        view.normalColor = .white.withAlphaComponent(0.6)
        view.selectedColor = .white
        view.items = ["过去", "现在", "将来"]
        view.addActionHandler({ (sender) in
            DDLog(sender.selectedSegmentIndex)
            
        }, for: .valueChanged)
        return view;
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        navigationItem.titleView = segmentCtl3

        view.addSubview(stackView)
        
        stackView.addArrangedSubviews([segmentCtl, segmentCtl1, segmentCtl2])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        stackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(180)
        }
    }
    

}
