//
//	NNNetWorkOfflineView.swift
//	MacTemplet
//
//	Created by shang on 2020/08/14 10:57
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol NNNetWorkOfflineViewDelegate{
    @objc func nnnetworkofflineview(_ view: NNNetWorkOfflineView)
    
}
        
///
@objcMembers class NNNetWorkOfflineView: UIView {

    weak var delegate: NNNetWorkOfflineViewDelegate?

    typealias ViewClick = (NNNetWorkOfflineView, Int) -> Void;
    var viewBlock: ViewClick?;
    
    var inset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 15)
    
    var navigationController: UINavigationController? {
        guard let keyWindow = UIApplication.shared.keyWindow,
            let rootController = keyWindow.rootViewController as? UITabBarController,
            let navigationController = rootController.viewControllers?.first as? UINavigationController
        else { return nil }
        return navigationController
    }

    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if frame.equalTo(.zero) {
            self.frame = CGRectMake(0, UIScreen.navBarHeight, kScreenWidth, 37)
        }
        addSubview(imgView);
        addSubview(label);
        addSubview(btn);

        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        imgView.image = UIImage(named: "icon_network_offline")

        label.text = "网络请求失败，请检查您的网络设置"
        label.textColor = .white;
        label.numberOfLines = 1;
        label.adjustsFontSizeToFitWidth = true
        
        btn.imageView?.tintColor = .white
        btn.setImage(UIImage(named: "icon_arowRight_gray")?.withRenderingMode(.alwaysTemplate), for: .normal)
        
        _ = addGestureTap { (reco) in
            self.dismiss()
            
            if let image = self.navigationController?.navigationBar.backgroundImage(for: .default), image == UIImage(color: .clear) {
                self.frame = CGRectMake(0, 0, kScreenWidth, 37)
            }
            let controller = NNOfflineTipController()
            self.navigationController?.pushViewController(controller, animated: true)
        }
//        getViewLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10 {
            return;
        }
        let height = bounds.height - inset.top - inset.bottom
        let labStartX = imgView.isHidden ? inset.left : height*0.5 + inset.left + kPadding
        
        //头像不为空
        if imgView.isHidden == false {
            imgView.snp.makeConstraints { (make) in
                make.centerY.equalToSuperview()
                make.left.equalToSuperview().offset(inset.left)
                make.width.equalTo(height*0.5);
                make.height.equalTo(height*0.5);
            }
        }
        
        btn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview().offset(inset.top - inset.bottom);
            make.right.equalToSuperview().offset(-inset.right);
            make.width.equalTo(8);
            make.height.equalTo(13);
        }
        
        label.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview().offset(inset.top - inset.bottom);
            make.left.equalToSuperview().offset(labStartX);
            make.right.equalTo(btn.snp.left).offset(-8);
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        
    }
    
    // MARK: - funtions
    func block(_ action: @escaping ViewClick) {
        self.viewBlock = action;
    }
    
        
    //MARK: -lazy
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
        view.contentMode = .scaleAspectFit
        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "请选择";
        view.textColor = .lightGray;
        view.textAlignment = .left;
        view.font = UIFont.systemFont(ofSize: 13);

        return view;
    }();
    
    lazy var btn: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 1;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(.systemBlue, for: .normal);
        view.addActionHandler({ (control) in
            if let sender = control as? UIButton {
                self.viewBlock!(self,sender.tag);
            }

        }, for: .touchUpInside)
        return view;
    }()
    
    func show(_ animated: Bool = true) {
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        let list = keyWindow.subviews.filter({ $0.isMember(of: NNNetWorkOfflineView.self) })
        if list.count > 0 {
            return
        }
        
        keyWindow.endEditing(true)
        keyWindow.addSubview(self);
//        self.transform = self.transform.translatedBy(x: 0, y: -37-80)
//        self.transform = self.transform.scaledBy(x: 2.5, y: 2.5)
        let duration = animated ? 0.15 : 0
        UIView.animate(withDuration: duration, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0.7);
            self.transform = CGAffineTransform.identity
            
        }, completion: nil);
    }

    func dismiss(_ animated: Bool = true) {
        let duration = animated ? 0.15 : 0
        UIView.animate(withDuration: duration, animations: {
            self.backgroundColor = UIColor.black.withAlphaComponent(0);
//            self.transform = self.transform.scaledBy(x: 0.5, y: 0.5)

        }) { (isFinished) in
            self.removeFromSuperview();
        }
    }
    
    
}
