//
//  ValidateProtocol.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/12/4.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


public protocol ValidateProtocol{
    
    func isValidUrl(_ value: String) -> Bool
    
    func isValidHttpUrl(_ value: String) -> Bool
    
    func isValidFileUrl(_ value: String) -> Bool
    
    func isValidIDCard(_ value: String) -> Bool
    
    func isValidPhone(_ value: String) -> Bool
    
    func isValidEmail(_ value: String) -> Bool
}

extension ValidateProtocol{
    
    public func isValidUrl(_ value: String) -> Bool {
        return URL(string: value) != nil
    }

    public func isValidHttpUrl(_ value: String) -> Bool {
        guard let url = URL(string: value) else { return false }
        return url.scheme == "http" || url.scheme == "https"
    }
    
    public func isValidFileUrl(_ value: String) -> Bool {
        return URL(string: value)?.isFileURL ?? false
    }
    
    ///校验身份证号码
    public func isValidIDCard(_ value: String) -> Bool {
        let regex = "^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: value)
    }
    
    ///校验简单手机号码
    public func isValidPhone(_ value: String) -> Bool {
        let pattern = "^1[0-9]{10}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: value)
    }
    
    ///校验邮箱
    public func isValidEmail(_ value: String) -> Bool {
        if value.count == 0 {
            return false
        }
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: value)
    }
}
