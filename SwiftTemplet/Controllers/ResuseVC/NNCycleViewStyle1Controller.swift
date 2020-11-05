//
//  NNCycleViewStyle1Controller.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/10/24.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


@objc protocol NNCycleViewStyle1Delegate : NSObjectProtocol {

    @objc optional func cycleController(_ controller: NNCycleViewStyle1Controller, shouldSelect idx: Int) -> Bool

    @objc optional func cycleController(_ controller: NNCycleViewStyle1Controller, didSelect idx: Int)
    
}

class NNCycleViewStyle1Controller: NNCycleViewController {
    
    weak var delegate: NNCycleViewStyle1Delegate?
    
    enum LocationStyle: Int {
        case top, bottom, titleView
    }

    var locationStyle: LocationStyle = .top{
        willSet {
            switch newValue {
            case .top:
                segmentView.indicatorType = .bottomLine
                navigationItem.titleView = nil
                
            case .titleView:
                segmentView.indicatorType = .none
                
                segmentView.frame = CGRect(x: 0, y: 0, width: UIScreen.sizeWidth, height: 40)
                navigationItem.titleView = segmentView
                
            default:
                segmentView.indicatorType = .topLine
                navigationItem.titleView = nil
            }
            self.view.setNeedsLayout()
        }
    }
    var segmentViewHeight: CGFloat = 50{
        willSet{
            view.setNeedsLayout()
        }
    }

    // MARK: -lazy
    lazy var segmentView: NNSegmentView = {
        let view = NNSegmentView(frame: .zero)
        view.list = ["0", "1", "2", "3", "4", ];
        view.showItemNum = 4.5;
        
        view.collectionView.register(cellType: UICTViewCellOne.self)
        view.blockCellForItem({ (collectionView, indexPath) -> UICollectionViewCell? in
            let cell: UICTViewCellOne = collectionView.dequeueReusableCell(for: UICTViewCellOne.self, indexPath: indexPath)
            cell.lab.text = "标题\(indexPath.row)"
            if view.list.count > indexPath.row {
                cell.lab.text = view.list[indexPath.row]
            }
            
            cell.lab.textColor = view.selectIndexPath == indexPath ? view.selectedColor : view.normalColor;
//            cell.contentView.backgroundColor = UIColor.random;
            cell.imgView.isHidden = true;
            return cell;
        });
        
        view.blockDidSelectItem({ (collectionView, indexPath) in
            collectionView.reloadData();
                        
            let chooseVC = self.viewControllers[indexPath.row];
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        })
        return view;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemGreen
        view.addSubview(segmentView)
        
        scrollViewPageIdxBlock = { idx in
            let indexP = IndexPath(row: idx, section: 0)
            self.segmentView.selectIndexPath = indexP
        }
        
        viewControllers = [FirstViewController(), TitleViewController(), TestViewController(), FourthViewController(), ThirdViewController()]
        segmentView.list = ["First", "TitleView", "TestView", "Fourth", "Third"]
//        segmentView.list = viewControllers.map({ return $0.title ?? "-" })
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
                
        var height = segmentViewHeight
        
        switch locationStyle {
        case .top:
            segmentView.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(0);
                make.left.equalToSuperview().offset(0);
                make.right.equalToSuperview().offset(0);
                make.height.equalTo(height);
            }
            
            collectionView.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(height);
                make.left.equalToSuperview().offset(0);
                make.right.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(0);
            }
            
        case .titleView:
            collectionView.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(0);
                make.left.equalToSuperview().offset(0);
                make.right.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(0);
            }
            height = 0

        default:
            segmentView.snp.remakeConstraints { (make) in
                make.bottom.equalToSuperview().offset(0);
                make.left.equalToSuperview().offset(0);
                make.right.equalToSuperview().offset(0);
                make.height.equalTo(height);
            }
            
            collectionView.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(0);
                make.left.equalToSuperview().offset(0);
                make.right.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(height);
            }
            break
        }
        layout.itemSize = CGSize(width: view.bounds.width, height: view.bounds.height - height)
        collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        locationStyle = .titleView
        locationStyle = .bottom
    }


}
