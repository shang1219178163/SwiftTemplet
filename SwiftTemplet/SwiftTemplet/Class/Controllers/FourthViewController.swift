
//
//  FourthViewController.swift
//  SwiftTemplet
//
//  Created by hsf on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit


class FourthViewController: UIViewController {
    
//    var progressView:UIAnnularProgress?

    var progress: CGFloat = 0.0;

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = [];
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.green;

        let mView = MyView(frame: CGRect(x:20, y:20, width:kScreen_width/2, height:kScreen_width/2));
        
        mView.backgroundColor = UIColor.purple;
        view.addSubview(mView);
        
        
        //        mView.mblock = {(message:UIViewController)->(Void) in
//            self.present(message, animated: true, completion: nil);
//
//        }
//        self.addClockView();
        view.addSubview(progressView)
    }

    
    func addClockView(){
        let clockView = BN_ClockView(frame: CGRect(x: 20, y: 20, width: kScreen_width - 40, height: kScreen_width - 40));
        clockView.itemList = ["111","222","333","444","555","666","777","888",];
        clockView.backgroundColor = UIColor.random();
        clockView.image = UIImage(named: "beach");
        view.addSubview(clockView);
        
        clockView.aniDuration = 12;
        clockView.aniRotation(isClockwise: true, clockView.aniDuration!, MAXFLOAT, nil);
        clockView.layoutIfNeeded();//激活子视图动画
        
        clockView.layer.cornerRadius = clockView.frame.width/2.0;
        clockView.layer.masksToBounds = true;
        
        clockView.addActionHandler { (tap, sender, idx) in
            print(sender);
            
        }
        
        clockView.getViewLayer();
    }
    
    
    lazy var progressView: UIAnnularProgress = {
        let progressView = UIAnnularProgress(frame: CGRect(x:50,y:kScreen_width/2+40,width:100,height:100));
        progressView.backgroundColor = UIColor.cyan;
        return progressView;
    }();
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        progress += 0.1
        if progress >= 1.0 {
            progress = 0
        }
        progressView.setProgress(progress: progress, time:0.6, animate: true)
        
    }
}
