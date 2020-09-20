//
//  BlueViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/11.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


class BlueViewController: UIViewController {

    lazy var transitionDelegate: NNTransitionDelegate = {
        let delgate = NNTransitionDelegate(presented: NNLargeAnimator(), dismissed: NNSmallAnimator())
        return delgate
    }()
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Blue"
        self.view.backgroundColor = .systemBlue
        self.transitioningDelegate = transitionDelegate

        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect(x: 30,y: 30, width: 100, height: 100)
        btn.setTitle("pop", for: .normal)
        btn.addTarget(self, action:#selector(pop) , for: .touchUpInside)
        view.addSubview(btn)

        
        let dismissBtn = UIButton.init(type: .custom)
        dismissBtn.frame = CGRect(x:30,y: 230 ,width: 100, height: 100)
        dismissBtn.setTitle("dismiss", for: .normal)
        dismissBtn.addTarget(self, action:#selector(dism) , for: .touchUpInside)
        view.addSubview(dismissBtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    @objc func pop() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func dism() {
        self.dismiss(animated: true, completion: {
            
        })
    }

}
