//
//  DetailBrowseViewController.swift
//  WImagePicker
//
//  Created by 王云 on 2017/11/30.
//  Copyright © 2017年 王云. All rights reserved.
//

import UIKit
import SwiftExpand

class DetailBrowseViewController: UIViewController {
    
    fileprivate var collectionView: UICollectionView!
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "查看大图"
        setupUI()
        
    }
    
    func setupUI() {
        edgesForExtendedLayout = []
        view.backgroundColor = .white

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: kScreenWidth, height: kScreenHeight - SafeEdge.top - SafeEdge.bottom)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: CGRect(x: 0, y: SafeEdge.top, width: kScreenWidth, height: kScreenHeight - SafeEdge.top - SafeEdge.bottom), collectionViewLayout: flowLayout)
        collectionView.register(BrowseCollectionCell.self, forCellWithReuseIdentifier: "BrowseCollectionCellID")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = bgColor
        view.addSubview(collectionView)
        
        collectionView.minimumZoomScale = 1
        collectionView.maximumZoomScale = 2
    }

}

extension DetailBrowseViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrowseCollectionCellID", for: indexPath) as! BrowseCollectionCell
        if let image = image {
            cell.displayData(image: image)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        navigationController?.popViewController(animated: true)
    }
}


class BrowseCollectionCell: UICollectionViewCell {
    
    fileprivate var iconImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        iconImageView = UIImageView()
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.contentMode = .scaleAspectFit

        iconImageView.clipsToBounds = true
        contentView.addSubview(iconImageView)
        
        iconImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
                
        iconImageView.zz_addGesturePan { gesture in
            
        }
        
        iconImageView.zz_addGestureTap { gesture in
//            let point = gesture.location(in: gesture.view!.superview)
            if gesture.view!.transform.isIdentity == true {
                gesture.view!.transform = gesture.view!.transform.scaledBy(x: 2, y: 2)
//                gesture.view!.center = point
            } else {
                gesture.view!.transform = CGAffineTransform.identity
                gesture.view!.center = self.center
            }
        }
    }
    
    func displayData(image: UIImage) {
        iconImageView.image = image
    }
}


extension UIView{
    
    @discardableResult
    func zz_addGesturePinch(_ action: @escaping ((UIPinchGestureRecognizer) ->Void)) -> UIPinchGestureRecognizer {
        let obj = UIPinchGestureRecognizer(target: nil, action: nil)
        isUserInteractionEnabled = true
        isMultipleTouchEnabled = true
        addGestureRecognizer(obj)
      
        obj.addAction { (recognizer) in
            if let gesture = recognizer as? UIPinchGestureRecognizer {
                let location = recognizer.location(in: gesture.view!.superview)
                gesture.view!.center = location
                
                DDLog(gesture.view!.transform.a.toString(), gesture.scale.toString())

//                if gesture.view!.transform.a >= 2 && gesture.view!.transform.d >= 2 && gesture.scale >= 1{
//                    return
//                }
//
//                if gesture.view!.transform.a < 1 && gesture.view!.transform.d < 1 && gesture.scale < 1{
//                    gesture.view!.transform = .identity
//                    return
//                }
                gesture.view!.transform = gesture.view!.transform.scaledBy(x: gesture.scale, y: gesture.scale)
                gesture.scale = 1.0
                action(gesture)
            }
        }
        return obj
    }
    
    @discardableResult
    func zz_addGestureTap(_ action: @escaping ((UITapGestureRecognizer) ->Void)) -> UITapGestureRecognizer {
        let obj = UITapGestureRecognizer(target: nil, action: nil)
        obj.numberOfTapsRequired = 1 //轻点次数
        obj.numberOfTouchesRequired = 1  //手指个数

        isUserInteractionEnabled = true
        isMultipleTouchEnabled = true
        addGestureRecognizer(obj)

        obj.addAction(action)
        return obj
    }
    
    @discardableResult
    func zz_addGesturePan(_ action: @escaping ((UIPanGestureRecognizer) ->Void)) -> UIPanGestureRecognizer {
        let obj = UIPanGestureRecognizer(target: nil, action: nil)
          //最大最小的手势触摸次数
        obj.minimumNumberOfTouches = 1
        obj.maximumNumberOfTouches = 3
          
        isUserInteractionEnabled = true
        isMultipleTouchEnabled = true
        addGestureRecognizer(obj)
          
        obj.addAction { (recognizer) in
            if let gesture = recognizer as? UIPanGestureRecognizer {
                let translate: CGPoint = gesture.translation(in: gesture.view?.superview)
                DDLog(gesture.view!.frame.origin.toString(), translate.toString())

                if gesture.view!.frame.origin.y >= 0 && translate.y > 0
                    || gesture.view!.frame.maxY <= UIScreen.main.bounds.size.height && translate.y < 0 {
                    return
                }
                
                if gesture.view!.frame.origin.x >= 0 && translate.x > 0
                    || gesture.view!.frame.maxX <= UIScreen.main.bounds.size.width && translate.x < 0 {
                    return
                }
                
                gesture.view!.center = CGPoint(x: gesture.view!.center.x + translate.x, y: gesture.view!.center.y + translate.y)
                gesture.setTranslation( .zero, in: gesture.view!.superview)
//                DDLog(gesture.view!.center, gesture.view!.bounds.size)
                action(gesture)
            }
        }
        return obj
    }
}
