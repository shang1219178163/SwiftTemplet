//
//  NNLeftRightTableViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/1.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class NNLeftRightTableViewController: UIViewController {
    lazy var leftTableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCellLeft")
        view.backgroundColor = UIColor.systemRed
        view.tableFooterView = UIView()
        view.dataSource = self
        view.delegate = self

        return view
    }()
    
    lazy var rightTableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCellRight")
        view.backgroundColor = UIColor.systemGreen
        view.tableFooterView = UIView()
        view.dataSource = self
        view.delegate = self

        return view
    }()

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        edgesForExtendedLayout = []
        
        view.addSubview(leftTableView)
        view.addSubview(rightTableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        leftTableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.left.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        
        rightTableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
            make.width.equalToSuperview().multipliedBy(0.7)
        }
    }

}

extension NNLeftRightTableViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableView == leftTableView ? 1 : 40
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == leftTableView ? 40 : 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == leftTableView {
            let cell = NNLeftTableViewCell.dequeueReusableCell(tableView)
            cell.textLabel?.text = "种类\(indexPath.row)"
            return cell
        } else {
            let cell = UITableViewCell.dequeueReusableCell(tableView)
            cell.textLabel?.text = "\(indexPath.section)_\(indexPath.row)"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == leftTableView {
            let newIndexP = IndexPath(row: 0, section: indexPath.row)
            rightTableView.selectRow(at: newIndexP, animated: true, scrollPosition: .top)
//            rightTableView.deselectRow(at: newIndexP, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView == leftTableView ? 0 : 25
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableView == leftTableView ? nil : " section \(section)"
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel(frame: .zero);
        //        label.backgroundColor = .green;
        //        label.text = "header\(section)";
        return label;
    }
}
extension NNLeftRightTableViewController: UIScrollViewDelegate{

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == leftTableView {
            return
        }
        guard let topHeaderViewIndexP = rightTableView.indexPathsForVisibleRows?.first else { return }
        let moveToIndexP = IndexPath(row: topHeaderViewIndexP.section, section: 0)
        leftTableView.selectRow(at: moveToIndexP, animated: true, scrollPosition: .middle)
    }

}
