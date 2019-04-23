//
//  UICollectionViewCell+Helper.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2018/12/22.
//

import UIKit

extension UICollectionViewCell{
    
    ///获取UICollectionViewCell
    @objc public static func dequeueCTVCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell{
        let identifier = NStringShortFromClass(classForCoder());
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return view
    }
    
    @objc public var imgView: UIImageView {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UIImageView;
            if obj == nil {
                obj = UIImageView(frame: .zero);
                obj!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)

                obj!.contentMode = .scaleAspectFit;
                obj!.isUserInteractionEnabled = true;
                obj!.image = UIImage(named: kIMG_arrowRight);

                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }

    @objc public var label: UILabel {
        get {
            var obj = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UILabel;
            if obj == nil {
                obj = UILabel(frame: .zero);
                obj!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)

                obj!.numberOfLines = 0;
                obj!.lineBreakMode = .byCharWrapping;
                obj!.textAlignment = .center;
                obj!.backgroundColor = UIColor.random

                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), obj, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

            }
            return obj!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
}
