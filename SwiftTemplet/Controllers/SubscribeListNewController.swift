//
//  SubscribeListNewController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/7/25.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SubscribeListNewController: UIViewController {
    var sections = Bundle.main.decode([SectionModel].self, from: "appstore.json")
    var collectionView: UICollectionView!

    var dataSource: UICollectionViewDiffableDataSource<SectionModel, AppModel>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sections = sections.filter({ $0.type != "mediumTable" })

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .gray
        collectionView.delegate = self
        view.addSubview(collectionView)

        collectionView.register(UICTViewCellOne.self, forCellWithReuseIdentifier: "UICTViewCellOne")
        collectionView.register(UICTViewCellSubtitle.self, forCellWithReuseIdentifier: "UICTViewCellSubtitle")
        collectionView.register(UICTReusableViewZero.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "UICTReusableViewZeroHeader")

        createDataSource()
        reloadData()
    }


    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<SectionModel, AppModel>(collectionView: collectionView) { collectionView, indexPath, app in
            switch self.sections[indexPath.section].type {
            case "smallTable":
                let cell = UICTViewCellSubtitle.dequeueReusableCell(collectionView, indexPath: indexPath)
                cell.lab.text = app.subheading
                cell.labDetail.text = app.tagline

                cell.getViewLayer()
                return cell
            default:
                let cell = UICTViewCellOne.dequeueReusableCell(collectionView, indexPath: indexPath)
                cell.imgView.image = UIImage(named: app.image)
                cell.lab.text = app.name
                cell.getViewLayer()
                return cell
            }
        }
        
        dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let self = self else { return nil }
            guard let firstApp = self.dataSource?.itemIdentifier(for: indexPath),
            let section = self.dataSource?.snapshot().sectionIdentifier(containingItem: firstApp)
            else { return nil }
            
            let cell = UICTReusableViewZero.dequeueSupplementaryView(collectionView, indexPath: indexPath)
            cell.lab.text = section.title

            cell.getViewLayer()
            return cell
        }
    }

    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<SectionModel, AppModel>()
        snapshot.appendSections(sections)

        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        dataSource?.apply(snapshot)
    }

    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let section = self.sections[sectionIndex]

            switch section.type {
            case "smallTable":
                return self.createTableSection(using: section)
            default:
                return self.createCardSection(using: section)
            }
        }

        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        layout.register(NNCollectionSectionBackgroundView.self, forDecorationViewOfKind: UICollectionView.sectionKindBackgroud)
        return layout
    }

    func createCardSection(using section: SectionModel) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .fractionalHeight(0.9))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: UICollectionView.sectionKindBackgroud)
        sectionBackgroundDecoration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        section.decorationItems = [sectionBackgroundDecoration]
        
        let layoutSectionHeader = createSectionHeader()
        section.boundarySupplementaryItems = [layoutSectionHeader]
        return section
    }
    
    func createTableSection(using section: SectionModel) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(60))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: UICollectionView.sectionKindBackgroud)
        sectionBackgroundDecoration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        section.decorationItems = [sectionBackgroundDecoration]
        return section
    }
    
    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(45))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return layoutSectionHeader
    }
}

@available(iOS 13.0, *)
extension SubscribeListNewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print(#function, indexPath.section, indexPath.row)
    }
}
