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
import PlateKeyboard_iOS

@objc protocol NNSearchViewDelegate {
    func searchViewTextDidChange(_ view: NNSearchView, text: String, complete: Bool)
}

class NNSearchView: UIView{
    
    weak var parController: UIViewController?
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
                
                handler.setupKeyBoardView(self.searchBar.textField!);
                handler.delegate = (self as PWHandlerDelegate);
            } else {
                searchBar.delegate = self;
                
                handler.delegate = nil;
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
                make.width.equalTo(90);
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
                    handler.plateNumber = value;
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
    
    @objc lazy var btn: UIButton = {
        var view: UIButton = UIButton.create( .zero, title: "按钮名称", imgName: nil, type: 0);
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.setImage(UIImageNamed(kIMG_arrowDown), for: .normal)
        view.sizeToFit()
        view.titleEdgeInsets = UIEdgeInsetsMake(0, -view.imageView!.bounds.width, 0, view.imageView!.bounds.width)
        view.imageEdgeInsets = UIEdgeInsetsMake(0, view.titleLabel!.bounds.width+3.0, 0, -view.titleLabel!.bounds.width-3.0)
        view.size = CGSize(width: view.frame.width + 10, height: self.sizeHeight)

        view.addTarget(self, action: #selector(handleActionSender(_:)), for: .touchUpInside)
        return view;
    }();
    
    @objc func handleActionSender(_ sender: UIButton) {
        //        DDLog(sender)
        popView.sender = sender;
        if sender.imageView?.transform.isIdentity == true {
            popView.show();
        } else {
            popView.dismiss();

        }
    }
    
    lazy var searchBar: UISearchBar = {
        let view = UISearchBar.create(CGRectMake(0, 0, kScreenWidth - 70, 30))
        view.layer.cornerRadius = 0;
        view.showsCancelButton = false;
        view.textField?.placeholder = "搜索";

        view.delegate = self;
        return view
    }()
    
    lazy var popView: NNPopView = {
        let view = NNPopView(frame: .zero)
        view.parController = self.parController
        return view
    }()
    
    
    //MARK: -lazy
    lazy var handler: PWHandler = {
        let handler = PWHandler();
        handler.textFontSize = 18;
//        handler.setupKeyBoardView( self.searchView.searchBar.textField!);
//        handler.delegate = self;
        
        return handler;
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

extension NNSearchView: PWHandlerDelegate{
    // MARK: -PWHandlerDelegate
    func plateDidChange(plate: String, complete: Bool) {
        if complete == true {
            handler.vehicleKeyBoardEndEditing()
        }
        delegate?.searchViewTextDidChange(self, text: plate, complete: complete)
    }
    
    func plateInputComplete(plate: String) {
        UIApplication.shared.keyWindow?.endEditing(true)
        
        delegate?.searchViewTextDidChange(self, text: plate, complete: true)
    }

}
