//
//  NNSegmentedControl.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/7/11.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// UISegmentedControl 升级版,支持0: box, 1, topLine, 2,bottomLine 三种样式
class NNSegmentedControl: UISegmentedControl {

    var indicatorHeight: CGFloat = 2
    var cornerRadius: CGFloat = 3

    var normalColor: UIColor = UIColor.black {
        didSet{
            setupControl()
        }
    }
    
    var selectedColor: UIColor = UIColor.theme {
        didSet{
            setupControl()
        }
    }
    
    /// 0: default, 1, topLine, 2,bottomLine, 3,box
//    var type: Int = 0 {
//        didSet{
//            setupIndicator()
//        }
//    }
    
    var showStyle: ShowStyle = .system{
        didSet{
            setupIndicator()
        }
    }
    
    // MARK: -lifecycle
    deinit {
        removeObserver(self, forKeyPath: "selectedSegmentIndex")
    }
    
    override var intrinsicContentSize: CGSize{
        return UIView.layoutFittingExpandedSize
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(indicator);
        setupControl()
        
        addObserver(self, forKeyPath: "selectedSegmentIndex", options: .new, context: nil)
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius;

        setupIndicator()
    }
    
    //MARK: -funtions
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        //        DDLog("change_\(change)");
        if keyPath == "selectedSegmentIndex" {
            setupIndicator()
//            if let value = change![NSKeyValueChangeKey.newKey] as? NSNumber {
//
//            }
        }
    }
    
    func setupControl() {
        if #available(iOS 13, *) {
            setBackgroundImage(UIImage(color: backgroundColor ?? .white), for: .normal, barMetrics: .default)
            setBackgroundImage(UIImage(color: .white), for: .selected, barMetrics: .default)
            setBackgroundImage(UIImage(color: .white), for: .highlighted, barMetrics: .default)
            
            setDividerImage(UIImage(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
            setDividerImage(UIImage(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
            setDividerImage(UIImage(color: UIColor.clear), forLeftSegmentState: .highlighted, rightSegmentState: .normal, barMetrics: .default)
            
//            setTitleTextAttributes([.foregroundColor: normalColor as Any,
//                                    .font: UIFont.systemFont(ofSize: 15)], for: .normal)
//            setTitleTextAttributes([.foregroundColor: selectedColor,
//                                    .font: UIFont.systemFont(ofSize: 15)], for: .selected)
            
//            layer.borderWidth = 1.0;
//            layer.borderColor = UIColor.clear.cgColor;
//            layer.masksToBounds = true;
//            layer.cornerRadius = 1.0;
            
//            indicator.layer.borderColor = selectedColor.cgColor;
//            return;
        }
//        tintColor = UIColor.white
//        backgroundColor = UIColor.white
        tintColor = UIColor.clear
        backgroundColor = UIColor.clear
        let dic_N = [NSAttributedString.Key.foregroundColor: normalColor,
                     NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
                    ]
        
        let dic_H = [NSAttributedString.Key.foregroundColor: selectedColor,
                     NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                    ]
        
        setTitleTextAttributes(dic_N, for: .normal)
        setTitleTextAttributes(dic_H, for: .selected)
        
        indicator.layer.borderColor = selectedColor.cgColor;
    }
    
    func setupIndicator() {
        if self.bounds.height <= 0 || numberOfSegments <= 0 {
            return
        }
        
        let duration = CGRect.zero.equalTo(indicator.frame) ? 0.0 : kDurationShow;
        let segmentWidth = sizeWidth/CGFloat(numberOfSegments)
        let originX = segmentWidth * CGFloat(selectedSegmentIndex);
        
        /// 0: default, 1, topLine, 2,bottomLine, 3,box
        switch showStyle {
        case .topLine:
            UIView.animate(withDuration: duration) {
                self.indicator.frame = CGRectMake(originX, 0, segmentWidth, self.indicatorHeight)
            }
            bringSubviewToFront(indicator)

        case .bottomLine:
            UIView.animate(withDuration: duration) {
                self.indicator.frame = CGRectMake(originX, self.bounds.height - self.indicatorHeight, segmentWidth, self.indicatorHeight)
            }
            bringSubviewToFront(indicator)

        case .box:
            UIView.animate(withDuration: duration) {
                self.indicator.frame = CGRectMake(originX, 0, segmentWidth, self.frame.height)
            }
            bringSubviewToFront(indicator)

        default:
            break;
        }
    }
    
    //MARK: -lazy
    lazy var indicator: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor.clear.cgColor
        //        layer.opacity = 0;
        
        view.layer.borderColor = selectedColor.cgColor;
        view.layer.borderWidth = indicatorHeight;
        return view;
    }()

}

extension NNSegmentedControl{

    enum ShowStyle : Int {
        case system
        case box
        case topLine
        case bottomLine
    }

    static func create(_ style: ShowStyle) -> Self {
        let view = NNSegmentedControl(frame: .zero)
//        view.type = style.rawValue;
        view.showStyle = style
        view.normalColor = UIColor.white
        view.selectedColor = .systemBlue

        return view as! Self;
    }
}
