//
//  UICollectionViewCell+Helper.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2018/12/22.
//

import Foundation

public extension UICollectionViewCell{
    
    ///获取UICollectionViewCell
    public static func dequeueCTVCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell{
        let identifier = NStringShortFromClass(classForCoder());
        let view = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return view
    }
    
    public var imgView: UIImageView {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UIImageView;
            if view == nil {
                view = UIImageView(frame: .zero);
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

    public var label: UILabel {
        get {
            var view = objc_getAssociatedObject(self, RuntimeKeyFromSelector(#function)) as? UILabel;
            if view == nil {
                view = UILabel(frame: .zero);
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
