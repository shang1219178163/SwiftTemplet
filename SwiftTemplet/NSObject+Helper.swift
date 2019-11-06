
//
//  NSObject+Helper.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/9/12.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit


@objc public extension NSObject{

   
    
    
  
}


@objc public extension Bundle{
    static func infoDictionary(plist: String) -> [String: AnyObject]? {
        guard
            let pList = Bundle.main.path(forResource: plist, ofType: "plist"),
            let dic = NSDictionary(contentsOfFile: pList)
            else { return nil; }
        return dic as? [String : AnyObject]
    }
    
    func infoFrom(plist: String, key: String) -> AnyObject? {
        guard let dic = Bundle.infoDictionary(plist: plist) else {
            return nil
        }
        return dic[key]
    }
    
}

@objc public extension UIApplication{
//    static func setupAppearanceSearchbarCancellButton() {
//        let shandow: NSShadow = {
//            let shadow = NSShadow();
//            shadow.shadowColor = UIColor.darkGray;
//            shadow.shadowOffset = CGSize(width: 0, height: -1);
//            return shadow;
//        }();
//
//        let dic: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor:  UIColor.white,
//                                                  NSAttributedString.Key.font:  UIFont.systemFont(ofSize: 13),
//                                                  NSAttributedString.Key.shadow:  shandow,
//                                                  ]
//        UIBarButtonItem.appearance().setTitleTextAttributes(dic, for: .normal)
//        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
//    }
    
}

@objc public extension UIView{
//    static func createSearchBarRect(_ rect: CGRect) -> UISearchBar {
//        let searchBar = UISearchBar(frame: rect)
//
//        searchBar.layer.cornerRadius = rect.height*0.5;
//        searchBar.layer.masksToBounds = true;
//        //设置背景图是为了去掉上下黑线
//        searchBar.backgroundImage = UIImage();
//        //searchBar.backgroundImage = [UIImage imageNamed:@"sexBankgroundImage"];
//        // 设置SearchBar的主题颜色
//        //searchBar.barTintColor = [UIColor colorWithRed:111 green:212 blue:163 alpha:1];
//        //设置背景色
//        searchBar.backgroundColor = UIColor.black.withAlphaComponent(0.1);
//
//        searchBar.barStyle = .default;
//        searchBar.keyboardType = .namePhonePad;
//        //searchBar.searchBarStyle = UISearchBarStyleMinimal;
//        //没有背影，透明样式
//        // 修改cancel
//        searchBar.setValue("取消", forKey: "cancelButtonText")
//        searchBar.showsCancelButton = true;
//        //    searchBar.showsSearchResultsButton = true;
//        //5. 设置搜索Icon
//        //    [searchBar setImage:[UIImage imageNamed:@"Search_Icon"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
//        searchBar.setPositionAdjustment(UIOffset(horizontal: -8, vertical: 1), for: .search)
//        // 删除按钮往右移一点
//        searchBar.setPositionAdjustment(UIOffset(horizontal: 8, vertical: 0), for: .clear)
//
//        guard let textField: UITextField = (searchBar.findSubview(type: UITextField.self, resursion: true) as? UITextField) else { return searchBar; }
//        textField.backgroundColor = UIColor.clear
//        textField.tintColor = UIColor.gray;
//        textField.textColor = UIColor.white;
//        textField.font = UIFont.systemFont(ofSize: 13)
//
//        return searchBar;
//    }
    
}

import SwiftExpand
@objc extension UISearchBar{
    
//    var placeholderStr: String {
//        get {
//            return objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as! String;
//        }
//        set {
//            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//            
//            if newValue.count <= 0  {
//                return;
//            }
//            let dic: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor:  UIColor.white.withAlphaComponent(0.5),
//                                                      NSAttributedString.Key.font:  UIFont.systemFont(ofSize: 13),
//            ]
//            guard let textField: UITextField = (self.findSubview(type: UITextField.self, resursion: true) as? UITextField) else { return }
//            textField.attributedPlaceholder = NSAttributedString(string: newValue, attributes: dic);
//
//        }
//    }
    
}

import AVFoundation
extension AVAudioSession{
    
    static func appAVAudioVolume(_ soundoff: Bool) {
        if #available(iOS 10.0, *) {
            let category: AVAudioSession.Category = soundoff == true ? AVAudioSession.Category.record : AVAudioSession.Category.ambient;
            do {
                try AVAudioSession.sharedInstance().setCategory(category, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch {
                print(error)
            }
        }
    }
    
}

