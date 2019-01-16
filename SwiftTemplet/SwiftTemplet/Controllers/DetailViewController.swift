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
        
        createBarItem(systemItem: .done, isLeft: false) {[weak self] (item:AnyObject?) in
            
            UIView.transition(with: (self!.navigationController?.view)!, duration: 0.1, options: .transitionCrossDissolve, animations: {
                self!.navigationController?.popViewController(animated: false)
            }, completion: { (finish) in
                
            })
        }
    }
    


}
