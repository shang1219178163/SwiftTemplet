//
//	NNPageSegmentedControlController.swift
//	MacTemplet
//
//	Created by shang on 2020/10/27 18:05
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit

///
@objcMembers class NNPageSegmentedControlController: NNCycleController{
        
    //MARK: -lazy
    lazy var segmentCtl: NNSegmentedControl = {
        let view = NNSegmentedControl(frame: .zero)
        view.showStyle = .bottomLine
        view.normalColor = .gray
        view.selectedColor = .white
        view.indicatorHeight = 2
        view.lineView.backgroundColor = .clear
        view.items = ["过去", "现在", "将来"]
        view.addActionHandler({ (sender) in
            let idx = sender.selectedSegmentIndex
            let indexP = IndexPath(row: idx, section: 0)
            self.collectionView.scrollToItem(at: indexP, at: .centeredHorizontally, animated: true)
            
        }, for: .valueChanged)
        return view;
    }()
    
    var segmentCtlSize = CGSize(width: 240, height: 44){
        willSet{
            segmentCtl.frame = CGRect(x: 0, y: 0, width: newValue.width, height: newValue.height)
            navigationItem.titleView = segmentCtl
        }
    }
            
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        segmentCtl.frame = CGRect(x: 0, y: 0, width: segmentCtlSize.width, height: segmentCtlSize.height)
        
        scrollViewPageIdxBlock = { [weak self] idx in
            guard let self = self else { return }
            self.segmentCtl.selectedSegmentIndex = idx
        }
        
        viewControllers = [FirstViewController(), TitleViewController(), FourthViewController(), TestViewController(), ThirdViewController()]
        segmentCtl.items = viewControllers.map({ $0.title ?? $0.vcName })
        navigationItem.titleView = segmentCtl
        
//        segmentCtl.showStyle = .system
//
//        segmentCtl.tintColor = .systemGreen
//        segmentCtl.setDividerImage(UIImage(color: segmentCtl.tintColor), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
//        segmentCtl.setDividerImage(UIImage(color: segmentCtl.tintColor), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
//        segmentCtl.setDividerImage(UIImage(color: segmentCtl.tintColor), forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)

//        navigationController?.navigationBar.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
        }
        layout.itemSize = CGSize(width: view.bounds.width, height: view.bounds.height)
        collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - funtions


}

