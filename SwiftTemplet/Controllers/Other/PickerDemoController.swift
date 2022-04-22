//
//  PickerDemoController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/12.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import PhotosUI
import SwiftExpand

///颜色选择,字体选择
class PickerDemoController: UIViewController {

    let items: [UIButton] = ["系统字体选择器", "present自定义字体选择器", "push自定义字体选择器", "系统颜色选择器", "折叠列表", "PickerVC", "PickerVC设置contentVC", "button"].enumerated().map { e in
        let sender = NNButton(type: .custom)
        sender.setTitle(e.element, for: .normal)
        sender.setTitleColor(.black, for: .normal)
        sender.setTitleColor(.systemBlue, for: .selected)
        sender.titleLabel?.font = UIFont.systemFont(ofSize: 15)

//        sender.setBorderColor(.line, for: .normal)
//        sender.setBorderColor(.systemBlue, for: .selected)
        sender.layer.cornerRadius = 5;
        sender.tag = e.offset
        sender.addTarget(self, action: #selector(handleAction(_:)), for: .touchUpInside)
        
        sender.titleLabel?.numberOfLines = 0
        return sender
    }
    
    @available(iOS 14.0, *)
    private lazy var picker: UIColorPickerViewController = {
        let picker = UIColorPickerViewController()
        picker.delegate = self
        return picker
    }()
    
    @available(iOS 14.0, *)
    private lazy var colorWell: UIColorWell = {
        let sender = UIColorWell()
        sender.frame = CGRect(x: 0, y: 0, width: 44, height: 44);
        sender.addTarget(self, action: #selector(colorWellValueChanged(_:)), for: .valueChanged)
        return sender
    }()
    
    
    @available(iOS 14.0, *)
    private lazy var imagePickerVC: PHPickerViewController = {
        var config = PHPickerConfiguration()
        // 可选择的资源数量，0表示不设限制，默认为1
        config.selectionLimit = 0
        // 可选择的资源类型
        // 只显示图片（注：images 包含 livePhotos）
        config.filter = .images
        // 显示 Live Photos 和视频（注：livePhotos 不包含 images）
        config.filter = .any(of: [.livePhotos, .videos])
        // 如果要获取视频，最好设置该属性，避免系统对视频进行转码
        config.preferredAssetRepresentationMode = .current

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self

        picker.modalPresentationStyle = .fullScreen
        picker.edgesForExtendedLayout = []
        
        return picker
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        title = "选择器"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(showFontPickerVC))
        if #available(iOS 14.0, *) {
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: colorWell)
        }
        
        items.forEach {
            view.addSubview($0)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        items.updateItemsConstraint(CGRectMake(10, 10, kScreenWidth - 20, 200))
    }
    
    @objc func handleAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if #available(iOS 13.0, *) {
                let vc = UIFontPickerViewController(configuration: .init())
                vc.delegate = self
                
                vc.modalPresentationStyle = .fullScreen
                vc.present()
            }
        case 1:
            let vc = UINavigationController(rootViewController: NNFontPickerController {
                DDLog($0)
            })
            vc.present()
            
        case 2:
            navigationController?.pushViewController(NNFontPickerController {
                DDLog($0)
            }, animated: true)
            
        case 3:
            if #available(iOS 14.0, *) {
                picker.present()
            }
            
        case 4:
            let vc = NNFoldTableController<String>()
            vc.data = UIFont.familyNames
                .map({ return ($0, UIFont.fontNames(forFamilyName: $0), false) })
                .sorted{$0.0 < $1.0}
            vc.block = {
                DDLog($0)
            }
            
//            vc.headerViewForSectionBlock = { UITableView, Int, arg2 in
//                let view = UILabel()
//                view.backgroundColor = .red
//
//                view.text = "\(arg2.0)(\(arg2.1.count))"
//                return view
//            }
            navigationController?.pushViewController(vc, animated: true)
            
        case 5:
            let vc = NNBottomSheetController()
            vc.title = "\(Date())"
            vc.items = [String].init(count: 20, generator: { "\($0)"
            })
            
            vc.block = { value, item in
                DDLog(value, item.title)
            }
            vc.title = "\(Date())"

//            vc.modalPresentationStyle = .overFullScreen
//            present(vc, animated: true, completion: nil)
            vc.present()
            
        case 6:
            let vc = NNBottomSheetController()
            vc.title = "\(Date())"

            vc.block = { value, item in
                DDLog(value, item.title)
            }
            
            let redVC = UIViewController()
            redVC.view.backgroundColor = .red
            
            vc.setContent(vc: redVC, height: kScreenHeight*0.6)
            
