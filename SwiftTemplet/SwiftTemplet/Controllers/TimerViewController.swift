//
//  TimerViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/2/15.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    var timer = Timer()
    var clickNums: Int = 5;
    var isPause: Bool = false;

    override func viewDidLoad() {
        super.viewDidLoad()
        makeTimer()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func makeTimer() {
        //穿件计时器
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
//
//            self.clickNums += 1
//            print(self.clickNums)
//
//        })
        
        timer = Timer.scheduled(1, repeats: true, action: { (obj) in
            self.clickNums += 1
            print(self.clickNums)
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        clickNums = 5
        
        isPause = !isPause;
        timer.pause(isPause)
//        timer.fireDate = isPause == false ? Date.distantFuture : Date.distantPast;
        
        print(isPause)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        timer.fireDate = Date.distantFuture// 计时器暂停
        timer.invalidate() // 计时器销毁        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

