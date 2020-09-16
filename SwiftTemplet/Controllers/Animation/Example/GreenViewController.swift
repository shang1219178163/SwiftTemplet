//
//  GreenViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/9/11.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import NNPopoverButton

class GreenViewController: UIViewController {
    
    lazy var navControllerDelegate: NNNavigationControllerDelegate = {
//        let delgate = NNNavigationControllerDelegate(push: NNLargeAnimator(), pop: NNSmallAnimator())
        let delgate = NNNavigationControllerDelegate(push: NNRightAnimator(), pop: NNLeftAnimator())
//        let delgate = NNNavigationControllerDelegate(push: NNPullDownAnimator(), pop: NNPushUpAnimator())
        return delgate
    }()
    
    lazy var btn: NNPopoverButton = {
        let button = NNPopoverButton(type: .custom)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.setTitle("Left", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.sizeToFit()
        button.parentVC = self
        button.contentWidth = 160
        button.list = [ "左右动画", "上下动画", "大小动画",]
        button.setTitle(button.list.first, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.sizeToFit()

        button.delegate = self
        return button
    }()

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "GreenController"
        view.backgroundColor = UIColor.systemGreen

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btn)
        
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect(x:30,y: 30 ,width: 100, height: 100)
        self.view.addSubview(btn)
        btn.setTitle("push", for: .normal)
        btn.addTarget(self, action:#selector(push) , for: .touchUpInside)
        
        
        let btn_present = UIButton.init(type: .custom)
        btn_present.frame = CGRect(x:30,y: 230 ,width: 100, height: 100)
        self.view.addSubview(btn_present)
        btn_present.setTitle("btn_present", for: .normal)
        btn_present.addTarget(self, action:#selector(pre) , for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.delegate = navControllerDelegate
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        self.transitioningDelegate = nil
//        self.navigationController?.delegate = nil
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func push() {
        let second = BlueViewController()
        self.navigationController?.pushViewController(second, animated: true)
    }
    @objc func pre() {
        let second = BlueViewController()
        self.present(second, animated: true) {
            
        }
    }

}

extension GreenViewController: NNPopoverButtonDelegate {
    public func popoverButton(_ popoverBtn: NNPopoverButton, tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as UITableViewCell? else { return }
        popoverBtn.setTitle(cell.textLabel?.text ?? "--", for: .normal)
        popoverBtn.sizeToFit()

        switch indexPath.row {
        case 1:
            navControllerDelegate = NNNavigationControllerDelegate(push: NNPullDownAnimator(), pop: NNPushUpAnimator())

        case 2:
            navControllerDelegate = NNNavigationControllerDelegate(push: NNLargeAnimator(), pop: NNSmallAnimator())
            
        default:
            navControllerDelegate = NNNavigationControllerDelegate(push: NNRightAnimator(), pop: NNLeftAnimator())
        }
        navigationController?.delegate = navControllerDelegate
    }
}
