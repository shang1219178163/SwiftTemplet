//
//  TransitionAnimatorShowController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/17.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import HFNavigationController
import SnapKit
import SwiftExpand

class TransitionAnimatorShowController: UIViewController {
    

    lazy var controller: UILabelMultipleTapController = {
        let controller = UILabelMultipleTapController()

        return controller;
    }()
    
    private lazy var animatorShow: NNTransitionAnimator = {
        let animator = NNTransitionAnimator(duration: 0.25, animateType: .fade)
        return animator
    }()
    
    private lazy var animatorHide: NNTransitionAnimator = {
        let animator = NNTransitionAnimator(duration: 0.25, animateType: .fade)
        return animator
    }()
        
    //MARK: - layz
    lazy var tableView: UITableView = {
        let table = UITableView(frame:self.view.bounds, style:.plain);
        table.rowHeight = 60
        table.dataSource = self;
        table.delegate = self;

        return table;
    }();
    
    
    var indexP: IndexPath = IndexPath(row: 0, section: 0)
    
    lazy var list: [String] = {
        let list = ["默认", "right进left出", "left进right出", "top进bottom出", "bottom进top出"]
        return list
    }()

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        edgesForExtendedLayout = []
//        self.definesPresentationContext = true

        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(handleItemLeft))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Right", style: .plain, target: self, action: #selector(handleItemRight))
        
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(0)
            make.left.equalToSuperview().offset(0);
            make.right.equalToSuperview().offset(0);
            make.bottom.equalToSuperview().offset(0);
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.delegate = self

    }
    
    @objc func handleItemLeft() {

        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else { return }
        rootViewController.present(controller, animated: true, completion: nil)
        
    }
    
    @objc func handleItemRight() {
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else { return }
        rootViewController.present(controller, animated: true, completion: nil)
        
    }

}

extension TransitionAnimatorShowController: UITableViewDataSource, UITableViewDelegate {
    //    MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell.dequeueReusableCell(tableView)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell.textLabel?.textColor = indexP == indexPath ? UIColor.theme : UIColor.textColor6;
        cell.accessoryType = indexP == indexPath ? .checkmark : .none;
        
        guard let value = list[indexPath.row] as String? else { return cell }
        cell.textLabel?.text = value
        
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
        var showAnimateType: NNTransitionAnimator.AnimateType = .fade
        var hideAnimateType: NNTransitionAnimator.AnimateType = .fade

        switch indexPath.row {
        case 1:
            showAnimateType = .right
            hideAnimateType = .left
        case 2:
            showAnimateType = .left
            hideAnimateType = .right
        case 3:
            showAnimateType = .top
            hideAnimateType = .bottom
        case 4:
            showAnimateType = .bottom
            hideAnimateType = .top
        default:
            break
        }
        animatorShow.animateType = showAnimateType
        animatorHide.animateType = hideAnimateType
        navigationController?.pushViewController(controller, animated: true)
        
//        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else { return }
//        rootViewController.present(controller, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return section == 0 ? "location" : "animation"
//    }
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

extension TransitionAnimatorShowController: UIViewControllerTransitioningDelegate{
        
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animatorShow
    }

    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animatorHide
    }
}


extension TransitionAnimatorShowController:  UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController,
                    animationControllerFor operation: UINavigationController.Operation,
                                         from fromVC: UIViewController,
                                             to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return operation == .push ? animatorShow : animatorHide
    }
}
