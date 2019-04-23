//
//  UICollectionViewCell+Helper.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2018/12/22.
//

import Foundation

extension UICollectionViewCell{
    
    ///获取UICollectionViewCell
    @objc public static func dequeueCTVCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell{
        let identifier = NStringShortFromClass(classForCoder());
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return view
    }
    
    @objc public var imgView: UIImageView {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UIImageView;
            if view == nil {
                view = UIImageView(frame: .zero);
                view!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)

                view!.contentMode = .scaleAspectFit;
                view!.isUserInteractionEnabled = true;
                view!.image = UIImage(named: kIMG_arrowRight);

                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }

    @objc public var label: UILabel {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UILabel;
            if view == nil {
                view = UILabel(frame: .zero);
                view!.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.flexibleWidth.rawValue | UIViewAutoresizing.flexibleHeight.rawValue)

                view!.numberOfLines = 0;
                view!.lineBreakMode = .byCharWrapping;
                view!.textAlignment = .center;
                view!.backgroundColor = UIColor.random

                objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);

            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, RuntimeKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
}
