//
//  NNSudokuViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/22.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class NNSudokuViewController: UIViewController {

    lazy var sudokuView: NNSudokuView = {
        let view = NNSudokuView()
        view.numOfRow = 3
        view.row = 3
        view.itemType = NNButton.self
//            view.items.forEach { $0.setTitleColor(.systemBlue, for: .normal)}
        view.items.forEach {

            guard let sender = $0 as? NNButton else { return }
            sender.direction = .top
            sender.setImage(UIImage(named: "icon_selected_yes_blue"), for: .normal)

            sender.addActionHandler({ sender in
                
                DDLog(sender.tag)

            }, for: .touchUpInside)
        }
        
        view.showDividers = true
        view.dividerColor = .red
        return view
    }()

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        view.addSubview(sudokuView)
        
        view.getViewLayer()
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        sudokuView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(300);
        }
    }

}
