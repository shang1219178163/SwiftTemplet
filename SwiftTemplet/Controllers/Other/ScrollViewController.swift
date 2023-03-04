//
//  ScrollViewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/8/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit
import SwiftExpand

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        NNSegmentView.appearance().selectedColor = UIColor.red
        NNSegmentView.appearance().selectedColor = UIColor.hexValue(0x29B5FE)

        view.addSubview(scrollView)
        view.addSubview(scrollViewOne)

        //        self.scrollView.collectionView.reloadData();
        view.getViewLayer()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = CGRect(0, 20, kScreenWidth, 40);
        scrollViewOne.frame = CGRect(20, 80, 100, kScreenWidth);
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.scrollView.list = ["11", "22", "33", "44", "55", "66",];
//        self.scrollView.showItemNum = 2.5;
    }
    
    // MARK: -lazy
    lazy var scrollView: NNSegmentView = {
        let view = NNSegmentView(frame: .zero)
        view.list = ["1", "2", "3", "4", "5", "6",];
        view.showItemNum = 4.5;

        view.collectionView.register(cellType: UICTViewCellOne.self)
//        view.collectionView.register(UICTViewCellOne.self, forCellWithReuseIdentifier: "UICTViewCellOne")
        view.blockCellForItem({ (collectionView, indexPath) -> UICollectionViewCell? in
//            let cell: UICTViewCellOne = UICTViewCellOne.dequeueReusableCell(collectionView, indexPath: indexPath) as! UICTViewCellOne
            let cell: UICTViewCellOne = collectionView.dequeueReusableCell(for: UICTViewCellOne.self, indexPath: indexPath)
            cell.lab.text = "标题\(indexPath.row)"
            cell.lab.text = "\(view.list[indexPath.row])"

            cell.lab.textColor = view.selectIndexPath == indexPath ? view.selectedColor : view.normalColor;
//            cell.contentView.backgroundColor = UIColor.random;
            cell.imgView.isHidden = true;
            cell.getViewLayer()
            return cell;
        });
        
        view.blockDidSelectItem({ (collectionView, indexPath) in
            DDLog(indexPath);
            collectionView.reloadData();

        })
        
        return view;
    }()
    
    
    // MARK: -lazy
    lazy var scrollViewOne: NNSegmentView = {
        let view = NNSegmentView(frame: .zero)
        view.list = ["1", "2", "3", "4", "5", "6",];
        view.layout.scrollDirection = .vertical
        view.collectionView.register(UICTViewCellOne.self, forCellWithReuseIdentifier: "UICTViewCellOne")
        
        view.blockCellForItem({ (collectionView, indexPath) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(for: UICTViewCellOne.self, indexPath: indexPath)

            cell.lab.text = "标题\(indexPath.row)"
            
            cell.lab.textColor = view.selectIndexPath == indexPath ? view.selectedColor : view.normalColor;
//            cell.contentView.backgroundColor = UIColor.random;
            cell.imgView.isHidden = true;
            return cell;
        });
        
        view.blockDidSelectItem({ (collectionView: UICollectionView, indexPath) in
            DDLog(indexPath);
            collectionView.reloadData();

        })
        
        return view;
    }()
}


extension UICollectionView{
    
//    /// 泛型复用register cell - Type: "类名.self" (备用默认值 T.self)
//    final func register<T: UICollectionViewCell>(cellType: T.Type, forCellWithReuseIdentifier identifier: String = String(describing: T.self)){
//        self.register(cellType.self, forCellWithReuseIdentifier: identifier)
//    }
//
//    /// 泛型复用register supplementaryView - Type: "类名.self" (备用默认值 T.self)
//    final func register<T: UICollectionReusableView>(supplementaryViewType: T.Type, ofKind elementKind: String = UICollectionView.elementKindSectionHeader){
//        guard elementKind.contains("KindSection") else {
//            return;
//        }
//        let kindSuf = elementKind.components(separatedBy: "KindSection").last;
//        let identifier = String(describing: T.self) + kindSuf!;
//        self.register(supplementaryViewType.self, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: identifier)
//    }
}
