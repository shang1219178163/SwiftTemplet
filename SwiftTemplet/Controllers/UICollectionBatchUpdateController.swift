//
//  CollectionViewController.swift
//  NNCollectionViewFlowLayout
//
//  Created by Bin Shang on 2020/1/19.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

import SwiftExpand

private let reuseIdentifier = "UICollectionViewCell"

class UICollectionBatchUpdateController: UIViewController {
    
    var count = 0;

    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SectionBackground"
        
//        setupExtendedLayout()
        
        setupUI()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        ctView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - funtions
    func setupUI() {
        let updateItem = UIBarButtonItem(title: "更新", style: .plain, target: self, action: #selector(actionRefresh(_:)))
        let insertItem = UIBarButtonItem(title: "插入", style: .plain, target: self, action: #selector(actionInsert(_:)))
        navigationItem.rightBarButtonItems = [updateItem, insertItem]
        
        let flowLayout = NNCollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 85, height: 85)
        flowLayout.scrollDirection = .vertical
        
        ctView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        ctView.register(cellType: UICollectionViewCell.self)
        ctView.delegate   = self
        ctView.dataSource = self
        ctView.backgroundColor = UIColor.white
        ctView.alwaysBounceVertical = true
        
        view.addSubview(ctView)
    }

    
    @objc func actionRefresh(_ sender: UIBarButtonItem) {
        ctView.performBatchUpdates({

            count = Int(arc4random()%13);
            ctView.reloadSections(NSIndexSet(index: 1) as IndexSet)
        }, completion: nil)
    }
    
    @objc func actionInsert(_ sender: UIBarButtonItem) {
        ctView.performBatchUpdates({
            let indexs = [IndexPath(item: count, section: 1), IndexPath(item: count + 1, section: 1), ];
            count += 2
            
            ctView.insertItems(at: indexs)
        }, completion: nil)
    }

}

extension UICollectionBatchUpdateController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 7
        } else if section == 1 {
            return count
        } else if section == 2 {
            return 11
        }
        return 19
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        cell.backgroundColor = UIColor.groupTableViewBackground
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DDLog("\(indexPath.section)_\(indexPath.row)")
    }
}

extension UICollectionBatchUpdateController: NNCollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let numberOfItems = collectionView.numberOfItems(inSection: section)
        return numberOfItems > 0 ? UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) : UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, backgroundColorForSectionAt section: Int) -> UIColor {
        if section == 0 {
            return UIColor.red
        } else if section == 1 {
            return UIColor.green
        } else if section == 2 {
            return UIColor.cyan
        }
        return UIColor.blue
    }
}
