//
//  NSObject+AddForKVO.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/4/26.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit

class _KVOBlockTarget: NSObject {

    var block: ((Any, Any?, Any?)->Void)?
    
    convenience init(block: ((Any, Any?, Any?)->Void)?) {
        self.init()
        self.block = block
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let object = object, let change = change else { return }
        
        if let isPrior = change[.notificationIsPriorKey] as? Bool, isPrior == true {
            return
        }
        
        if let changeKind = change[.kindKey] as? Int, changeKind != 1 {
            return
        }
        
        let oldVal: Any? = change[.oldKey]
        let newVal: Any? = change[.newKey]
        block?(object as Any, oldVal, newVal)
    }
}
    
@objc public extension NSObject{

    private struct AssociateKeys {
        static var obseverDic   = "NSObject" + "obseverDic"
    }
    
    private(set) var obseverDic: [String: [NSObject]] {
        get {
            if let obj = objc_getAssociatedObject(self, &AssociateKeys.obseverDic) as? [String: [NSObject]] {
                return obj
            }

            let obj = [String: [NSObject]]()
            objc_setAssociatedObject(self, &AssociateKeys.obseverDic, obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            return obj
        }
        set {
            objc_setAssociatedObject(self, &AssociateKeys.obseverDic, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    func addObserverClosure(for keyPath: String?, block: ((Any, Any?, Any?)->Void)?) {
        guard let keyPath = keyPath, let block = block else { return }
        let target = _KVOBlockTarget(block: block)
        
        if obseverDic[keyPath] == nil{
            obseverDic[keyPath] = [NSObject]()
        }
        obseverDic[keyPath]?.append(target)
        addObserver(target, forKeyPath: keyPath, options: [.new, .old], context: nil)
    }
    
    func removeObserverClosures() {
        obseverDic.forEach { (key: String, value: [NSObject]) in
            value.forEach { (obj) in
                self.removeObserver(obj, forKeyPath: key)
            }
        }
    }
    
    func removeObserver(for keyPath: String?) {
        guard let keyPath = keyPath, let list = obseverDic[keyPath] else { return }
        list.forEach { (obj) in
            self.removeObserver(obj, forKeyPath: keyPath)
        }
    }
}
