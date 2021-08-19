//
//  IOPImageUploadController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/2/14.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit
import Alamofire

@objc enum ImageOCRType: Int {
    case none, iDCard, license
}

@objc protocol IOPUploadImageControllerDelegate{
    @objc func uploadImage(_ vc: IOPImageUploadController, url: String, forKey key: String)
}


class IOPImageUploadController: UIViewController {
    
    weak var delegate: IOPUploadImageControllerDelegate?
    var block: ((IOPImageUploadController)->Void)?
    ///证件类型会有好多种,每种返回的数据模型都有差异
    var ocrblock: ((NSObject)->Void)?
    
    
    var key: String = ""
    
    lazy var uploadApi = NSObject()

    let items: [String] = ["从相册选择", "拍照", "取消"]
    
    lazy var pickerVC: UIImagePickerController = {
        let vc = UIImagePickerController()
        vc.edgesForExtendedLayout = []
        vc.view.backgroundColor = UIColor.white
        vc.delegate = self
        vc.allowsEditing = true
        vc.modalPresentationStyle = .fullScreen
        return vc
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
        guard let tableView = view.findSubView(UITableView.self) as? UITableView else {
            let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 216)
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

    // MARK: -证件识别
    var ocrType: ImageOCRType = .none{
        willSet{
            if newValue == .license {
                pickerVC.allowsEditing = false
            }
        }
    }
    
    var ocrManager = NNTencentOCRManager()

    // MARK: -lifecycle
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
        UIAlertController.createSheet("请选择", message: nil, items:items, handler: { (alertVC, action) in
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
//
//            guard let url = dic["url"] as? String else {
//                print(#function, "接口返回错误")
//                return
//            }
//            self.delegate?.uploadImage(self)
//
//        }) { (manager, errorModel) in
//            NNProgressHUD.showError(errorModel.message)
//        }
        
        
        let url = "http://api-iop.dev.irainone.com/iop/ipk/img_upload"
        let token = "867fcfbfbb73682e6c461000b8b4b800"
        let data = UIImage.compressData(image, limit: 1024*1024)

        let parameters: [String: Any] = ["token": token,
                                         "file" : data
        ]

        NNProgressHUD.showLoading("上传中...")
        AF.upload(multipartFormData: { (multipartFormData) in

            parameters.forEach { (key, obj) in
                if let value = obj as? String {
                    guard let data = value.data(using: .utf8) else { return }
                    multipartFormData.append(data, withName: key)
                    
                } else if let value = obj as? Data {
                    let fileName = DateFormatter.stringFromDate(Date(), fmt: "yyyyMMddHHmmss")
                    let imageType = UIImage.contentType(value as NSData)
                    let mimeType = "image/\(imageType)"
                    print("\(#function)_\(key)_\(value.fileSize)_\(fileName)_\(mimeType)_")
                    
                    multipartFormData.append(value, withName: key, fileName: fileName, mimeType: mimeType)
                    
                } else if let value = obj as? URL {
                    multipartFormData.append(value, withName: key)
                    
                }
            }

        }, to: url)
        .uploadProgress(closure: { (progress) in
//            print("\(#function), 上传进度_\(progress.fractionCompleted)")
        })
        .response { (response) in
//            NNProgressHUD.dismiss()
            
            switch response.result {
            case .success:
//                print(#function, "Validation Successful")
                guard let jsonData = response.data,
                      let dic = jsonData.objValue as? [String: Any]
                      else {
                    print(#function, "接口返回错误")
                    return
                }
                
                guard let code = dic["code"] as? String,
                      let message = dic["message"] as? String,
                      let url = dic["url"] as? String
                      else {
                    print(#function, "接口返回错误\(dic.jsonString)")
                    return
                }
                
                if code != "200" {
                    NNProgressHUD.showError(message)
                    return
                }
                NNProgressHUD.showSuccess(message)
                
                self.imgUrl = url
                self.delegate?.uploadImage(self, url: url, forKey: self.key)
                self.block?(self)
                self.requestOCR(self.imgUrl)
                
            case .failure(let error):
                print(error)
                if let statusCode = response.response?.statusCode {
                    print(statusCode)
                }
                NNProgressHUD.showError("上传失败")
            }
        }
    }
    
    func requestOCR(_ imgUrl: String) {
//        switch ocrType {
//        case .iDCard:
//            ocrManager.recognizeIDCard(imgUrl) { (model) in
//                IOPProgressHUD.dismiss()
//                self.ocrblock?(model)
//                self.navigationController?.popViewController(animated: true);
//            } failBlock: { (message) in
////                IOPProgressHUD.showError(withStatus: message)
//                let tips = message + ",请手动输入"
//                IOPProgressHUD.showError(withStatus: tips)
//            }
//
//        case .license:
//            ocrManager.recognizeLicense(imgUrl) { (model) in
//                IOPProgressHUD.dismiss()
//                self.ocrblock?(model)
//                self.navigationController?.popViewController(animated: true);
//            } failBlock: { (message) in
//                let tips = message + ",请手动输入"
//                IOPProgressHUD.showError(withStatus: tips)
//            }
//
//        case .none:
//            break
//        default:
//            break
//        }
    }
}

//3.分别对确定和取消事件做处理
extension IOPImageUploadController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        print(info)
        dismiss(animated: true, completion: nil)
        
        var image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        if picker.allowsEditing == true {
            guard let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
                return
            }
            image = editedImage
        }
        
        // 拍照
        if picker.sourceType == .camera {
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
    
        cell.imgViewLeft.addGestureTap({ (reco) in
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
