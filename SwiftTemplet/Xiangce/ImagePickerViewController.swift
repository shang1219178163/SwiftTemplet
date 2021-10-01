//
//  ImagePickerViewController.swift
//  WImagePicker
//
//  Created by 王云 on 2017/11/14.
//  Copyright © 2017年 王云. All rights reserved.
//

import UIKit
import Photos
import SwiftExpand

typealias OnCommpletedHandler = ([UIImage]?) -> Void

let bgColor = UIColor.black.withAlphaComponent(0.7)
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height
let IPhoneX = UIScreen.main.bounds.size == CGSize(width: 375, height: 812)
//let SafeEdge = UIEdgeInsets(top: IPhoneX ? 88 : 64, left: 0, bottom: IPhoneX ? 34 : 0, right: 0)
let SafeEdge = UIEdgeInsets(top: 0, left: 0, bottom: IPhoneX ? 34 : 0, right: 0)

//class ImagePickerViewController: UIViewController {
class ImagePickerViewController: NNSheetViewBaseController {

    var collectionView: UICollectionView!
    var bottomView: AlbumBottomView!
    var bottomViewHeight: CGFloat = 60

    var albumList: [AlbumItem] = []
    
    var albumItem: AlbumItem!
    var itemWidth: CGFloat!
    let column: CGFloat = 4
    let margin = 5 * k_FitWidth
    
    typealias CancelBtnDidClick = () -> Void
    var cancelClick: CancelBtnDidClick?
    
    var completed: OnCommpletedHandler?
    
    let maxCheckCount: Int = 3
    var checkedAssets = [PHAsset]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupCollectionView()
        
        sheetView.delegate = self
        sheetView.btn.setTitle(albumItem.title, for: .normal)
    }
    
    func setupNav() {
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        self.navigationItem.title = albumItem.title
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancel))
    }
    
    @objc func cancel() {
        self.cancelClick?()
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        itemWidth = (kScreenWidth - (column + 1) * margin) / column
        flowLayout.minimumInteritemSpacing = margin
        flowLayout.minimumLineSpacing = margin
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.register(AlbumItemCell.self, forCellWithReuseIdentifier: "PickerCellID")
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor.white
        
        bottomView = AlbumBottomView()
        bottomView.insertVisualEffectView()
        bottomView.doneBtnClick = {[weak self] in
            self?.done()
        }
        
        bottomView.originBtnClick = {

        }
        view.addSubview(bottomView)
                
        bottomView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-SafeEdge.bottom)
            make.height.equalTo(bottomViewHeight)
        }
                
        collectionView.snp.makeConstraints { (make) in
            make.left.right.equalTo(view)
            make.top.equalToSuperview().offset(SafeEdge.top)
            make.bottom.equalTo(bottomView.snp.top).offset(0)
        }
    }
    
    func done() {
        cancel()
        var imagesArr = [UIImage]()
        for asset in self.checkedAssets {
            ImagePickerManager.getImageFromAsset(asset: asset, finished: { (image) in
                if let image = image {
                    imagesArr.append(image)
                }
            })
        }
        completed?(imagesArr)
    }
    
    func addAssets(asset: PHAsset, sender: UIButton) {
        if self.checkedAssets.contains(asset) == false {
            if self.checkedAssets.count >= maxCheckCount {
//                collectionView.reloadData()
                showAlert(maxCheckCount)
                return
            }
            self.checkedAssets.append(asset)
            sender.isSelected = !sender.isSelected
        }
        bottomView.doneBtn.isEnabled = self.checkedAssets.count > 0
    }
    
    func deleteAssets(asset: PHAsset, sender: UIButton) {
        if self.checkedAssets.contains(asset) == true {
            guard let index = self.checkedAssets.firstIndex(of: asset) else {
                return}
            self.checkedAssets.remove(at: index)
            sender.isSelected = !sender.isSelected
        }
        bottomView.doneBtn.isEnabled = self.checkedAssets.count > 0
    }

    
    func showAlert(_ maxCount: Int) {
        let alert = UIAlertController(title: "提醒", message: "最多可以选择\(maxCount)张图片", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "确定", style: .default, handler: nil)
        alert.addAction(confirm)
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
}

extension ImagePickerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albumItem.fetchResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PickerCellID", for: indexPath) as! AlbumItemCell
        let asset = self.albumItem.fetchResult[indexPath.row]
        cell.displayData(asset: asset)
        cell.checkClick = {[weak self] sender in
            guard let self = self else {
                return }
            if sender.isSelected == false {
                self.addAssets(asset: asset, sender: sender)
            } else {
                self.deleteAssets(asset: asset, sender: sender)
            }
            
            if self.checkedAssets.count <= self.maxCheckCount {
                cell.iconView.alpha = sender.isSelected ? 0.5 : 1
            } else {
                cell.iconView.alpha = self.checkedAssets.contains(asset) ? 0.5 : 0.3
            }
        }
        cell.checkBtn.isSelected = self.checkedAssets.contains(asset)
        cell.iconView.alpha = cell.checkBtn.isSelected ? 0.5 : 1
        
        cell.getViewLayer()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let asset = self.albumItem.fetchResult[indexPath.row]
        let browseVC = DetailBrowseViewController()
                
