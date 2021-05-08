//
//  NNPasswordLevelLabel.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/4/21.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit

let kPasswordTips = "密码: 8-16位数字/字母（区分大小写）及标点符号至少包含2种，不允许有空格、中文."

///密码等级
@objc public enum NNPasswordLevel: Int {
//    case low = 0, mid, high
    case none = 0, low, mid, high
}

@objcMembers public class NNPasswordLevelLabel: UILabel {

    var lowLevelText = "弱"
    var midLevelText = "中"
    var highLevelText = "强"
    
    var lowLevelColor: UIColor = .lightOrange
    var midLevelColor: UIColor = .lightGreen
    var highLevelColor: UIColor = .lightBlue

    func update(_ level: NNPasswordLevel) {
        switch level {
        case .mid:
            text = midLevelText
            textColor = midLevelColor
            
        case .high:
            text = highLevelText
            textColor = highLevelColor
            
        default:
            text = lowLevelText
            textColor = lowLevelColor
        }
    }
}



@objc public extension UILabel{
    
    func update(by level: NNPasswordLevel) {
        switch level {
        case .mid:
            text = "中"
            textColor = .lightGreen
            
        case .high:
            text = "强"
            textColor = .lightBlue
            
        default:
            text = "弱"
            textColor = .lightGreen
        }
    }
}

@objcMembers class NNPasswordLevelTarget: NSObject {
    
    weak var sender: UITextField?
    private var level: NNPasswordLevel = .none
    private var levelBlock: ((String, NNPasswordLevel)->Void)?

    var isEitingDidEndShowAlert: Bool = true

    private(set) lazy var pwdLevelLab: UILabel = {
        var view = UILabel()
        view.text = ""
        view.font = UIFont.systemFont(ofSize: 15)
        view.numberOfLines = 1
        return view
    }()
    
    ///设置密码强度
    func setupPasswordLevel(_ handler: ((String, NNPasswordLevel)->Void)?) {
        levelBlock = handler
        sender?.clearButtonMode = .never
        sender?.rightView = self.pwdLevelLab
        sender?.rightViewMode = .always
        sender?.addTarget(self, action: #selector(passwordNewChanged(_:)), for: .editingChanged)
        sender?.addTarget(self, action: #selector(passwordNewEditingDidEnd(_:)), for: .editingDidEnd)
    }
    
    @objc private func passwordNewChanged(_ textField: UITextField) {
        let value: String = textField.text ?? ""
        if value.passwordLevel < 2 {
            pwdLevelLab.update(by: .none)
            levelBlock?(value, .none)
            return
        }
        let levelValue: Int = value.passwordLevel-1
        guard let level = NNPasswordLevel(rawValue: levelValue) else { return }
        pwdLevelLab.update(by: level)
        levelBlock?(value, level)
    }
    
    @objc private func passwordNewEditingDidEnd(_ textField: UITextField) {
        let value: String = textField.text ?? ""
        if value.count > 8 && value.passwordLevel < 2 && isEitingDidEndShowAlert {
//            SVProgressHUD.showInfo(withStatus: kPasswordTips)
//            UIAlertController.showAlert(nil, message: kPasswordTips, actionTitles: [kTitleSure], block: nil, handler: nil)
            NNProgressHUD.showText(kPasswordTips)
        }
    }
}


@objc public extension UITextField{
    private struct AssociateKeys {
        static var passwordLevelTarget   = "UITextField" + "passwordLevel"
    }
    /// 关联UITableView视图对象
    private var levelTarget: NNPasswordLevelTarget {
        get {
            if let obj = objc_getAssociatedObject(self, &AssociateKeys.passwordLevelTarget) as? NNPasswordLevelTarget {
                return obj
            }

            let target = NNPasswordLevelTarget()
            target.sender = self
            
            objc_setAssociatedObject(self, &AssociateKeys.passwordLevelTarget, target, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            return target
        }
    }
    ///实时回调密码强度
    func passwordLevel(_ handler: ((String, NNPasswordLevel)->Void)?) {
        levelTarget.setupPasswordLevel(handler)
    }
    ///设置密码强度
    func setPasswordLevel(_ level: NNPasswordLevel) {
        levelTarget.pwdLevelLab.update(by: level)
    }
    ///是否在每次输入结束后弹出错误提示框
    func setPasswordLevelEitingDidEndShowAlert(_ value: Bool) {
        levelTarget.isEitingDidEndShowAlert = value
    }
}
