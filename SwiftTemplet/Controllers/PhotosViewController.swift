//
//  PhotosViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/3/1.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SwiftExpand
import BSImageView
import BSImagePicker
import Photos

class PhotosViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = createBtnBarItem("相册", image: nil, isLeft: false, isHidden: false) { (control) in
            let items: [String] = ["image Picker", "custom ImagePicker","imagePicker With selected assets",]
            UIAlertController.showSheet("请选择", items: items, handler: { (controller, action) in
                let x = items.firstIndex(of: action.title!)
                switch x {
                case 0:
                    self.showImagePicker()
                    
                case 1:
                    self.showCustomImagePicker()
                    
                case 2:
                    self.showImagePickerWithSelectedAssets()
                    
                default:
                    break;
                }
                
            })
        }
    
      
//        itemView.frame = CGRect(x: 20, y: 20, width: kScreenWidth - 40.0, height: kScreenWidth - 40.0)
        view.addSubview(itemView)
        itemView.backgroundColor = UIColor.red
        
        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        itemView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
//            make.bottom.equalToSuperview()
        }
    }
    
    //MARK: -funtions
    func showImagePicker() -> Void {
        let vc = BSImagePickerViewController()
        vc.maxNumberOfSelections = 6
        
        bs_presentImagePickerController(vc, animated: true,
                                        select: { (asset: PHAsset) -> Void in
                                            print("Selected: \(asset)")
        }, deselect: { (asset: PHAsset) -> Void in
            print("Deselected: \(asset)")
        }, cancel: { (assets: [PHAsset]) -> Void in
            print("Cancel: \(assets)")
        }, finish: { (assets: [PHAsset]) -> Void in
            print("Finish: \(assets)")
        }, completion: nil)
    }
    
    func showCustomImagePicker() -> Void {
        let vc = BSImagePickerViewController()
        vc.maxNumberOfSelections = 6
        vc.takePhotoIcon = UIImage(named: "chat")
        
        vc.albumButton.tintColor = UIColor.green
        vc.cancelButton.tintColor = UIColor.red
        vc.doneButton.tintColor = UIColor.purple
        vc.selectionCharacter = "✓"
        vc.selectionFillColor = UIColor.gray
        vc.selectionStrokeColor = UIColor.yellow
        vc.selectionShadowColor = UIColor.red
        vc.selectionTextAttributes[NSAttributedString.Key.foregroundColor] = UIColor.lightGray
        vc.cellsPerRow = {(verticalSize: UIUserInterfaceSizeClass, horizontalSize: UIUserInterfaceSizeClass) -> Int in
            switch (verticalSize, horizontalSize) {
            case (.compact, .regular): // iPhone5-6 portrait
                return 2
            case (.compact, .compact): // iPhone5-6 landscape
                return 2
            case (.regular, .regular): // iPad portrait/landscape
                return 3
            default:
                return 4
            }
        }
        
        bs_presentImagePickerController(vc, animated: true,
                                        select: { (asset: PHAsset) -> Void in
                                            print("Selected: \(asset)")
        }, deselect: { (asset: PHAsset) -> Void in
            print("Deselected: \(asset)")
        }, cancel: { (assets: [PHAsset]) -> Void in
            print("Cancel: \(assets)")
        }, finish: { (assets: [PHAsset]) -> Void in
            print("Finish: \(assets)")
        }, completion: nil)
    }
    
    func showImagePickerWithSelectedAssets() -> Void {
        let allAssets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
        var evenAssetIds = [String]()
        
        allAssets.enumerateObjects({ (asset, idx, stop) -> Void in
            if idx % 2 == 0 {
                evenAssetIds.append(asset.localIdentifier)
            }
        })
        
        let evenAssets = PHAsset.fetchAssets(withLocalIdentifiers: evenAssetIds, options: nil)
        
        let vc = BSImagePickerViewController()
        vc.defaultSelections = evenAssets
        
        bs_presentImagePickerController(vc, animated: true,
                                        select: { (asset: PHAsset) -> Void in
                                            print("Selected: \(asset)")
        }, deselect: { (asset: PHAsset) -> Void in
            print("Deselected: \(asset)")
        }, cancel: { (assets: [PHAsset]) -> Void in
            print("Cancel: \(assets)")
        }, finish: { (assets: [PHAsset]) -> Void in
            print("Finish: \(assets)")
        }, completion: nil)
    }
    
    //MARK: -lazy
    lazy var itemView: BNPhotosView = {
        var view = BNPhotosView(frame: .zero)
//        view.parController = self
        view.block({ (itemsView, sender) in
            if let btn = sender as? UIButton {
                print(btn.titleLabel?.text as Any)
                
            }
        })
        return view;
    }()
}
