//
//  NNSearchView.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/1/24.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

import SnapKit
import SwiftExpand
import NNPopoverButton
import NNPlateKeyboard

@objc protocol NNSearchViewDelegate {
    func searchViewTextDidChange(_ view: NNSearchView, text: String, complete: Bool)
}

class NNSearchView: UIView{
    
    weak var parController: UIViewController?{
        willSet{
            btn.parentVC = newValue
        }
    }
    weak var delegate: NNSearchViewDelegate?

    var btnTitles: [String] = [] {
        willSet{
            btn.setTitle(newValue.first, for: .normal)
        }
    }
    
    var isPlateKeyborad = false {
        willSet{
            if newValue == true {
                searchBar.delegate = nil;
                
                plateKeyboard.bindTextField(self.searchBar.textField!);
                plateKeyboard.delegate = self
            } else {
                searchBar.delegate = self;
                
                plateKeyboard.delegate = nil;
            }
        }
    }
    
    var viewBlock: ((NNSearchView, UIControl) -> Void)?
    private var itemList: [UIButton] = []
    
    private var myContext0 = 0
    private var myContext1 = 1

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white;
        isUserInteractionEnabled = true;
        
        addSubview(btn)
        addSubview(searchBar)
        addSubview(lineBottom)

        searchBar.textField?.placeholder = "请输入车场名称进行搜索"
        plateKeyboard.bindTextField(searchBar.textField!, showSearch: true)
        
        btn.titleLabel!.addObserver(self, forKeyPath: "text", options: .new, context: &myContext0)
        btn.titleLabel!.addObserver(self, forKeyPath: "hidden", options: .new, context: &myContext0)
        searchBar.textField!.addObserver(self, forKeyPath: "text", options: .new, context: &myContext1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        btn.titleLabel!.removeObserver(self, forKeyPath: "text", context: nil)
    }
    
    override var intrinsicContentSize: CGSize{
        return UIView.layoutFittingExpandedSize;
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    func setupConstraint() {
        if btn.isHidden == true {
            searchBar.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(1);
                make.left.equalToSuperview().offset(0);
                make.right.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(-1);
            }
        } else {
            btn.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(0);
                make.left.equalToSuperview().offset(5);
                make.bottom.equalToSuperview().offset(-1);
                make.width.equalTo(75);
            }
            
            searchBar.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(0);
                make.left.equalTo(btn.snp.right).offset(5);
                make.right.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(-1);
            }
        }
        
        lineBottom.snp.makeConstraints { (make) in
            make.left.equalToSuperview();
            make.right.equalToSuperview();
            make.bottom.equalToSuperview();
            make.height.equalTo(0.33);
        }
    }
    
    // observeValue
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if context == &myContext0 {
            if keyPath == "text" {
//                btn.sizeToFit()
//                btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.imageView!.bounds.width, 0, btn.imageView!.bounds.width)
//                btn.imageEdgeInsets = UIEdgeInsetsMake(0, btn.titleLabel!.bounds.width+3.0, 0, -btn.titleLabel!.bounds.width-3.0)
//                btn.size = CGSize(width: btn.frame.width + 10, height: self.sizeHeight)
//                setupConstraint();
            } else if keyPath == "hidden" {
                setupConstraint();
                
            }
        } else if context == &myContext1 {
            if let value: String = change![.newKey] as? String {
                if value == "" {
                    delegate?.searchViewTextDidChange(self, text: value, complete: true)
//                    plateKeyboard.plateNumber = value;
                }
            }
            
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
        
    }
 
    //选择完后回调
    func block(_ action: @escaping ((NNSearchView, UIControl) -> Void)) {
        viewBlock = action;
    }
    
    // MARK: -lazy
    
    lazy var btn: NNPopoverButton = {
        let button = NNPopoverButton(type: .custom)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitle("Left", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.sizeToFit()
        button.parentVC = self.parController
        button.contentWidth = 150
        button.list = ["0", "1", "2", "3", "4", "5", "6",]
            
        button.delegate = self
        button.addTarget(self, action: #selector(showPopoverAction(_:)), for: .touchUpInside)
        return button
    }()
    
    @objc func showPopoverAction(_ sender: NNPopoverButton) {
        
    }
        
    //MARK: -lazy

    lazy var searchBar: UISearchBar = {
        let view = UISearchBar.create(CGRectMake(0, 0, kScreenWidth - 70, 30))
        view.layer.cornerRadius = 0;
        view.showsCancelButton = false;
        view.textField?.placeholder = "搜索";

        view.delegate = self;
        return view
    }()
        
    ///车牌键盘
    lazy var plateKeyboard: NNPlateKeyboard = {
        let keyboard = NNPlateKeyboard()
        keyboard.numType = .airport
        keyboard.delegate = self;

        return keyboard;
    }()
}

extension NNSearchView: UISearchBarDelegate{
    // MARK: -UISearchBar
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool{
        return true;
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        delegate?.searchViewTextComplete(self, text: searchBar.text!)
        delegate?.searchViewTextDidChange(self, text: searchBar.text!, complete: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        searchBar.showsCancelButton = (searchText != "")
//        DDLog(searchBar.text)
        delegate?.searchViewTextDidChange(self, text: searchText, complete: (searchText == ""))
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        searchBar.showsCancelButton = !(searchBar.text!.count == 1 && text == "")
        return true;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        delegate?.searchViewTextDidChange(self, text: searchBar.text!, complete: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = "";
        searchBar.showsCancelButton = (searchBar.text != "")
        delegate?.searchViewTextDidChange(self, text: searchBar.text!, complete: true)
    }
}

extension NNSearchView: NNPopoverButtonDelegate {
    public func popoverButton(_ popoverBtn: NNPopoverButton, tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(#function):\(indexPath.row)")
        guard let cell = tableView.cellForRow(at: indexPath) as UITableViewCell? else { return }
        popoverBtn.setTitle(cell.textLabel?.text ?? "--", for: .normal)

    }
}


extension NNSearchView: NNPlateKeyboardDeleagte{
    
    func plateDidChange(_ plate: String, complete: Bool) {
        delegate?.searchViewTextDidChange(self, text: plate, complete: complete)
    }
    
}
