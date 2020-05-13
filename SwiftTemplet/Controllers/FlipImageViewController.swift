//
//  FlipImageViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/30.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SnapKit

class FlipImageViewController: UIViewController {
    
    lazy var imgView: UIImageView = {
        var view = UIImageView(frame: .zero);
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.image = UIImage(named: "btn_selected_YES")

        return view;
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(imgView)
        
        imgView.addGestureTap(self, action: #selector(handleAction))
        
        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20);
            make.left.equalToSuperview().offset(20);
            make.width.equalTo(50);
            make.height.equalTo(50);
        }
    }
    
    @objc func handleAction() {
        let backImage = UIImage(named: "btn_selected_NO")
        imgView.addFlipAnimtion(imgView.image!, backImage: backImage!)
    }

}

//extension UIImageView{
//    func addFlipAnimtion(_ image: UIImage, backImage: UIImage, isRepeat: Bool = true) {
//        let opts: UIView.AnimationOptions = [.transitionFlipFromLeft]
//        UIView.transition(with: self, duration: 1.35, options: opts, animations: {
//            self.image = (self.image == image) ? backImage : image
//
//        }) { (finished) in
//            if isRepeat {
//                self.addFlipAnimtion(image, backImage: backImage)
//            }
//        }
//    }
//}
