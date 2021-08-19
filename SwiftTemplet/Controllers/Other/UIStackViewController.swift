//
//  UIStackViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/11/26.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

/// textView.isScrollEnabled = false
class UIStackViewController: UIViewController {

    lazy var stackView: UIStackView = {
        //创建StackView
        let stackView = UIStackView()
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //设置子视图间隔
        stackView.spacing = 10
        
        //子视图的高度或宽度保持一致
//        stackView.distribution = .fillProportionally
//        stackView.backgroundColor = UIColor.lightBlue
        
        stackView.distribution = .fill
        stackView.alignment = .trailing

        return stackView;
    }()

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        
//        [UIImage(named: "Skull.jpg"),
//         UIImage(named: "Skull.jpg"),
//         UIImage(named: "Skull.jpg")]
//            .map { image in
//                let imageView = UIImageView(image: image)
//                imageView.contentMode = .scaleAspectFill
//                imageView.clipsToBounds = true
//                return imageView
//            }
//            .forEach {
//                stackView.addArrangedSubview($0)
//            }
        ["取消", "删除", "扩容", "减配", "续费", "加购"]
            .map { e in
            let sender = UIButton(type: .custom)
            sender.setTitle(e, for: .normal)
            sender.addTarget(self, action: #selector(self.handleActionBtn(_:)), for: .touchUpInside)
            sender.sizeToFit()
            sender.setBackgroundColor(.systemBlue, for: .normal)
            return sender
        }.forEach {
            stackView.addArrangedSubview($0)
        }
         
        //将StackView添加到主视图中
        view.addSubview(stackView)
        
        view.addGestureTap { (reco) in
            self.dismiss(animated: true, completion: nil)
        }

        view.getViewLayer()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        stackView.axis = UIApplication.shared.statusBarOrientation.isPortrait ? .vertical : .horizontal
        stackView.axis = .horizontal
        stackView.frame = self.view.bounds.inset(by: UIEdgeInsetsMake(10, 10, 10, 10))
        
        stackView.setSubViewMultiplier(0.1, at: 0)
        stackView.setSubViewMultiplier(0.1, at: 1)
    }
    
    
    

    // MARK: -funtsion
    
    @objc func handleActionBtn(_ sender: UIButton) {
        DDLog(sender.currentTitle)
    }
  
}