//        asset.mediaType
        //获取原图
        let options = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat
        options.isNetworkAccessAllowed = true
        PHImageManager.default().requestImage(for: asset, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFit, options: options) { (image, dic) in
            if let image = image {
                browseVC.image = image
                if let last = self.navigationController?.topViewController, last.isEqual(browseVC) {
                    return
                }
                self.navigationController?.pushViewController(browseVC, animated: true)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return margin
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return margin
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }
    
}

extension ImagePickerViewController: NNSheetViewDelegate {

    func sheetView(_ sheetView: NNSheetView, tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func sheetView(_ sheetView: NNSheetView, tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: AlbumListCell.self)
        cell.displayData(albumList[indexPath.row])
//        cell.getViewLayer()
        return cell
    }

    func sheetView(_ sheetView: NNSheetView, tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        albumItem = albumList[indexPath.row]

        collectionView.reloadData()
        guard let cell = tableView.cellForRow(at: indexPath) as? AlbumListCell,
            let value = cell.titleLabel.text as String? else {
                return
        }
        sheetView.btn.setTitle(value, for: .normal)
    }
    
}


class AlbumItemCell: UICollectionViewCell {
    var iconView: UIImageView!
    var imageManager = PHCachingImageManager()
    var asset: PHAsset!
    private(set) var checkBtn: UIButton!
    
    typealias CheckBtnDidClick = (_ btn: UIButton) -> Void
    var checkClick: CheckBtnDidClick?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        iconView = UIImageView()
        iconView.contentMode = .scaleAspectFill
        iconView.clipsToBounds = true
        contentView.addSubview(iconView)
        
        checkBtn = UIButton()
        checkBtn.setImage(UIImage.check, for: .normal)
        checkBtn.setImage(UIImage.checked, for: .selected)
        checkBtn.addTarget(self, action: #selector(check(btn:)), for: .touchUpInside)
        addSubview(checkBtn)
        
        iconView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        checkBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.top.equalToSuperview()
            make.right.equalToSuperview()
        }
        
    }
    
    @objc func check(btn: UIButton) {
        checkClick?(btn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    func displayData(asset: PHAsset, isOrigin: Bool = false) {
//        if isOrigin == false {
//            imageManager.requestImage(for: asset, targetSize: self.frame.size, contentMode: .aspectFill, options: nil) { (image, info) in
//                self.iconView.image = image
//            }
//            return
//        }
//        let options = PHImageRequestOptions()
//        options.deliveryMode = .highQualityFormat
//        options.isNetworkAccessAllowed = true
//
//        imageManager.requestImage(for: asset, targetSize: self.frame.size, contentMode: .aspectFill, options: options) { (image, dic) in
//            self.iconView.image = image
//        }
//    }
    
    func displayData(asset: PHAsset) {
        imageManager.requestImage(for: asset, targetSize: self.frame.size, contentMode: .aspectFill, options: nil) { [weak self](image, info) in
            if let image = image {
                self?.iconView.image = image
            }
        }
    }
}



class AlbumBottomView: UIView {
    typealias SimpleCallBack = () -> Void
    var doneBtnClick: SimpleCallBack?
    var originBtnClick: SimpleCallBack?

    
    lazy var doneBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("完成", for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        view.setTitleColor(.lightGray, for: .disabled)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = UIColor.green.withAlphaComponent(0.5)
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.isEnabled = false
        view.addTarget(self, action: #selector(done), for: .touchUpInside)

        return view
    }()
    
    lazy var originBtn: UIButton = {
        let view = UIButton(type: .custom)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        view.setTitle("原图", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.setImage(UIImage.check, for: .normal)
        view.setImage(UIImage.checked, for: .selected)
        view.addTarget(self, action: #selector(handleOriginAction(_:)), for: .touchUpInside)

        return view;
    }()
    
    // MARK: -lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = bgColor
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(originBtn)
        addSubview(doneBtn)
        
        doneBtn.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(30)
            make.right.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
        }
        
        originBtn.snp.makeConstraints { (make) in
            make.width.equalTo(70)
            make.height.equalTo(30)
            make.center.equalToSuperview()
        }
    }
    
    @objc func done() {
        self.doneBtnClick?()
    }
    
    @objc func handleOriginAction(_ sender: UIButton) {
        sender.isSelected.toggle()
        self.originBtnClick?()
    }
}



extension UINavigationController{
    
    func isContainTopVc(_ vc: UIViewController) -> Bool {
        guard let topViewController = topViewController else {
            return false }
        return topViewController.isEqual(vc)
    }
}
