//
//  UICollectionReusableView+Helper.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2018/12/22.
//


/*
 UICollectionViewCell继承于UICollectionReusableView,所以两者属性,方法不能同名
 */


import Foundation

public extension UICollectionReusableView{
 
    public static var identifier: String {
        get {
            var str = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? String;
            if str == nil {
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), str, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
            str = NStringShortFromClass(classForCoder());
            return str!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    ///获取UICollectionReusableView
    public static func dequeueCTVReusable(_ collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView{
        
        let kindSuf = kind.components(separatedBy: "KindSection").last;
        let identifier = NStringShortFromClass(classForCoder()) + kindSuf!;
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath)
        view.textLabel.text = kindSuf! + "\(indexPath.section)";
        
        view.backgroundColor = kind == UICollectionElementKindSectionHeader ? UIColor.green : UIColor.yellow;
        return view;
    }

    public var imageView: UIImageView {
        get {
            var view = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UIImageView;
            if view == nil {
                view = UIImageView(frame: .zero);
                view!.isUserInteractionEnabled = true;
                view!.contentMode = .scaleAspectFit;
                view!.backgroundColor = UIColor.random

                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var imageViewRight: UIImageView {
        get {
            var view = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UIImageView;
            if view == nil {
                view = UIImageView(frame: .zero);
                view!.isUserInteractionEnabled = true;
                view!.contentMode = .scaleAspectFit;
                view!.image = UIImage(named: kIMG_arrowRight);
                view!.backgroundColor = UIColor.random
                
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var textLabel: UILabel {
        get {
            var view = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UILabel;
            if view == nil {
                view = UILabel(frame: .zero);
                view!.numberOfLines = 2;
                view!.lineBreakMode = .byCharWrapping;
                view!.textAlignment = .left;
                view!.backgroundColor = UIColor.random
                
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    public var textLabelRight: UILabel {
        get {
            var view = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UILabel;
            if view == nil {
                view = UILabel(frame: .zero);
                view!.numberOfLines = 1;
                view!.adjustsFontSizeToFitWidth = true
                view!.textAlignment = .center;
                view!.backgroundColor = UIColor.random
                
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                
            }
            return view!;
        }
        set {
            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
}
