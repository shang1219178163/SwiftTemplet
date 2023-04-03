//
//  NNAbsorbPointerViewController.swift
//  SwiftTemplet
//
//  Created by shangbinbin on 2023/4/3.
//  Copyright © 2023 BN. All rights reserved.
//

import UIKit
import SnapKit
import SwiftExpand

/**
 通过递归遍历将所有子视图设置 isUserInteractionEnabled = false,则该视图可以响应事件;
 */
class NNAbsorbPointerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        title = "NNAbsorbPointerView"
        
        absorbPointerView.addSubview(button)
        view.addSubview(absorbPointerView)
        
//        view.recursion{ e in
//            e.isUserInteractionEnabled = false;
//        }
        
        view.addGestureTap { reco in
            debugPrint("\(Date()):reco.view")
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        let edge = UIEdgeInsets(all: 50)
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(edge)
        }
        
        absorbPointerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(edge)
        }
        
    }
    
    
    
    lazy var absorbPointerView: NNAbsorbPointerView = {
        let view = NNAbsorbPointerView(frame: .zero);
//        view.absorbing = true;
        view.backgroundColor = .green;
        view.addGestureTap { reco in
            debugPrint("\(Date()):NNAbsorbPointerView")
        }
        return view
    }()


    lazy var button: UIButton = {
        let view = UIButton(type: .custom);
        view.setTitle("UIButton", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .blue;
        view.addGestureTap { reco in
            debugPrint("\(Date()):button")
        }
        return view
    }()
}


//public extension UIView{
//
//    /// 递归设置子视图
//    func recursion(_ cb: @escaping ((UIView) -> Void)){
//        subviews.forEach { e in
//            cb(e);
//            e.recursion(cb);
//        }
//    }
//}

public extension Dictionary{

    /// 递归设置子视图
    func recursion(_ cb: @escaping ((Dictionary) -> Void)){
        for (_, v) in self {
            if let dic = v as? Dictionary {
                cb(dic)
                recursion(cb)
            }
        }
    }
}

