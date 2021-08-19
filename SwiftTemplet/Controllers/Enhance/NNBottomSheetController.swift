//
//  NNBottomSheetController.swift
//  TMP_Example
//
//  Created by Bin Shang on 2021/6/18.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKit

///底部弹窗容器
class NNBottomSheetController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    public var items: [String] = []
    private var selectedValue: String?

    public var block: ((String?, UIBarButtonItem) -> Void)?
    
    private let toorbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 45))

    public var contentViewController: UIViewController?{
        willSet{
            guard let newValue = newValue else { return }
            addChild(newValue)
            view.addSubview(newValue.view)
            
            contentView = newValue.view
        }
    }
    
    public var contentView: UIView!

    private lazy var pickerView: UIPickerView = {
        let sender = UIPickerView()
        sender.backgroundColor = .white

        sender.delegate = self
        sender.dataSource = self
        // 设置选择框的默认值
        sender.selectRow(0, inComponent: 0, animated: true)
        return sender
    }()
    
    
    public func setContent(vc: UIViewController, height: CGFloat) {
        contentViewController = vc
        vc.preferredContentSize.height = height
    }
    
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
        view.backgroundColor = .black.withAlphaComponent(0.3)

        let cancellItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(handleItem(_:)))
        let confirmItem = UIBarButtonItem(title: "确定", style: .plain, target: self, action: #selector(handleItem(_:)))

        let titleItem = UIBarButtonItem(title: "请选择", style: .plain, target: nil, action: nil)
        //第一个分隔按钮
        let spaceItemLeft = UIBarButtonItem(barButtonSystemItem:.flexibleSpace, target: nil, action: nil)
        let spaceItemRight = UIBarButtonItem(barButtonSystemItem:.flexibleSpace, target: nil, action: nil)

        toorbar.items = [cancellItem, spaceItemLeft, titleItem, spaceItemRight, confirmItem]
        
        contentView = pickerView
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(contentView)
        let heigth = contentViewController?.preferredContentSize.height ?? 240
        contentView.snp.remakeConstraints { (make) in
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.height.equalTo(heigth);
        }
        
        view.addSubview(toorbar)
        toorbar.snp.remakeConstraints { (make) in
            make.bottom.equalTo(contentView.snp.top).offset(-1);
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
//            make.height.equalTo(45);
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
        toorbar.items?[2] = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
    }
    
    // MARK: -lifycycle
    @objc func handleItem(_ item: UIBarButtonItem) {
        block?(selectedValue, item)
        
        if ["取消", "确定"].contains(item.title) {
            dismiss(animated: true, completion: nil)
        }
    }


    // MARK: -pickerView
    /// 设置选择框的列数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /// 设置选择框的行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }

    /// 设置选择框各选项的内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = (view as? UILabel) ?? UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center

        label.text = items[row]
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if items.count > row {
            selectedValue = items[row]
        }
    }
}


