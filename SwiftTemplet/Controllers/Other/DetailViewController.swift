//
//  DetailViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/12/13.
//  Copyright © 2018 BN. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        let str = "Hello, playground" as CFString
        
        let stringType = String(format: "type id: %d", CFGetTypeID(str))
        print(stringType)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .done, action: { item in
            guard let navigationController = self.navigationController as? UINavigationController else { return }
            UIView.transition(with: navigationController.view, duration: 0.1, options: .transitionCrossDissolve, animations: {
                navigationController.popViewController(animated: false)
            }, completion: { (finish) in
                
            })
        })
    }
    

}
