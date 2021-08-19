//
//  PickerDemoController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/12.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
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
    
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
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
            sender.throttled()
            DDLog(sender.currentTitle)
            DDLog(CFAbsoluteTimeGetCurrent())

        default:
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
extension PickerDemoController: UIColorPickerViewControllerDelegate{
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        colorValueChanged(viewController.selectedColor)
        dismiss(animated: true, completion: nil)
    }

    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorValueChanged(viewController.selectedColor)
    }
}
