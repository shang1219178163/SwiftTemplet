//
//  UICollectionReusableView+Helper.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2018/12/22.
//

import Foundation

public extension UICollectionReusableView{
 
    public static var identifier: String {
        get {
            var str = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? String;
            if str == nil {
                str = NStringShortFromClass(classForCoder());
                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), str, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
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
//        view.textLabel.text = kindSuf! + "\(indexPath.section)";
        view.backgroundColor = kind == UICollectionElementKindSectionHeader ? UIColor.green : UIColor.yellow;
        return view;
    }
    
    
//    public var imgView: UIImageView {
//        get {
//            var imgView = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UIImageView;
//            if imgView == nil {
//                imgView = UIImageView(frame: .zero);
//                imgView!.isUserInteractionEnabled = true;
//                imgView!.contentMode = .scaleAspectFit;
//                imgView!.image = UIImage(named: kIMG_arrowRight);
//
//                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), imgView, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//
//            }
//            return imgView!;
//        }
//        set {
//            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//        }
//    }
//
//    public var textLabel: UILabel {
//        get {
//            var label = objc_getAssociatedObject(self, AssociationKeyFromSelector(#function)) as? UILabel;
//            if label == nil {
//                label = UILabel(frame: .zero);
//                label!.textAlignment = .left;
//                label!.numberOfLines = 0;
//                label!.lineBreakMode = .byCharWrapping;
//                objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), label, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//
//            }
//            return label!;
//        }
//        set {
//            objc_setAssociatedObject(self, AssociationKeyFromSelector(#function), newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//        }
//    }
}
