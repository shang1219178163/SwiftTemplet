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
    var type: Int = 0 {
        didSet{
            setupIndicator()

        }
    }

    deinit {
        removeObserver(self, forKeyPath: "selectedSegmentIndex")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
        addSubview(indicator);
        setupControl()
        
        addObserver(self, forKeyPath: "selectedSegmentIndex", options: .new, context: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 0;

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
            backgroundColor = UIColor.white
            self.ensureiOS12Style()
            return;
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
        if CGRect.zero.equalTo(frame) || numberOfSegments <= 0 {
            return
        }
        
        let duration = CGRect.zero.equalTo(indicator.frame) ? 0.0 : kDurationShow;
        let segmentWidth = sizeWidth/CGFloat(numberOfSegments)
        let originX = segmentWidth * CGFloat(selectedSegmentIndex);
        
        switch type {
        case 1:
            UIView.animate(withDuration: duration) {
                self.indicator.frame = CGRectMake(originX, 0, segmentWidth, self.indicatorHeight)
            }
            
        case 2:
            UIView.animate(withDuration: duration) {
                self.indicator.frame = CGRectMake(originX, self.sizeHeight - self.indicatorHeight, segmentWidth, self.indicatorHeight)
            }
            
        case 3:
            UIView.animate(withDuration: duration) {
                self.indicator.frame = CGRectMake(originX, 0, segmentWidth, self.frame.height)
            }
            
        default:
            break;
        }
        bringSubviewToFront(indicator)

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

//extension UISegmentedControl{
//
//    enum ShowStyle : Int {
//        case box
//
//        case topLine
//
//        case bottomLine
//    }
//
//    static func create(_ style: ShowStyle) -> UISegmentedControl {
//        let view = NNSegmentedControl(frame: .zero)
//        view.type = style.rawValue;
//        view.normalColor = UIColor.white
//        view.selectedColor = .red
//
//        return view;
//    }
//}
