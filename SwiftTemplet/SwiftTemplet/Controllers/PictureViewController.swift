//
//  PictureViewController.swift
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

class PictureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        _ = createBtnBarItem("相册", image: nil, tag: kTAG_RightItem, isLeft: false, isHidden: false) { (control) in
            let dic = ["image Picker": [0],
                       "custom ImagePicker": [1],
                       "imagePicker With selected assets" : [2],
                       ]
            
            UIAlertController.showSheet("请选择", itemDic: dic, completion: { (action) in
                
                let x = dic[action.title!]
                switch x?.first {
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
    
      
        itemView.frame = CGRect(x: 20, y: 20, width: kScreenWidth - 40.0, height: kScreenWidth - 40.0)
        view.addSubview(itemView)
        
        view.getViewLayer()
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
                return 2
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
    lazy var itemView: BNPictureView = {
        var view = BNPictureView(frame: .zero)
        view.block({ (itemsView, sender) in
            if let btn = sender as? UIButton {
                print(btn.titleLabel?.text as Any)
                
            }
        })
        return view;
    }()
}
