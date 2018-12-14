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
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
