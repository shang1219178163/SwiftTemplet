//
//  AlerSheetStudyController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/31.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class AlerSheetStudyController: UIViewController {

    lazy var alertVC: UIAlertController = {
        let titles = ["Twitter", "Spotify", "Pinterest"]
        let images: [UIImage] = [UIImage(named:"icon_num1")!.withRenderingMode(.alwaysOriginal),
                      UIImage(named:"icon_num2")!.withRenderingMode(.alwaysOriginal),
                      UIImage(named:"icon_num3")!.withRenderingMode(.alwaysOriginal),
        ]

        let alertVC = UIAlertController.createSheet("标题", msg: "这是一条提示信息", items: titles) { (controller, action) in
            let actionIdx = controller.actions.firstIndex(of: action)
            DDLog(actionIdx)
        }
        alertVC.actions.forEach { (action) in
            guard let actionIdx = alertVC.actions.firstIndex(of: action) else { return }
            if actionIdx < images.count {
                let image = images[actionIdx]
                action.setValue(image.withRenderingMode(.alwaysOriginal), forKey: "image")
            }
        }
        return alertVC
    }()
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let rect = CGRect(x: 0, y: 0, width: 60, height: 30)
        
        let btn = UIButton.create(rect, title: "Show", textColor: .white, backgroundColor: .theme)
        btn.addTarget(self, action: #selector(showActionSheet(_:)), for: .touchUpInside)
        
        let btn1 = UIButton.create(rect, title: "done", textColor: .white, backgroundColor: .theme)
        btn1.addTarget(self, action: #selector(showActionSheet1(_:)), for: .touchUpInside)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: btn), UIBarButtonItem(customView: btn1)]
    }
    

    @objc func showActionSheet(_ sender: UIButton){
      let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
      
      let twitterAction = UIAlertAction(title: "Twitter", style: .default, handler: nil)
      // 为这个动作添加一个 icon
        twitterAction.setValue(UIImage(named:"icon_num1")?.withRenderingMode(.alwaysOriginal), forKey: "image")
      
      let spotifyAction = UIAlertAction(title: "Spotify", style: .default, handler: nil)
      spotifyAction.setValue(UIImage(named:"icon_num2")?.withRenderingMode(.alwaysOriginal), forKey: "image")
      
      let pinterestAction = UIAlertAction(title: "Pinterest", style: .default, handler: nil)
      pinterestAction.setValue(UIImage(named:"icon_num3")?.withRenderingMode(.alwaysOriginal), forKey: "image")
        pinterestAction.setValue(UIImage(named:"icon_num3")?.withRenderingMode(.alwaysOriginal), forKey: "image")
        pinterestAction.setValue(NSNumber(booleanLiteral: true), forKey: "checked")
        
      alertVC.addAction(twitterAction)
      alertVC.addAction(spotifyAction)
      alertVC.addAction(pinterestAction)
      alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
      
      self.present(alertVC, animated: true, completion: nil)
    }
    
    @objc func showActionSheet1(_ sender: UIButton){
//        alertVC.view.getViewLayer()
      self.present(alertVC, animated: true, completion: nil)
    }

}
