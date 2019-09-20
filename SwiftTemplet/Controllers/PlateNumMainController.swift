//
//  PlateNumMainController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/9/20.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class PlateNumMainController: NNTabController, NNTabControllerDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "车场信息"
//        scrollViewTop.showItemNum = 4;
        // Do any additional setup after loading the view.
        delegate = self;
        viewControllers = [oneVC,
                           twoVC,
                           threeVC,
                           fourVC,
                           fiveVC]
    }
    
    // MARK: -NNTabControllerDelegate
    func tabController(_ tabController: NNTabController, willSelect viewController: UIViewController) {
        DDLog(viewController)
    }
    func tabController(_ tabController: NNTabController, didSelect viewController: UIViewController) {
        DDLog(viewController)
    }
    
    // MARK: -lazy
    lazy var oneVC: PlateNumberController = {
        let VC = PlateNumberController()
        
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
    
    lazy var fiveVC: PhotosViewController = {
        let VC = PhotosViewController()
        
        return VC;
    }()
    
}
