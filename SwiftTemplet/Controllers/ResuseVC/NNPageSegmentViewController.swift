//
//	NNPageSegmentViewController.swift
//	MacTemplet
//
//	Created by shang on 2020/10/27 18:05
//	Copyright © 2020 shang. All rights reserved.
//


import UIKit
        
@objc protocol NNPageSegmentViewControllerDelegate : NSObjectProtocol {

    @objc optional func pageSegment(_ controller: NNPageSegmentViewController, shouldSelect idx: Int) -> Bool

    @objc optional func pageSegment(_ controller: NNPageSegmentViewController, didSelect idx: Int)
    
}

///滑动分段菜单选择
class NNPageSegmentViewController: NNCycleViewController {
    
    weak var delegate: NNPageSegmentViewControllerDelegate?
    
    enum LocationStyle: Int {
        case top, bottom
    }

    var locationStyle: LocationStyle = .top{
        willSet {
            switch newValue {
            case .top:
                segmentView.indicatorType = .bottomLine
            default:
                segmentView.indicatorType = .topLine
            }
            
            view.setNeedsLayout()
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
        view.backgroundColor = .white
        view.addSubview(segmentView)

        scrollViewPageIdxBlock = { idx in
            let indexP = IndexPath(row: idx, section: 0)
            self.segmentView.selectIndexPath = indexP
        }
        
        viewControllers = [FirstViewController(), TitleViewController(), FourthViewController(), TestViewController(), ThirdViewController()]
        segmentView.list = ["First", "TitleView", "TestView", "Fourth", "Third"]
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
                
        let height = segmentViewHeight
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
            
        default:
            collectionView.snp.remakeConstraints { (make) in
                make.top.equalToSuperview().offset(0);
                make.left.equalToSuperview().offset(0);
                make.right.equalToSuperview().offset(0);
                make.bottom.equalToSuperview().offset(height);
            }
            
            segmentView.snp.remakeConstraints { (make) in
                make.bottom.equalToSuperview().offset(0);
                make.left.equalToSuperview().offset(0);
                make.right.equalToSuperview().offset(0);
                make.height.equalTo(height);
            }
             break
        }
        layout.itemSize = CGSize(width: view.bounds.width, height: view.bounds.height - height)
        collectionView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        locationStyle = .bottom
    }


}
