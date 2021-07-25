//
//  NNToolbar.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/7/25.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit

/// 支持按钮右边布局(常用户订单 续费,删除,支付等视图布局)
public class NNToolbar: UIToolbar {
    
    enum NNToolbarAlignment {
        case leading, center, trailing
    }
    
    var spacing: CGFloat = 8
    
    var alignment: NNToolbarAlignment = .trailing

    
    private let fixedItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
    
    private let flexibleItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    
    var elements: [UIBarButtonItem]{
        willSet{
            var array = [UIBarButtonItem]()
            newValue.forEach({ item in
                array.append(item)
                
                fixedItem.width = spacing
                array.append(fixedItem)
            })
            
            switch alignment {
            case .trailing:
                array.insert(flexibleItem, at: 0)
            case .center:
                array.insert(flexibleItem, at: 0)
                array.append(flexibleItem)
            default:
                array.append(flexibleItem)
            }
            items = array
        }
    }
    
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        self.elements = []

        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
