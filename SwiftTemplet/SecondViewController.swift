
//
//  SecondViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2018/8/10.
//  Copyright © 2018年 BN. All rights reserved.
//

import UIKit

import Alamofire
import SwiftExpand
import SDWebImage
import SnapKit

import RxSwift


class SecondViewController: UIViewController{
    var disposeBag = DisposeBag()

    //MARK: -lazy
    lazy var segmentCtl: NNSegmentedControl = {
        let rect = CGRect(0, 0, 240, 44)
        let view = NNSegmentedControl(frame: rect)
        view.showStyle = .bottomLine
        view.normalColor = .gray
        view.selectedColor = .white
        view.items = ["过去", "现在", "将来"]
        view.addActionHandler({ (sender) in
            DDLog(sender.selectedSegmentIndex)
            
        }, for: .valueChanged)
        return view;
    }()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen

        navigationItem.titleView = segmentCtl
        
        tbView.refreshHeader {
            DDLog("111")

            }.rx.event
            .subscribe(onNext: { (header) in
//                DDLog(header)
                header.endRefreshing()
            }, onError: { (error) in
                DDLog("error")
            }, onCompleted: {
                DDLog("onCompleted")
            }).disposed(by: disposeBag)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        testRxSwiftFun()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

    }
        

    
    //MARK: -funtions
    
    @objc func testRxSwiftFun() {
//        tbView.reloadData()
        let A = BehaviorSubject(value: "A的默认消息")
        let B = BehaviorSubject(value: "B的默认消息")

//        Observable.of(A,B)
//        .flatMap {$0}
//        .subscribe(onNext: {
//            print($0)
//        })
//        .disposed(by: disposeBag)
//        A的默认消息
//        B的默认消息
//        A-2
//        A-3
//        B-2
//        B-3
//        B-4
        
//        Observable.of(A,B)
//        .flatMapLatest {$0}
//        .subscribe(onNext: {
//            print($0)
//        })
//        .disposed(by: disposeBag)
//        当观察者从A转到B的时候，就不再观察A发出来的元素。
//        A的默认消息
//        B的默认消息
//        B-2
//        B-3
//        B-4

//        A.onNext("A-2")
//        A.onNext("A-3")
//        B.onNext("B-2")
//        B.onNext("B-3")
//        B.onNext("B-4")

        Observable.of(A,B)
        .concatMap {$0}
        .subscribe(onNext: {
            print($0)}
        )
        .disposed(by: disposeBag)

        A.onNext("A-2")
        B.onNext("B-2")
        B.onNext("B-3")
        A.onCompleted()
        A.onNext("A-3")
        B.onNext("B-4")
    }
}

