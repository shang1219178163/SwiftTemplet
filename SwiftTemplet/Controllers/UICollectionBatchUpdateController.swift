//
//  CollectionViewController.swift
//  NNCollectionViewFlowLayout
//
//  Created by L on 16/8/18.
//  Copyright © 2016年 c0ming. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class UICollectionBatchUpdateController: UICollectionViewController, NNCollectionViewDelegateFlowLayout {
    
    var count = 0;
    
    @objc func actionRefresh(_ sender: UIBarButtonItem) {
        collectionView?.performBatchUpdates({

        count = Int(arc4random()%13);
        collectionView?.reloadSections(NSIndexSet(index: 1) as IndexSet)
        }, completion: nil)
    }
    
    @objc func actionInsert(_ sender: UIBarButtonItem) {
        collectionView?.performBatchUpdates({
            let indexs = [IndexPath(item: count, section: 1), IndexPath(item: count + 1, section: 1), ];
            count += 2
            
            collectionView?.insertItems(at: indexs)
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SectionBackground"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "更新", style: .plain, target: self, action: #selector(actionRefresh))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "插入", style: .plain, target: self, action: #selector(actionInsert))

        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 7
        } else if section == 1 {
            return count
        } else if section == 2 {
            return 11
        }
        return 19
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        cell.backgroundColor = UIColor.groupTableViewBackground
    
        return cell
    }

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
