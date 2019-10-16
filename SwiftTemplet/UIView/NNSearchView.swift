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

@objc protocol NNSearchViewDelegate {
    func searchViewTextDidChange(_ view: NNSearchView, text: String, isFinished: Bool)
}

class NNSearchView: UIView, UISearchBarDelegate {
    
    weak var delegate: NNSearchViewDelegate?
    
    var btnTitles: [String] = [] {
        willSet{
            btn.setTitle(newValue.first, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isUserInteractionEnabled = true;
        backgroundColor = UIColor.white
        
        addSubview(btn)
        addSubview(searchBar)
        
        btn.titleLabel!.addObserver(self, forKeyPath: "text", options: .new, context: nil)
        btn.addObserver(self, forKeyPath: "hidden", options: .new, context: nil)

//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(keyBoardWillShow(_ :)),
//                                               name: UIResponder.keyboardWillShowNotification,
//                                               object: nil)
//
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(keyBoardWillHide(_ :)),
//                                               name: UIResponder.keyboardWillHideNotification,
//                                               object: nil)
    }
    
//MARK:键盘通知相关操作
//    @objc func keyBoardWillShow(_ notification: Notification){
//        DispatchQueue.main.async {
//            self.btnCancell.isHidden = false;
//        }
//    }
//
//    @objc func keyBoardWillHide(_ notification: Notification){
//        DispatchQueue.main.async {
//            self.btnCancell.isHidden = true;
//
//        }
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        btn.titleLabel!.removeObserver(self, forKeyPath: "text", context: nil)
        btn.removeObserver(self, forKeyPath: "hidden", context: nil)
    }
    
    override var intrinsicContentSize: CGSize{
        return UIView.layoutFittingExpandedSize;
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraint()
    }
    
    func setupConstraint() {
        btn.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.width.equalTo(90);
        }
        
        searchBar.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalTo(btn.snp.right).offset(0);
            make.right.equalToSuperview().offset(0);
            make.height.equalToSuperview();
        }
        
    }
    // observeValue
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "text" {
            btn.sizeToFit()
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, -btn.imageView!.bounds.width, 0, btn.imageView!.bounds.width)
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, btn.titleLabel!.bounds.width+3.0, 0, -btn.titleLabel!.bounds.width-3.0)
            btn.size = CGSize(width: 90, height: self.sizeHeight)
        } else if keyPath == "hidden" {
            setupConstraint();
            
        }
    }
    
    // MARK: -UISearchBar
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool{
        return true;
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        //        delegate?.searchViewTextComplete(self, text: searchBar.text!)
        delegate?.searchViewTextDidChange(self, text: searchBar.text!, isFinished: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //        DDLog(searchBar.text)
        //        delegate?.searchViewTextDidChange(self, text: searchText, isFinished: false)
        delegate?.searchViewTextDidChange(self, text: searchText, isFinished: (searchText == ""))
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        searchBar.showsCancelButton = !(searchBar.text!.count == 1 && text == "")
        return true;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        delegate?.searchViewTextDidChange(self, text: searchBar.text!, isFinished: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = "";
        searchBar.showsCancelButton = (searchBar.text != "")
        delegate?.searchViewTextDidChange(self, text: searchBar.text!, isFinished: true)
    }
    
    
    // MARK: -lazy
    
    @objc lazy var btn: UIButton = {
        var view: UIButton = UIView.createBtn( .zero, title: "车场名称", imgName: nil, type: 0);
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.setImage(UIImageNamed(kIMG_arrowDown), for: .normal)
        view.sizeToFit()
        view.titleEdgeInsets = UIEdgeInsetsMake(0, -view.imageView!.bounds.width, 0, view.imageView!.bounds.width)
        view.imageEdgeInsets = UIEdgeInsetsMake(0, view.titleLabel!.bounds.width+3.0, 0, -view.titleLabel!.bounds.width-3.0)
        view.addActionHandler({ (sender) in
            if let obj = sender as? UIButton {
                DDLog(obj.currentTitle as Any)
                
            }
        }, for: .touchUpInside)
        
        return view;
    }();
    
    @objc lazy var searchBar: UISearchBar = {
        let view = UIView.createSearchBarRect(CGRectMake(0, 0, kScreenWidth - 70, 30))
        view.layer.cornerRadius = 0;
        view.showsCancelButton = false;
        view.textField?.placeholder = "请输入车场名称搜索";
        view.textField?.font = UIFont.systemFont(ofSize: 14)
        view.delegate = self;
        return view
    }()
    
}
