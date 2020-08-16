//
//  UICollectionTagsController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/8/16.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand


class UICollectionTagsController: UIViewController {
    
    let kItemPadding = 15
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = NNCollectionViewTagsFlowLayout()
        layout.minimumLineSpacing = 6.0
        layout.minimumInteritemSpacing = 6.0
        layout.delegate = self

        return layout;
    }()
    
    lazy var ctView: UICollectionView = {
        let view = UICollectionView.create(self.view.bounds, layout: self.flowLayout)
        view.backgroundColor = .white

        view.delegate = self
        view.dataSource = self
        view.register(cellType: UICTViewCellOne.self)
        return view
    }()
    
    let list = ["None", "Glazed", "Sugar", "Powdered Sugar", "Chocolate with Sprinkles", "Chocolate", "Maple", "Regular", "Chocolate", "Blueberry", "Devil's Food", "None", "Glazed", "Sugar", "Powdered Sugar", "Chocolate with Sprinkles", "Chocolate", "Maple", "None", "Glazed", "Sugar", "Powdered Sugar", "Chocolate with Sprinkles", "Chocolate", "Maple", "Regular", "Chocolate", "Blueberry", "Devil's Food", "None", "Glazed", "Sugar", "Powdered Sugar", "Chocolate with Sprinkles", "Chocolate", "Maple", ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //...

        edgesForExtendedLayout = []
        view.addSubview(ctView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }



}


extension UICollectionTagsController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: UICTViewCellOne.self, indexPath: indexPath)
        cell.imgView.isHidden = true
        
        cell.lab.text = list[indexPath.row]
        
        cell.getViewLayer()
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(for: UICTViewCellOne.self, indexPath: indexPath)
        print(#function, indexPath.row, cell.lab.text)
        
    }
}

extension UICollectionTagsController : NNCollectionViewTagsFlowLayoutDelegate{
    func collectionView(_ collectionView:UICollectionView, itemSizeAt indexPath:NSIndexPath) -> CGSize
    {
        let title = list[indexPath.row]
        var size = title.size(withAttributes: [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 15)!])
        size.width = CGFloat(ceilf(Float(size.width + CGFloat(kItemPadding * 2))))
        size.height = 24
        
        //...Checking if item width is greater than collection view width then set item width == collection view width.
        if size.width > collectionView.frame.size.width {
            size.width = collectionView.frame.size.width
        }
        return size;
    }
}
