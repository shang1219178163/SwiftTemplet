//
//  ScrollLabelController.swift
//  自动滚动Label
//
//  Created by Duangser on 2020/5/26.
//  Copyright © 2020 Duangser. All rights reserved.
//

import UIKit
class ScrollLabelController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollLabelView = NNScrollLabelView.init(frame: CGRect.init(x: 70, y: 100, width: 200, height: 30))
        scrollLabelView.backgroundColor = .red
        scrollLabelView.adTextAlignment = .center
        scrollLabelView.adLabelClick = {index in
            print(index)
        }
        view.addSubview(scrollLabelView)
        let array = ["000000000000000", "111111111111111", "2222222222222", "333333333", "444444444444"]
        scrollLabelView.beginScroll(textArray: array)
        // Do any additional setup after loading the view.
    }


}

