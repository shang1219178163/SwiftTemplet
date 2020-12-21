//
//	NNInstructionView.swift
//	MacTemplet
//
//	Created by shang on 2020/08/08 09:10
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
import SnapKit
import SwiftExpand
        
@objc protocol NNInstructionViewDelegate{
    @objc func nninstructionview(_ view: NNInstructionView)
    
}
        
///
@objcMembers class NNInstructionView: UIView {

    weak var delegate: NNInstructionViewDelegate?

    typealias ViewClick = (NNInstructionView, Int) -> Void;
    var viewBlock: ViewClick?;
    
    var inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = UIScreen.main.bounds
        self.backgroundColor = UIColor(white: 0, alpha: 0.3)
        
        addGestureTap { (reco) in
            self.removeFromSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.height <= 0.0 {
            return;
        }
        
    }
    
    // MARK: - funtions
    func block(_ action: @escaping ViewClick) {
        self.viewBlock = action;
    }
    
    func changeNext() {
        
    }
    
    func show(_ sender: UIView, message: String = "") {
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        keyWindow.addSubview(self)
        
        let convertFrame = sender.convert(sender.bounds, to: self)
//        DDLog(convertFrame)
        
        let path = UIBezierPath(rect: UIScreen.main.bounds)
        let rect = CGRect(x: convertFrame.origin.x - inset.left,
                          y: convertFrame.origin.y - inset.top,
                          width: convertFrame.size.width + inset.left + inset.right,
                          height: convertFrame.size.height + inset.top + inset.bottom)
        DDLog(convertFrame, rect)
        let senderPath = UIBezierPath(roundedRect: rect, cornerRadius: 5).reversing()
        path.append(senderPath)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        self.layer.mask = shapeLayer
        
        if message == "" {
            return
        }
        addSubview(label)
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.text = message
        
        let screenBounds = UIScreen.main.bounds
        let messageSize = label.sizeThatFits(CGSize(width: screenBounds.width - 60, height: CGFloat.greatestFiniteMagnitude))
        
        if convertFrame.midY > screenBounds.midY {
            label.frame = CGRect(x: 30, y: convertFrame.minY - messageSize.height - 15, width: messageSize.width, height: messageSize.height)
        } else {
            label.frame = CGRect(x: 30, y: convertFrame.maxY + 15, width: messageSize.width, height: messageSize.height)
        }
                
    }
    
    func refresh(_ sender: UIView) {
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        keyWindow.addSubview(self)
        
        let convertFrame = sender.convert(sender.bounds, to: self)
//        DDLog(convertFrame)
        
        let path = UIBezierPath(rect: UIScreen.main.bounds)
        let rect = CGRect(x: convertFrame.origin.x - inset.left,
                          y: convertFrame.origin.y - inset.top,
                          width: convertFrame.size.width + inset.left + inset.right,
                          height: convertFrame.size.height + inset.top + inset.bottom)
        DDLog(convertFrame, rect)
        let senderPath = UIBezierPath(roundedRect: rect, cornerRadius: 5).reversing()
        path.append(senderPath)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        self.layer.mask = shapeLayer
        
        addSubview(imgView)
    }
        
    //MARK: -lazy
    lazy var imgView: UIImageView = {
        let view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "icon_avatar")
        
        return view;
    }()
    
    lazy var label: UILabel = {
        let view = UILabel(frame: .zero);
        view.text = "请选择";
        view.textColor = .systemGray
        view.textAlignment = .left;
        view.font = UIFont.systemFont(ofSize: 15)
        view.numberOfLines = 0
        view.backgroundColor = .white
        return view;
    }();
    
    lazy var btnSure: UIButton = {
        let view = UIButton(type: .custom);
        view.tag = 1;
        
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16);
        view.setTitle(kTitleSure, for: .normal);
        view.setTitleColor(.systemBlue, for: .normal);
        view.addActionHandler({ (sender) in
            self.viewBlock?(self, sender.tag);

        }, for: .touchUpInside)
        return view;
    }()
}

public extension CGRect{
    
    enum Location: Int {
        case none, top, bottom, left, right, center, topLeft, bottomLeft, topRight, bottomRight, topMid, bottomMid, leftMid, rightMid
    }
    
    var screenLocation: Location {
        let screenCenter = UIScreen.main.bounds.center

        var location: Location = .none
        
        if center.x < screenCenter.x {
            if center.y < screenCenter.y {
                DDLog("左上")
                location = .topLeft
            } else if center.y > screenCenter.y {
                DDLog("左下")
                location = .bottomLeft
            } else {
                DDLog("左侧Y居中")
                location = .leftMid
            }
        } else if center.x > screenCenter.x {
            if center.y < screenCenter.y {
                DDLog("右上")
                location = .topRight

            } else if center.y > screenCenter.y {
                DDLog("右下")
                location = .bottomRight
            } else {
                DDLog("右侧Y居中")
                location = .rightMid
            }
        } else {
            DDLog("x居中")
            location = .center
        }
        return location
    }
    
}
