//
//  BNPIctureView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/3/1.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand
import BSImageView
import BSImagePicker
import Photos

class NNPhotosView: UIView, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imageDefault = UIImage(named: "icon_pictureUpload")
    var numberOfRow: Int = 4
    var padding: CGFloat = 15
    var btnWH: CGFloat = 30
    var maxCount: Int = 9
    
    var viewBlock: ((NNPhotosView, [UIImage]) -> Void)?
    var itemList: NSMutableArray = NSMutableArray()
    var imageList: NSMutableArray = NSMutableArray()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(containView)
        addPhotos([imageDefault as Any])
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        imageList.removeAllObjects();
        
        containView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview().offset(-btnWH/2.0)
        }
        
        let itemWidth = (bounds.width - btnWH/2.0 - CGFloat(numberOfRow - 1)*padding)/CGFloat(numberOfRow)
        let itemHeight = itemWidth
        let imgViewList: [UIImageView] = containView.subviews.filter({$0.isKind(of: UIImageView.classForCoder()) }) as! [UIImageView]
        let btnList: [UIButton] = self.subviews.filter({$0.isKind(of: UIButton.classForCoder()) }) as! [UIButton]
        
        for i in 0..<itemList.count {
            let x = CGFloat(i % numberOfRow) * (itemWidth + padding)
            let y = CGFloat(i / numberOfRow) * (itemHeight + padding)
            
            let imgView = imgViewList[i]
            let btn = btnList[i]
            btn.backgroundColor = UIColor.red
            btn.isHidden = imgView.image == imageDefault
            
            imgView.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(y + btnWH/2.0)
                make.left.equalToSuperview().offset(x)
                make.width.height.equalTo(itemWidth)
            }
            
            btn.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(y)
                make.left.equalToSuperview().offset(x + itemWidth - btnWH/2.0)
                make.width.height.equalTo(btnWH)
            }
            
            if i == itemList.count - 1 {
                containView.snp.makeConstraints { (make) in
                    make.bottom.equalTo(imgView.snp.bottom).offset(btnWH/2.0)
                }
                
                self.snp.makeConstraints { (make) in
                    make.bottom.equalTo(containView.snp.bottom)
                }
            }
            
            if imgView.image != imageDefault {
                imageList.add(imgView.image as Any)
            }
        }
        self.viewBlock!(self, imageList as! [UIImage])
    }
    
    
    //MARK: -图片添加,移除

    func addPhotos(_ items: [Any]) -> Void {
        itemList.addObjects(from: items)
        itemListValueChange()
    }
    
    func deletPhoto(_ item: Any) -> Void {
        guard let item = item as? PHAsset else { return }
        itemList.forEach { (obj) in
            guard let obj = obj as? PHAsset else { return }
            if obj.localIdentifier == item.localIdentifier {
                itemList.remove(item)
            }
        }
        
        itemListValueChange()
    }
    
    /// 界面元素重置
    func itemListValueChange() -> Void {
//        DDLog(itemList)
        
        itemList.remove(imageDefault as Any)
        if itemList.count > maxCount {
            if itemList.contains(imageDefault as Any) == true {
                itemList.remove(imageDefault as Any)
            }
        } else if itemList.count < maxCount {
            if itemList.contains(imageDefault as Any) == false {
                itemList.add(imageDefault as Any)
            }
        }

        containView.removeAllSubViews()
        for e in itemList.enumerated() {
            let view = createImgView(.zero, tag: e.offset)
            handleView(view, element: e.element)
            containView.addSubview(view)
            _ = view.addGestureTap { (recognizer) in
//                DDLog(recognizer.view?.tag as Any)
                if let tap = recognizer as? UITapGestureRecognizer {
                    if let imgView = tap.view as? UIImageView {
                        if imgView.image == self.imageDefault {
                            self.showAlertController()
                        }
                    }
                }
            }
            
            let btn = createBtn(.zero, tag: e.offset)
            self.addSubview(btn)//删除按钮添加在containView上,最右边按钮有半边无法响应事件
            btn.addActionHandler({ (control) in
                if let sender = control as? UIButton {
//                    DDLog(sender.tag)
                    let asset = self.itemList[sender.tag]
                    self.deletPhoto(asset)
                }
                
            }, for: .touchUpInside)
        }
        setNeedsLayout()
    }
    
    /// UIIImageView赋image
    func handleView(_ view: UIImageView, element: Any) -> Void {
        if let image = element as? UIImage {
            view.image = image
            
        } else {
            (element as! PHAsset).requestImage { (image, _) in
                view.image = image
            }
        }
    }
    
    func block(_ action: @escaping ((NNPhotosView, [UIImage]) -> Void)) -> Void {
        viewBlock = action;
    }
    
    //MARK: -funtions
    func showAlertController() -> Void {
        let items = ["从相册选择", "拍照"]
        UIAlertController.showSheet(nil, msg: nil, items: items) { (controller: UIAlertController, action: UIAlertAction) in
            let idx = items.firstIndex(of: action.title!)
            switch idx {
            case 1:
                self.showCameraPickerVC()
                
            default:
                self.showPhotoAlbumPickerVC()
            }
        }
    }
    
    /// 去相册
    func showPhotoAlbumPickerVC() -> Void {
        let count = itemList.contains(imageDefault as Any) == true ? maxCount - (itemList.count - 1) : maxCount - itemList.count
        
        let controller = BSImagePickerViewController()
        controller.albumButton.setTitleColor(UIColor.white, for: .normal)
        controller.selectionCharacter = "✓"
        controller.selectionFillColor = UIColor.theme
        controller.maxNumberOfSelections = count
        controller.cellsPerRow = {(verticalSize: UIUserInterfaceSizeClass, horizontalSize: UIUserInterfaceSizeClass) -> Int in
            return 4
        }
        
//        let marr = NSMutableArray()
        let rootVC = UIApplication.shared.delegate?.window??.rootViewController
        rootVC?.bs_presentImagePickerController(controller, animated: true,
                                        select: { (asset: PHAsset) -> Void in
                                            print("Selected: \(asset.localIdentifier)")
                                            DispatchQueue.main.async(execute: {
                                                self.addPhotos([asset])
                                            })
                                    }, deselect: { (asset: PHAsset) -> Void in
//                                        print("Deselected: \(asset)")
                                        DispatchQueue.main.async(execute: {
                                            self.deletPhoto(asset)
                                        })
                                    }, cancel: { (assets: [PHAsset]) -> Void in
                                        print("Cancel: \(assets.count)")
                                    }, finish: { (assets: [PHAsset]) -> Void in
                                        print("Finish: \(assets.count)")
//                                        DispatchQueue.main.async(execute: {
//                                            self.addPhotos(marr as! [Any])
//                                        })
                                    }, completion: nil)
        
    }
    
    /// 拍照
    func showCameraPickerVC() -> Void {
        let rootVC = UIApplication.shared.delegate?.window??.rootViewController

        let controller = UIImagePickerController()
        controller.sourceType = .camera
        controller.allowsEditing = true
        controller.delegate = (self as UIImagePickerControllerDelegate & UINavigationControllerDelegate)
        
        rootVC?.present(controller, animated: true, completion: nil)
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //获得照片
        let image:UIImage = info[UIImagePickerController.InfoKey.editedImage.rawValue] as! UIImage
        // 拍照
        if picker.sourceType == .camera {
            //保存相册
            addPhotos([image])
            image.toSavedPhotoAlbum { (error) in
                if error != nil {
                    DDLog("保存相片失败",error!.description)
                    return
                }
                DDLog("保存相片成功!")

            }
        }
        
        let rootVC = UIApplication.shared.delegate?.window??.rootViewController
        rootVC!.dismiss(animated: true, completion: nil)
    }

    //MARK: -createView
    
    func createImgView(_ rect: CGRect, tag: Int) -> UIImageView {
        let view = UIImageView(frame: rect);
        view.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
        view.isUserInteractionEnabled = true;
        view.contentMode = .scaleAspectFit;
        view.tag = tag;
        
        view.layer.borderWidth = kH_LINE_VIEW
        view.layer.borderColor = UIColor.red.cgColor
        
        return view
    }
    
    func createBtn(_ rect: CGRect, tag: Int) -> UIButton {
        let view = UIButton(type: .custom)
        view.frame = rect
        view.setTitleColor(.white, for: .normal);
        view.setImage(UIImageNamed("icon_delete"), for: .normal)
        //        view.setBackgroundImage(UIImage(color: .clear), for: .normal)
        view.adjustsImageWhenHighlighted = false
        view.tag = tag
        return view
    }
    
    //MARK: -lazy

    lazy var containView: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.white
        view.backgroundColor = UIColor.green

        
        return view
    }()
    
//    lazy var bsImagePickerVC: BSImagePickerViewController = {
//
//        var controler = BSImagePickerViewController()
//        controler.maxNumberOfSelections = 6
//
//        let rootVC = UIApplication.shared.delegate?.window??.rootViewController
//        rootVC?.bs_presentImagePickerController(controler, animated: true,
//                                                select: { (asset: PHAsset) -> Void in
//                                                    print("Selected: \(asset)")
//        }, deselect: { (asset: PHAsset) -> Void in
//            print("Deselected: \(asset)")
//        }, cancel: { (assets: [PHAsset]) -> Void in
//            print("Cancel: \(assets)")
//        }, finish: { (assets: [PHAsset]) -> Void in
//            print("Finish: \(assets)")
//        }, completion: nil)
//        return controler
//    }()
    
//    lazy var cameraPickerVC: UIImagePickerController = {
//        var controller = UIImagePickerController()
//        controller.delegate = self
//        controller.allowsEditing = true
//        controller.sourceType = .camera
//
//
//        return controler
//    }()
}
