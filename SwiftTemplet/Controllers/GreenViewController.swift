//
//  GreenViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/11.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {
    
    lazy var navControllerDelegate: NNNavigationControllerDelegate = {
        let delgate = NNNavigationControllerDelegate(push: NNRightAnimator(), pop: NNLeftAnimator(), isInteraction: false)
//        let delgate = NNNavigationControllerDelegate(push: NNPullDownAnimator(), pop: NNPushUpAnimator(), isInteraction: false)
        return delgate
    }()

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "GreenController"
        view.backgroundColor = UIColor.systemGreen

        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect(x:30,y: 30 ,width: 100, height: 100)
        self.view.addSubview(btn)
        btn.setTitle("push", for: .normal)
        btn.addTarget(self, action:#selector(push) , for: .touchUpInside)
        
        
        let btn_present = UIButton.init(type: .custom)
        btn_present.frame = CGRect(x:30,y: 230 ,width: 100, height: 100)
        self.view.addSubview(btn_present)
        btn_present.setTitle("btn_present", for: .normal)
        btn_present.addTarget(self, action:#selector(pre) , for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.delegate = navControllerDelegate
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        self.transitioningDelegate = nil
//        self.navigationController?.delegate = nil
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func push() {
        let second = BlueViewController()
        self.navigationController?.pushViewController(second, animated: true)
    }
    @objc func pre() {
        let second = BlueViewController()
        self.present(second, animated: true) {
            
        }
    }

}
