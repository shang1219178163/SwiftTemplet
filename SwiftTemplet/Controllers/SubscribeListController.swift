//
//  SubscribeListController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/6/17.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit
import SwiftExpand

@available(iOS 13.0, *)
class SubscribeListController: UIViewController {

    var currentSnapshot: NSDiffableDataSourceSnapshot<Int, Int>! = nil
    var dataSource: UICollectionViewDiffableDataSource<Int, Int>! = nil
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: self.createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        collectionView.backgroundColor = UIColor.gray

        collectionView.register(NNCollectionViewCellList.self, forCellWithReuseIdentifier: NNCollectionViewCellList.identifier)
        collectionView.delegate = self
        return collectionView
    }()

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "微信公众号信息列表"
        
        view.addSubview(collectionView)
        configureDataSource()
    }

    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(70))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: UICollectionView.sectionKindBackgroud)
        sectionBackgroundDecoration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        section.decorationItems = [sectionBackgroundDecoration]

        let layout = UICollectionViewCompositionalLayout(section: section)
        layout.register( NNCollectionSectionBackgroundView.self, forDecorationViewOfKind: UICollectionView.sectionKindBackgroud)
        return layout
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, Int>(collectionView: collectionView) { [weak self]
                (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in

            guard let self = self, let currentSnapshot = self.currentSnapshot else { return nil }
            let sectionIdentifier = currentSnapshot.sectionIdentifiers[indexPath.section]
            let numberOfItemsInSection = currentSnapshot.numberOfItems(inSection: sectionIdentifier)
            let isLastCell = indexPath.item + 1 == numberOfItemsInSection

            // Get a cell of the desired kind.
            if let cell = collectionView.dequeueReusableCell( withReuseIdentifier: NNCollectionViewCellList.identifier, for: indexPath) as? NNCollectionViewCellList {

                // Populate the cell with our item description.
                cell.labelTitle.text = "\(indexPath.section),\(indexPath.item)"
                cell.seperatorView.isHidden = isLastCell

                // Return the cell.
                return cell
            } else {
                fatalError("Cannot create new cell")
            }
        }

        // initial data
        let itemsPerSection = 5
        let sections = Array(0..<5)
        currentSnapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        var itemOffset = 0
        sections.forEach {
            currentSnapshot.appendSections([$0])
            currentSnapshot.appendItems(Array(itemOffset..<itemOffset + itemsPerSection))
            itemOffset += itemsPerSection
        }
        dataSource.apply(currentSnapshot, animatingDifferences: false)
    }
}

@available(iOS 13.0, *)
extension SubscribeListController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print(#function, indexPath.section, indexPath.row)
    }
}
