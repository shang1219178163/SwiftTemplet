//
//	NNUploadImagesController.swift
//	SwiftTemplet
//
//	Created by shang on 2020/07/19 10:17
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SwiftExpand

///
@objcMembers class NNUploadImagesController: UIViewController{
        
    lazy var uploadImagesView: NNUploadImagesView = {
        let view = NNUploadImagesView()
        view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 110)
        view.currrentVC = self
        view.images = [view.imageDefault]
        view.rowHeight = view.frame.height
        view.delegate = self

        return view
    }()
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupExtendedLayout()
        title = ""
        setupUI()
        
        view.addSubview(uploadImagesView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - funtions
    func setupUI() {
        view.backgroundColor = UIColor.white

    }

}

extension NNUploadImagesController: NNUploadImagesViewDelegate {
    func didFinishPicker(_ images: [UIImage], isSelectOriginalPhoto: Bool) {
        DDLog(images.count)
    }
}
