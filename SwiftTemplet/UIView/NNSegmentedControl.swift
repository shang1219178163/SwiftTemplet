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
    
    var indicatorHeight: CGFloat = 1.5
    var indicatorWidth: CGFloat = 0

    var cornerRadius: CGFloat = 0

    var normalColor: UIColor = .black {
        didSet{
            setupControl()
        }
    }
    
    var selectedColor: UIColor = .systemBlue {
        didSet{
            setupControl()
        }
    }
    
    var showStyle: ShowStyle = .system{
        didSet{
            setupIndicator()
            
            let dividerImage = UIImage(color: (showStyle == .seprateLine) ? .line : .clear)
            setDividerImage(dividerImage, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
            setDividerImage(dividerImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
            setDividerImage(dividerImage, forLeftSegmentState: .highlighted, rightSegmentState: .normal, barMetrics: .default)
        }
    }
    
    // MARK: -lifecycle
    deinit {
//        removeObserver(self, forKeyPath: "selectedSegmentIndex")
    }
    
    override var intrinsicContentSize: CGSize{
        return UIView.layoutFittingExpandedSize
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(lineView)
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
        if keyPath == "selectedSegmentIndex" {
            setupIndicator()
//            if let value = change![NSKeyValueChangeKey.newKey] as? NSNumber {
//
//            }
        }
        else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    func setupControl() {
        if #available(iOS 13, *) {
            let image = UIImage(color: backgroundColor ?? .clear)
            setBackgroundImage(image, for: .normal, barMetrics: .default)
            setBackgroundImage(image, for: .selected, barMetrics: .default)
            setBackgroundImage(image, for: .highlighted, barMetrics: .default)

            let dividerImage = UIImage(color: (showStyle == .seprateLine) ? .line : .clear)
            setDividerImage(dividerImage, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
            setDividerImage(dividerImage, forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
            setDividerImage(dividerImage, forLeftSegmentState: .highlighted, rightSegmentState: .normal, barMetrics: .default)

            layer.borderColor = UIColor.clear.cgColor
            layer.borderWidth = 1.0;
            layer.masksToBounds = true;
            layer.cornerRadius = 1.0;
            
        } else {
            tintColor = .clear
            backgroundColor = .clear
        }
        let attDic = [NSAttributedString.Key.foregroundColor: normalColor,
                      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
                    ]
        
        let attDicH = [NSAttributedString.Key.foregroundColor: selectedColor,
                       NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
                    ]
        setTitleTextAttributes(attDic, for: .normal)
        setTitleTextAttributes(attDicH, for: .selected)
        setTitleTextAttributes(attDicH, for: .highlighted)

        if showStyle == .box {
            indicator.backgroundColor = .clear
            indicator.layer.borderColor = selectedColor.cgColor
        } else {
            indicator.layer.borderColor = selectedColor.cgColor
            indicator.backgroundColor = selectedColor
        }
    }
    
    func setupIndicator() {
        if bounds.height <= 0 || numberOfSegments <= 0 {
            return
        }
        
        let duration = CGRect.zero.equalTo(indicator.frame) ? 0.0 : kDurationShow;
        var segmentWidth = bounds.width/CGFloat(numberOfSegments)
        var originX = segmentWidth * CGFloat(selectedSegmentIndex);
        if indicatorWidth > 0 {
            originX = segmentWidth * CGFloat(selectedSegmentIndex) + (segmentWidth - indicatorWidth)/2.0
            segmentWidth = indicatorWidth
        }

        /// 0: default, 1, topLine, 2,bottomLine, 3,box
        switch showStyle {
        case .topLine:
            self.lineView.frame = CGRectMake(0, 0, bounds.width, 0.35)
            bringSubviewToFront(lineView)

            UIView.animate(withDuration: duration) {
                self.indicator.frame = CGRectMake(originX, 0, segmentWidth, self.indicatorHeight)
            }
            bringSubviewToFront(indicator)

        case .bottomLine:
            self.lineView.frame = CGRectMake(0, bounds.height - 0.35, bounds.width, 0.35)
            bringSubviewToFront(lineView)

            UIView.animate(withDuration: duration) {
                self.indicator.frame = CGRectMake(originX, self.bounds.height - self.indicatorHeight, segmentWidth, self.indicatorHeight)
            }
            bringSubviewToFront(indicator)

        case .box:
            self.lineView.frame = .zero
            UIView.animate(withDuration: duration) {
                self.indicator.frame = CGRectMake(originX, 0, segmentWidth, self.frame.height)
            }
            bringSubviewToFront(indicator)
        case .seprateLine:
            self.lineView.frame = .zero
            layer.borderColor = UIColor.clear.cgColor

        default:
            if #available(iOS 13.0, *) {
                DispatchQueue.main.async{
                    self.setBackgroundImage(UIImage(color: .clear), for: .normal, barMetrics: .default)
                    self.setBackgroundImage(UIImage(color: .systemTeal), for: .selected, barMetrics: .default)
                    self.setBackgroundImage(UIImage(color: .systemTeal), for: .highlighted, barMetrics: .default)
                }
            }

            break;
        }
    }
    
    //MARK: -lazy
    lazy var indicator: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor.clear.cgColor
        
        view.layer.borderColor = selectedColor.cgColor;
        view.layer.borderWidth = indicatorHeight;
        return view;
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.line
        return view;
    }()

}

extension NNSegmentedControl{

    enum ShowStyle : Int {
        case system
        case box
        case topLine
        case bottomLine
        case seprateLine
    }

    static func create(_ style: ShowStyle) -> Self {
        let view = NNSegmentedControl(frame: .zero)
        view.showStyle = style
        view.normalColor = UIColor.white
        view.selectedColor = .systemBlue

        return view as! Self
    }
}
