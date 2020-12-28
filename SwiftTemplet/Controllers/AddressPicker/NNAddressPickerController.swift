//
//  NNAddressPickerController.swift
//  HFNavigationController_Example
//
//  Created by Bin Shang on 2020/1/3.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SwiftExpand
import HFNavigationController
import SnapKit

@objc protocol NNAddressPickerControllerDelegate: NSObjectProtocol {
    @objc func addressPickerVC(_ controller: NNAddressPickerController);
}

class NNAddressPickerController: NNTabController{
    
    weak var addressDelegate: NNAddressPickerControllerDelegate?
    var addressBlock:((NNAddressPickerController)->Void)?

    var provinceModel: NNAddressLabelModel?{
        return firstVC.dataModel;
    }
    
    var cityModel: NNAddressLabelModel?{
        return secondVC.dataModel;
    }
    
    var areaModel: NNAddressLabelModel?{
        return thirdVC.dataModel;
    }
    
    var level = 3{
        willSet{
            scrollViewTop.isHidden = (newValue == 1)
        }
    }
    
    var indexP: IndexPath?
    // MARK: -lifecylce
    override func viewDidLoad() {
        super.viewDidLoad()

        setupExtendedLayout()
        title = "地址选择"
        // Do any additional setup after loading the view.
                
        setupUI()
        
        delegate = self;
        
        switch level {
        case 1:
            viewControllers = [firstVC]
        case 2:
            viewControllers = [firstVC, secondVC,]
            
        default:
            viewControllers = [firstVC, secondVC, thirdVC,]
        }
        
        viewControllers?.first?.beginAppearance(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        DDLog("\(self.provinceModel?.label)\(self.cityModel?.label)\(self.areaModel?.label)")

    }
    
    func setupUI() {
        let button = UIButton.create(.zero, title: "确定", textColor: .theme, backgroundColor: .clear)
        button.sizeToFit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        button.addActionHandler({ (sender) in
            self.dismiss(animated: true, completion: nil)
//            DDLog("\(self.provinceModel?.label)\(self.cityModel?.label)\(self.areaModel?.label)")
            self.addressDelegate?.addressPickerVC(self)
            self.addressBlock?(self)

        }, for: .touchUpInside)
        
    }
    
    // MARK: -lazy
    lazy var firstVC: NNChooseProvinceController = {
        let VC = NNChooseProvinceController()
        VC.parentVC = self
        
        return VC;
    }()
    
    lazy var secondVC: NNChooseCityController = {
        let VC = NNChooseCityController()
        VC.parentVC = self

        return VC;
    }()
    
    lazy var thirdVC: NNChooseAreaController = {
        let VC = NNChooseAreaController()
        VC.parentVC = self

        return VC;
    }()

}

extension NNAddressPickerController: NNTabControllerDelegate {
    // MARK: -NNTabControllerDelegate
    func tabController(_ tabController: NNTabController, willSelect viewController: UIViewController) {
        DDLog(viewController)
    }
    func tabController(_ tabController: NNTabController, didSelect viewController: UIViewController) {
        DDLog(viewController)
    }
}
