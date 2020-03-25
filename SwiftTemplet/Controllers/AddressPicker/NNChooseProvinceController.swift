//
//  NNChooseProvinceController.swift
//  HFNavigationController_Example
//
//  Created by Bin Shang on 2020/1/3.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import SwiftExpand

class NNChooseProvinceController: UIViewController {
        
    var parentVC: NNAddressPickerController = NNAddressPickerController()
    
    var list: [NNAddressLabelModel] = []
    var dataModel: NNAddressLabelModel?
    
    var indexP: IndexPath = IndexPath(row: 0, section: 0)

    lazy var viewModel: NNAddressPickerViewModel = {
        let viewModel = NNAddressPickerViewModel();
        viewModel.districtApi.leveltype = "1"
        return viewModel;
    }()
    // MARK: -life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "省"
        view.addSubview(tbView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        requestList();
    }

    func requestList() {
        viewModel.requestList { (list) in
            self.list = list;
            if self.dataModel == nil {
                self.dataModel = list.first;
            }
            if self.parentVC.secondVC.parentModel == nil {
                self.parentVC.secondVC.parentModel = self.dataModel
            }
            self.tbView.reloadData()
        }
    }

    
}

extension NNChooseProvinceController: UITableViewDataSource, UITableViewDelegate {
    //    MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    };
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    };
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.textColor = indexP == indexPath ? UIColor.theme : UIColor.textColor6;
        cell.accessoryType = indexP == indexPath ? .checkmark : .none;
        
        let model: NNAddressLabelModel = list[indexPath.row]
        cell.textLabel?.text = model.label ?? "--"
        
//        cell.getViewLayer()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexP != indexPath  {
            let newCell = tableView.cellForRow(at: indexPath)
            newCell?.accessoryType = .checkmark
            newCell?.textLabel?.textColor = UIColor.theme

            let oldCell = tableView.cellForRow(at: indexP)
            oldCell?.accessoryType = .none
            oldCell?.textLabel?.textColor = UIColor.textColor6;
            indexP = indexPath
        }
        
        let model: NNAddressLabelModel = list[indexPath.row]
        dataModel = model;

        parentVC.secondVC.parentModel = model
        parentVC.selectedIndex = 1;

        parentVC.firstVC.title = model.label
        parentVC.scrollViewTop.collectionView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return UIView();
//    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let label = UILabel(frame: .zero);
//        //        label.backgroundColor = .green;
//        //        label.text = "header\(section)";
//        return label;
//    }
    
}

