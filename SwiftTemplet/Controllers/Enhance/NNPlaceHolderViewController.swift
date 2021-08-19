//
//  NNPlaceHolderViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/5/21.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import SwiftExpand
import Then

class NNPlaceHolderViewController: UIViewController {
    
    lazy var segmentedCtl: UISegmentedControl = {
        let items = ["nomrol", "loading", "empty", "fail"]
        let sender = UISegmentedControl(items: items).then({
            $0.selectedSegmentIndex = 1
            $0.tintColor = .systemBlue
            $0.addTarget(self, action: #selector(handleActionSeg(_:)), for: .valueChanged)            
        });
        
        return sender
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 95)
        view.dataSource = self
        view.delegate = self

        view.placeHolderView.setTitle("抱歉，附近无此类型停车场！", for: .empty)
        view.placeHolderView.setImage(UIImage(named: "img_placeholder_empty")!, for: .empty)
        view.placeHolderView.setTitle("网络连接错误，请稍后重试", for: .fail)
        view.placeHolderView.setImage(UIImage(named: "img_placeholder_offonline")!, for: .fail)
        
        return view
    }()

    
    var dataList = [String]()
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.addSubview(tableView)

        
        navigationItem.titleView = segmentedCtl
        
        view.getViewLayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        tableView.placeHolderView.state = .fail
//        tableView.placeHolderView.state = .empty
    }

    @objc func handleActionSeg(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        tableView.placeHolderView.state = NNPlaceHolderViewState(rawValue: sender.selectedSegmentIndex)!

    }
    
}


extension NNPlaceHolderViewController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.dequeueReusableCell(tableView);

        let title = dataList[indexPath.row]
        cell.textLabel?.text = title
//        cell.getViewLayer()
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = dataList[indexPath.row]

        DDLog(title)
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 1.01;
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UILabel();
//    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UILabel();
    }
}
