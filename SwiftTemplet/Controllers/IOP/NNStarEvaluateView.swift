//
//	NNStarEvaluateView.swift
//	MacTemplet
//
//	Created by Shang on 2021/08/19 16:06
//	Copyright © 2021 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol NNStarEvaluateViewDelegate{
    @objc func NNStarEvaluateView(_ view: NNStarEvaluateView)
    
}
        
///
@objcMembers class NNStarEvaluateView: UIView {

    weak var delegate: NNStarEvaluateViewDelegate?

    var block: ((NNStarEvaluateView, Int) -> Void)?
    
    var inset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)

    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 10.0 {
            return;
        }
        
    }
    
    // MARK: - funtions
    func show(_ animated: Bool = true) {
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        
        keyWindow.endEditing(true)
        keyWindow.addSubview(self);
//        self.transform = self.transform.scaledBy(x: 1.5, y: 1.5)
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
        
    //MARK: -lazy
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
        
        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "请选择";
        view.textColor = .lightGray;
        view.textAlignment = .center;
        return view;
    }()
    
    lazy var btnSure: UIButton = {
        let view = UIButton(type: .custom);
        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(.systemBlue, for: .normal);
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.adjustsImageWhenHighlighted = false;
        view.tag = 1;

        view.addActionHandler({ (sender) in
            self.viewBlock?(self, sender.tag);

        }, for: .touchUpInside)
        return view;
    }()
}
