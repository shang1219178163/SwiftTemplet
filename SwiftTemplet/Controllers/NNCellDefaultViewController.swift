//
//  NNCellDefaultViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/22.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import SnapKitExtend

class NNCellDefaultViewController: UIViewController {
        
    lazy var cellView: NNContentCellView = {
        let view = NNContentCellView(frame: .zero)
        view.cellStyle = .default
        view.textLabel.text = "手机号码:"
        view.detailTextLabel.text = "请输入手机号码"
//        view.label.isHidden = true
        view.btn.addActionHandler { (sender) in
            
            DDLog(sender.currentTitle ?? "无标题")
        }

        return view
    }()

    
    lazy var cellView1: NNContentCellView = {
        let view = NNContentCellView(frame: .zero)
        view.cellStyle = .value1

        view.textLabel.text = "手机号码:"
        view.detailTextLabel.text = "请输入手机号码"
//        view.label.isHidden = true
        view.btn.addActionHandler { (sender) in
            
            DDLog(sender.currentTitle ?? "无标题")
        }

        return view
    }()

    
    lazy var cellView2: NNContentCellView = {
        var view = NNContentCellView(frame: .zero)
        view.cellStyle = .subtitle

        view.textLabel.text = "手机号码:"
        view.detailTextLabel.text = "请输入手机号码"
//        view.label.isHidden = true
        view.btn.addActionHandler { (sender) in
            
            DDLog(sender.currentTitle ?? "无标题")
        }

        return view
    }()
    
    lazy var dateRangeView: NNDateRangeVerticalView = {
        let view = NNDateRangeVerticalView(frame: .zero)
        return view
    }()
    

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemGreen
        view.backgroundColor = .white

        createItem("done") { (item) in
            self.dateRangeShow()
        }
        
        view.addSubview(cellView)
        view.addSubview(cellView1)
        view.addSubview(cellView2)
        
        view.addSubview(dateRangeView)

//        view.getViewLayer()
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        cellView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(60);
        }
        
        cellView1.snp.makeConstraints { (make) in
            make.top.equalTo(cellView.snp.bottom).offset(10);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(60);
        }
        
        cellView2.snp.makeConstraints { (make) in
            make.top.equalTo(cellView1.snp.bottom).offset(10);
            make.left.equalToSuperview().offset(10);
            make.right.equalToSuperview().offset(-10);
            make.height.equalTo(60);
        }
        
        dateRangeView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(-100);
            make.height.equalTo(100);
        }
    }
    
    func dateRangeShow(_ animated: Bool = false) {
        dateRangeView.move(0, y: -150, animated: true)
//        dateRangeView.rotate(CGFloat(Double.pi), animated: true)
    }
    

}

extension UIView{
    
    ///移动动画
//    func move(_ x: CGFloat, y: CGFloat, animated: Bool, completion: ((Bool) -> Void)? = nil) {
//        let duration = animated ? 0.3 : 0
//        UIView.animate(withDuration: duration, animations: {
//            if self.transform.isIdentity == true {
//                self.transform = self.transform.translatedBy(x: x, y: y)
//            } else {
//                self.transform = CGAffineTransform.identity
//            }
//        }, completion: completion);
//    }
//    
//    public func rotate(_ angle: CGFloat, animated: Bool, completion: ((Bool) -> Void)? = nil) {
//        let duration = animated ? 0.3 : 0
//        UIView.animate(withDuration: duration, animations: {
//            if self.transform.isIdentity == true {
//                self.transform = self.transform.rotated(by: angle)
//            } else {
//                self.transform = CGAffineTransform.identity
//            }
//
//        }, completion: completion)
//    }
    
    //    ///移动动画
    //    func move(_ x: CGFloat, y: CGFloat, isReverse: Bool = true, animated: Bool, completion: ((Bool) -> Void)? = nil) {
    //        let duration = animated ? 0.15 : 0
    //        if isReverse == false {
    //            UIView.animate(withDuration: duration, animations: {
    //                if self.transform.isIdentity == true {
    //                    self.transform = self.transform.translatedBy(x: dx, y: dy)
    //                }
    //
    //            }, completion: completion);
    //            return
    //        }
    //
    //        let dx: CGFloat = transform == .identity ? x : x * -1
    //        let dy: CGFloat = transform == .identity ? y : y * -1
    //
    //        UIView.animate(withDuration: duration, animations: {
    //            if self.transform.isIdentity == true {
    //                self.transform = self.transform.translatedBy(x: dx, y: dy)
    //            } else {
    //                self.transform = CGAffineTransform.identity
    //            }
    //
    //        }, completion: completion);
    //    }
    
}
