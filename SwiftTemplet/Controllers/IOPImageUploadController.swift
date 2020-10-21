//
//  IOPImageUploadController.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2020/2/14.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit

@objc protocol IOPUploadImageControllerDelegate{
    @objc func uploadImage(_ url: String, forKey key: String)
}


class IOPImageUploadController: UIViewController {
    
    weak var delegate: IOPUploadImageControllerDelegate?

    var key: String = ""
    
    lazy var uploadApi = NSObject()

    let items: [String] = ["从相册选择", "拍照", "取消"]
    
    lazy var pickerVC: UIImagePickerController = {
        let pickerVC = UIImagePickerController()
        pickerVC.view.backgroundColor = UIColor.white
        pickerVC.delegate = self
        pickerVC.allowsEditing = true
        return pickerVC
    }()
    
    var imageDefault: UIImage = UIImage(named: "img_upload")!
    var image: UIImage = UIImage(named: "img_upload")!{
        willSet{
            self.tableView.reloadData()
        }
    }
    
    var imgUrl: String = ""
    var isFromPickerVC: Bool = false
    var showImageDefault: Bool = false{
        willSet{
            image = imageDefault
        }
    }

    lazy var tableView: UITableView = {
        guard let tableView = view.subView(UITableView.self) as? UITableView else {
            let view = UITableView.create(self.view.bounds, style: .plain, rowHeight: 216)
            view.dataSource = self
            view.delegate = self
            return view
        }
        return tableView
    }()

    lazy var footerView: NNTableFooterView = {
        let view = NNTableFooterView.create("提交", topPadding: 30);
        view.btn.addTarget(self, action: #selector(handleActionSend(_:)), for: .touchUpInside)
        return view
    }()
    
    @objc func handleActionSend(_ sender: UIButton) {
        view.endEditing(true)
//        DDLog(sender.currentTitle)

        requestUploadImage()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.tableFooterView = footerView;
        view.addSubview(tableView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
  
    func showSheet() {
        UIAlertController.createSheet("请选择", message: nil, items:items, handler: { (action) in
            self.handleAction(action.title!)

        }).present()
    }
    
    func handleAction(_ title: String) {
        var sourceType: UIImagePickerController.SourceType = .photoLibrary
        switch title {
        case items.first:
            sourceType = .photoLibrary
            
        case items[1]:
            sourceType = .camera
            if !UIImagePickerController.isSourceTypeAvailable(.camera) {
                UIAlertController.showAlert(message: "未发现可用相机")
                return;
            }
        default:
            break
        }
        pickerVC.sourceType = sourceType
        present(pickerVC, animated: true, completion: nil)
    }
    
    func requestUploadImage() {
        if imageDefault.isEqual(image) {
            NNProgressHUD.showError("请点击上传图片")
            return;
        }

//        NNProgressHUD.show(withStatus: "上传中...")
//        let data = UIImage.compressData(image, limit: 1024*1024)
//        uploadApi.file = data
//        uploadApi.startRequest(successBlock: { (manager, dic) in
//            DDLog(dic)
//            NNProgressHUD.showSuccess(kAPISuccess)
//            self.delegate?.uploadImage(dic["url"] as! String, forKey: self.key)
//
//        }) { (manager, errorModel) in
//            NNProgressHUD.showError(errorModel.message)
//        }
    }
}

//3.分别对确定和取消事件做处理
extension IOPImageUploadController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        dismiss(animated: true, completion: nil)
        guard let image: UIImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        
        // 拍照
        if picker.sourceType == .camera {
            //保存相册
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(image:didFinishSavingWithError:contextInfo:)), nil)
        }
        self.image = image;
        isFromPickerVC = true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func image(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: AnyObject) {
        if error != nil {
            print("保存失败")

        } else {
            print("保存成功")

        }
    }
}

extension IOPImageUploadController: UITableViewDataSource, UITableViewDelegate{
    //    MARK: - tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCellPhoto.dequeueReusableCell(tableView)
    
        _ = cell.imgViewLeft.addGestureTap({ (reco) in
            self.showSheet()
        })
//        cell.imgViewLeft.image = image
        cell.imgViewLeft.contentMode = .scaleToFill
        
        let hasPicture = imgUrl.contains("http")
        if hasPicture == true {
            if isFromPickerVC == false {
                if let imageURL = URL(string: imgUrl) {
                    cell.imgViewLeft.sd_setImage(with: imageURL, placeholderImage: UIImage(named:"img_car_default"))
                } else {
                    cell.imgViewLeft.image = image
                }
            } else {
                cell.imgViewLeft.image = image
            }

        } else {
            cell.imgViewLeft.image = image
        }

//        cell.getViewLayer()
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.01;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UILabel();
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UILabel();
    }
}
