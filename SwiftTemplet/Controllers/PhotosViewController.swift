//
//  PhotosViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/3/1.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand

///
@objcMembers class PhotosViewController: UIViewController{
        
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
        
        edgesForExtendedLayout = []
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
        

    
    // MARK: - funtions
    func setupUI() {
        view.backgroundColor = UIColor.white

    }

}

extension PhotosViewController: NNUploadImagesViewDelegate {
    func didFinishPicker(_ images: [UIImage], isSelectOriginalPhoto: Bool) {
        DDLog(images.count)
    }
}
