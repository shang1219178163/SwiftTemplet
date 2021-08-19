//
//  NNTabViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/16.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKit

class NNTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabView.frame = view.bounds
        tabView.frame = CGRectMake(5, 100, view.bounds.width - 10, view.bounds.height - 150)

//        tabView.selectedView = twoVC.view;
        view.addSubview(tabView)
    }
    
    lazy var tabView: NNTabView = {
        let view = NNTabView(frame: .zero)
        view.items = [oneVC.view, twoVC.view, threeVC.view, fourVC.view, ];
        view.delegate = self;
        return view;
    }()
    
    // MARK: -lazy
//    lazy var oneVC: PlateNumberController = {
//        let VC = PlateNumberController()
//        
//        return VC;
//    }()
    
    lazy var oneVC: CellListController = {
        let VC = CellListController()
        
        return VC;
    }()
        
    lazy var twoVC: PlateNumOriginController = {
        let VC = PlateNumOriginController()
        
        return VC;
    }()
    
    lazy var threeVC: KeyBoardViewController = {
        let VC = KeyBoardViewController()
        
        return VC;
    }()
    
    lazy var fourVC: PickerViewController = {
        let VC = PickerViewController()
        
        return VC;
    }()
    

}


extension NNTabViewController: NNTabViewDelegate{
    
    func tabView(_ tabView: NNTabView, didSelect view: UIView, selectedIndex: Int) {
//        DDLog( "\(view.tag), \(tabView.selectedIndex), \(selectedIndex)")
    }
}
