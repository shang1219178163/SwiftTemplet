//
//  FloatingPanelExampleController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/15.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import FloatingPanel

class FloatingPanelExampleController: NNFloatingPanelBaseController {
    
    lazy var panelLayout: NNPanelLandscapeBaseLayout = {
        let layout = NNPanelLandscapeBaseLayout()
        layout.tipPosition = 49
        layout.halfPosition = 300
        layout.fullPosition = 60
        
        layout.initPosition = .half
        return layout;
    }()
    
    lazy var contentVC: SimpleListController = {
        let vc = SimpleListController()
        vc.view.layer.borderColor = UIColor.line.cgColor
        vc.view.layer.borderWidth = 0.35

        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        delegate = self
        
        fpc.set(contentViewController: contentVC)
        fpc.track(scrollView: contentVC.tableView)
        fpc.addPanel(toParent: self)
    }
    

}

extension FloatingPanelExampleController: NNFloatingPanelDelegate {
    func nFloatingPanelWillBeginDragging(_ vc: FloatingPanelController) {
        
    }
    
    func nFloatingPanelDidEndDragging(_ vc: FloatingPanelController) {
        if vc.position == .tip {
            navigationController?.popViewController(animated: false)
        }
    }
    
    func nFloatingPanelLayout(_ vc: FloatingPanelController) -> NNPanelLandscapeBaseLayout {
        return panelLayout
    }
        

}
