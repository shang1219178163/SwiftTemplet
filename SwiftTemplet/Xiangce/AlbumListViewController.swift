//
//  AlbumListViewController.swift
//  WImagePicker
//
//  Created by 王云 on 2017/11/14.
//  Copyright © 2017年 王云. All rights reserved.
//

import UIKit
import Photos

let k_FitHeight:CGFloat = UIScreen.main.bounds.size.height / 667
let k_FitWidth:CGFloat = UIScreen.main.bounds.size.width / 375
fileprivate let AlbumListCellID = "AlbumListCellID"

class AlbumItem {
    //相册名称
    var title: String?
    
    //相册中资源
    var fetchResult: PHFetchResult<PHAsset>
    
    init(title: String?, fetchResult: PHFetchResult<PHAsset>) {
        self.fetchResult = fetchResult
        self.title = title
    }
}

class AlbumListViewController: UITableViewController {
    
    var albumList: [AlbumItem] = []
    var noAuthorizedView = NoAuthorizedView()
    
    var commpleted: OnCommpletedHandler?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        getAlbumList()
        setupTableView()

    }
    
    func setupNav() {
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        
        navigationItem.title = "照片"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancel))
        navigationController?.navigationBar.tintColor = .darkGray
    }
    
    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(AlbumListCell.self, forCellReuseIdentifier: AlbumListCellID)
        tableView.estimatedSectionFooterHeight = 0
        tableView.estimatedSectionFooterHeight = 0
    }
    
    func setupNoAuthorizedView() {
        noAuthorizedView = NoAuthorizedView()
        view.addSubview(noAuthorizedView)
        noAuthorizedView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(80)
            make.top.equalToSuperview().offset(120)
        }
    }
    
    func getAlbumList() {
        
        ImagePickerManager.shareManager.isAuthorized {[weak self](isAuthorized) in
            if isAuthorized == false {
                DispatchQueue.main.async {
                    self?.setupNoAuthorizedView()
                }
                return
            }else {
                
                //系统的智能相册
                let smartAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .albumRegular, options: nil)
                self?.convertCollection(smartAlbums as! PHFetchResult<PHCollection>)
                
                //用户创建的相册
                let userCollections = PHCollectionList.fetchTopLevelUserCollections(with: nil)
                self?.convertCollection(userCollections)
                
                //按照照片数量多少排序
                self?.albumList.sort(by: { item1, item2  in
                    item1.fetchResult.count > item2.fetchResult.count
                })
                DispatchQueue.main.async {
                    self?.pushToImagePickerVC(index: 0, animated: false)
                    self?.tableView.reloadData()
                }
            }
        }

    }
    
    
    func pushToImagePickerVC(index: Int, animated: Bool) {
        if albumList.count <= 0 {
            return
        }
        let imageVC = ImagePickerViewController()
        imageVC.albumList = albumList
        imageVC.albumItem = albumList[index]
        imageVC.completed = commpleted
        imageVC.cancelClick = {[weak self] in
            self?.navigationController?.dismiss(animated: true, completion: nil)
        }
        imageVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(imageVC, animated: animated)
    }
    
    
    func convertCollection(_ collection: PHFetchResult<PHCollection>) {
        for i in 0..<collection.count {
            let resultsOptions = PHFetchOptions()
            resultsOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate",
                                                               ascending: false)]
//            resultsOptions.predicate = NSPredicate(format: "mediaType = %d",
//                                                   PHAssetMediaType.image.rawValue)
            
            let c = collection[i]
            if let assetCollection = c as? PHAssetCollection {
                let assetsFetchResult = PHAsset.fetchAssets(in: assetCollection, options: resultsOptions)
                if let title = ImagePickerManager.albumChinseTitle(title: assetCollection.localizedTitle) {
                    albumList.append(AlbumItem(title: title, fetchResult: assetsFetchResult))
                }
            }
        }
    }
    
}

extension AlbumListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumListCellID) as! AlbumListCell
        cell.displayData(albumList[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 * k_FitHeight
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        pushToImagePickerVC(index: indexPath.row, animated: true)
    }
}


class NoAuthorizedView: UIView {
    fileprivate var titleLabel: UILabel!
    fileprivate var settingBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        isUserInteractionEnabled = true
        
        settingBtn = UIButton()
        settingBtn.setTitle("该功能需要打开访问相册权限，请点击设置开启相册权限。去设置。", for: .normal)
        settingBtn.setTitleColor(UIColor.black, for: .normal)
        settingBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        settingBtn.titleLabel?.numberOfLines = 0
        settingBtn.titleLabel?.textAlignment = .center
        settingBtn.addTarget(self, action: #selector(setting), for: .touchUpInside)
        addSubview(settingBtn)
        
        settingBtn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
    }
    
    @objc func setting() {
        let settingURL = URL(string: UIApplication.openSettingsURLString)
        
        if UIApplication.shared.canOpenURL(settingURL!) {
            UIApplication.shared.openURL(settingURL!)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

