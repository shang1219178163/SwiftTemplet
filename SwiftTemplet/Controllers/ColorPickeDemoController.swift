//
//  ColorPickeDemoController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/5/18.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand

@available(iOS 14.0, *)
class ColorPickeDemoController: UIViewController {
    
    let picker = UIColorPickerViewController()

    lazy var controlWell: UIColorWell = {
        let sender = UIColorWell()
        sender.addTarget(self, action: #selector(changeValue(_:)), for: .valueChanged)
        return sender
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "done", style: .plain, target: self, action: #selector(handleActionItem))

        picker.delegate = self

        controlWell.frame = CGRect(x: 20, y: 20, width: 60, height: 60);
        self.view.addSubview(controlWell)

    }

    @objc func handleActionItem() {
        present(picker, animated: true, completion: nil)

    }
    
    @objc func changeValue(_ color: UIColor) {
        DDLog(color.description)
//        self.view.backgroundColor = color
    }
}

@available(iOS 14.0, *)
extension ColorPickeDemoController: UIColorPickerViewControllerDelegate{
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        changeValue(viewController.selectedColor)
        dismiss(animated: true, completion: nil)
    }

    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        changeValue(viewController.selectedColor)
    }
}