//            vc.present()
//            present(vc, animated: true, completion: nil)
            vc.modalPresentationStyle = .overFullScreen
            present(vc, animated: true, completion: nil)
        case 7:
            if #available(iOS 14.0, *) {
                present(imagePickerVC, animated: true, completion: {
                    DDLog(self.imagePickerVC.children)
                    if let first = self.imagePickerVC.children.first {
                        first.edgesForExtendedLayout = []
                    }
                })
            } else {
                // Fallback on earlier versions
            }
            

        default:
            sender.throttled()
            DDLog(sender.currentTitle)
            DDLog(CFAbsoluteTimeGetCurrent())
            break
        }

        
    }

    @available(iOS 14.0, *)
    @objc func colorWellValueChanged(_ sender: UIColorWell) {
        view.backgroundColor = sender.selectedColor
    }

    
    @objc func colorValueChanged(_ color: UIColor) {
        view.backgroundColor = color
    }
}


@available(iOS 13.0, *)
extension PickerDemoController: UIFontPickerViewControllerDelegate{

    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        guard let fontDescriptor = viewController.selectedFontDescriptor else {
            return
        }

        let font = UIFont(descriptor: fontDescriptor, size: 17)
        DDLog(font.pointSize, font.fontName)
    }
}


@available(iOS 14.0, *)
extension PickerDemoController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        colorValueChanged(viewController.selectedColor)
        dismiss(animated: true, completion: nil)
    }

    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorValueChanged(viewController.selectedColor)
    }
}


@available(iOS 14, *)
extension PickerDemoController: PHPickerViewControllerDelegate {

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        // 首先需要 dismiss picker
        picker.dismiss(animated: true, completion: nil)
        
        for result in results {
            if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                // 判断类型是否为 UIImage
                if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                    // 确认类型后，调用 loadObject 方法获取图片
                    result.itemProvider.loadObject(ofClass: UIImage.self) { (data, error) in
                        // 回调结果是在异步线程，展示时需要切换到主线程
                        if let image = data as? UIImage {
                            DDLog(image)
                            DispatchQueue.main.async {
    //                            self.showImage(image)
                            }
                        }
                    }
                }
            } else {
                // 类型为 Video
                // 调用 loadFileRepresentation 方法获取视频的 url
                // 这里 Type Identifier 我们用 UTType.movie.identifier (“public.movie”) 这个 UTI 可以获取所有格式的视频
                result.itemProvider.loadFileRepresentation(forTypeIdentifier: UTType.movie.identifier) { (url, error) in
                    if let error = error {
                        print(error)
                        return
                    }
                    // 系统会将视频文件存放到 tmp 文件夹下
                    // 我们必须在这个回调结束前，将视频拷贝出去，一旦回调结束，系统就会把视频删掉
                    // 所以一定要确定拷贝结束后，再切换到主线程做 UI 操作
                    // 另外不用担心视频过大而导致拷贝的时间很久，系统将创建一个 APFS 的克隆项，因此拷贝的速度会非常快
                    guard let url = url else { return }
                    let fileName = "\(Int(Date().timeIntervalSince1970)).\(url.pathExtension)"
                    let newUrl = URL(fileURLWithPath: NSTemporaryDirectory() + fileName)
                    try? FileManager.default.copyItem(at: url, to: newUrl)
                    DispatchQueue.main.async {
//                        self.playVideo(newUrl)
                        DDLog(newUrl)
                    }
                }
            }
        }
    }
}



//public extension Array where Element : View{
//
//    ///更新 Button 集合视图
//    func createItemsConstraint(_ width: CGFloat, itemHeightScale: CGFloat = 1.3, numberOfRow: Int = 4, minimumInteritemSpacing: CGFloat = kPadding, minimumLineSpacing: CGFloat = kPadding, sectionInset: EdgeInsets = EdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) -> CGSize {
//        if self.count == 0 || width <= 10 {
//            return .zero;
//        }
//
//        let rowCount = self.count % numberOfRow == 0 ? self.count/numberOfRow : self.count/numberOfRow + 1;
//        let itemWidth: CGFloat = (width - sectionInset.left - sectionInset.right - CGFloat(numberOfRow - 1)*minimumInteritemSpacing)/CGFloat(numberOfRow)
//        let itemHeight: CGFloat = itemWidth*itemHeightScale
//        let height: CGFloat = sectionInset.top + sectionInset.bottom + CGFloat(rowCount)*itemHeight + CGFloat(rowCount - 1) * minimumLineSpacing
//
//        for e in self.enumerated() {
//            let x = CGFloat(e.offset % numberOfRow) * (itemWidth + minimumInteritemSpacing)
//            let y = CGFloat(e.offset / numberOfRow) * (itemHeight + minimumLineSpacing)
//            let itemRect = CGRect(x: x, y: y, width: ceil(itemWidth), height: itemHeight)
//            e.element.frame = itemRect
//        }
//        return CGSize(width: width, height: height)
//    }
//}
