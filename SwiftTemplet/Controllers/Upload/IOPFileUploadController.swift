//
//  IOPFileUploadController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/3/2.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

//guard let resources = try? url.resourceValues(forKeys:[.fileSizeKey]),
//      let fileSize = resources[.fileSizeKey] as? NSNumber
//      else {
//    IOPProgressHUD.showError(withStatus: "数据异常")
//    return }
//let sizeInMB: Double = fileSize.doubleValue/(1024*1024)
//if sizeInMB > fileMaxSize {
//    IOPProgressHUD.dismiss()
//
//    let message = "文件最大不能超过\(fileMaxSize)M"
//    UIAlertController(title: nil, message: message, preferredStyle: .alert)
//        .addActionTitles([kTitleKnow], handler: nil)
//        .present()
////            IOPProgressHUD.showError(withStatus: "\(fileMaxSize)")
//    return
//}



import UIKit
import QuickLook
import Photos

import AFNetworking
import SwiftExpand

@objc protocol IOPFileUploadControllerDelegate{
    @objc optional func fileUpload(_ vc: IOPFileUploadController, url: String)
    @objc optional func fileShare(_ vc: IOPFileUploadController, url: String)
}

/// 文件上传,下载,分享
class IOPFileUploadController: UIViewController {
    
    weak var delegate: IOPFileUploadControllerDelegate?
    var block: ((IOPFileUploadController, String)->Void)?

    /// 文件最大尺寸(M)
    var fileMaxSize: Double = 10
    ///线上链接
    var fileUrl: NSURL?
    
    var localFileUrl: NSURL?{
        willSet{
            if newValue == nil {
                return
            }
            DispatchQueue.main.async {
                self.previewVC.reloadData()
            }
        }
    }
    
    /// true上传, false下载
    var isUpload: Bool = true

//    var isFromPickerVC: Bool = false
    var resetFileUrl: Bool = false{
        willSet{
            if newValue == false {
                return
            }
            fileUrl = nil
        }
    }
    
    var key: String = ""

    lazy var chooseItem = UIBarButtonItem(obj: "选择", style: .plain, target: self, action: #selector(handleActionFile(_:)))
    lazy var uploadItem = UIBarButtonItem(obj: "上传", style: .plain, target: self, action: #selector(handleActionFile(_:)))
    lazy var shareItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(handleActionFile(_:)))
    /// 预览视图
    lazy var previewVC: QLPreviewController = {
        let vc = QLPreviewController()
        vc.edgesForExtendedLayout = []
        vc.dataSource = self
        vc.delegate = self
        vc.currentPreviewItemIndex = 0
        
        return vc
    }()
    
    /// 文件选择器
    lazy var docPickVC: UIDocumentPickerViewController = {
        let vc = UIDocumentPickerViewController(documentTypes: IOPFileUploadController.docTypes, in: .import)
        vc.modalPresentationStyle = .fullScreen
        if #available(iOS 11.0, *) {
            vc.allowsMultipleSelection = true
        } else {
            // Fallback on earlier versions
        }
        vc.delegate = self
        return vc
    }()
    
    /// 文件分享弹窗
    lazy var docShareVC: UIDocumentInteractionController = {
        let vc = UIDocumentInteractionController()
        vc.delegate = self;
        vc.presentPreview(animated: true)
        return vc
    }()

    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        edgesForExtendedLayout = []
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.

        addChild(previewVC)
        view.addSubview(previewVC.view)
        previewVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        previewVC.view.frame = view.bounds
        previewVC.didMove(toParent: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handleFileAction()
    }
    
    // MARK: -funtions
    @objc func handleActionFile(_ item: UIBarButtonItem) {
        switch item {
        case chooseItem:
            presentDocPicker()
            
        case uploadItem:
            requestUpload()

        case shareItem:
            presentOptionsMenu()
            
        default:
            break
        }
    }
    
    func presentDocPicker() {
        present(docPickVC, animated: true) {
            if #available(iOS 11, *) {
                UIScrollView.appearance().contentInsetAdjustmentBehavior = .automatic
            }
        }
    }
    
    func presentOptionsMenu() {
        guard let url = localFileUrl as URL? else {
            NNProgressHUD.showText("文件链接不能为空")
            return
        }
        delegate?.fileShare?(self, url: url.path)

        docShareVC.url = url
        let result = docShareVC.presentOptionsMenu(from: self.view.bounds, in: self.view, animated: true)
        if result == false {
            DDLog("没有程序可以打开要分享的文件")
        }
    }

    func handleFileAction() {
        title = isUpload ? "文件上传" : "文件下载"
        navigationItem.rightBarButtonItems = isUpload ? [uploadItem, chooseItem] : [shareItem]
        if isUpload == true {
            return
        }
        
        guard let URL = fileUrl as URL?, URL.absoluteString.hasPrefix("http") else {
            NNProgressHUD.showText("文件链接无效")
            return
        }
        requestDownload(URL)
    }
    
    /// AFN上传文件
    func requestUpload() {
        if let path = fileUrl?.path {
//            let data = FileManager.default.contents(atPath: path)
//            uploadApi.file = data
            
            if path.hasSuffix(".pdf") == false {
                NNProgressHUD.showError("移动端仅支持 pdf 类型")
                return
            }
            if let data = NSData(contentsOfFile: path) {
                let fileSize = Double(data.length / 1024*1024)
                if fileSize > fileMaxSize {
                    NNProgressHUD.showError("文档不能超过\(fileMaxSize)M")
                    return
                }
            }
        }
        
        NNProgressHUD.showLoading("上传中...")
        
        let urlString = "http://116.62.132.145:8008/iop/ipk/img_upload"
        let parameters: [String: Any] = ["token": "680b2275a2318b076a6c883908bae43e",
                                         "file": localFileUrl as Any,
        ]

        let config = URLSessionConfiguration.default
        let manager = AFHTTPSessionManager(sessionConfiguration: config)
        manager.requestSerializer.setValue("multipart/form-data", forHTTPHeaderField: "Content-Type")
        manager.requestSerializer.setValue("IOP/iOS", forHTTPHeaderField: "User-Agent")
        manager.requestSerializer.setValue("3.3.1", forHTTPHeaderField: "Accept-Version")
        
        manager.post(urlString,
                     parameters: nil,
                     headers: nil,
                     constructingBodyWith: { (formData) in
            for (key, value) in parameters {
                switch value {
                case let obj as String:
                    if let data = obj.data(using: .utf8) {
                        formData.appendPart(withForm: data, name: key)
                    }
                    
                case let obj as Data:
                    formData.appendPart(withForm: obj, name: key)
                    
                case let obj as URL:
                    do{
                        try formData.appendPart(withFileURL: obj, name: key)
                    } catch {
                        DDLog("error:\(error.localizedDescription)")
                    }
                    
                default:
                    break
                }
            }
            
        }, progress: { (progress) in
            let currentValue = progress.completedUnitCount/progress.totalUnitCount
            DDLog("currentValue_\(currentValue)")
            
        }, success: { (task, responseObject) in
            NNProgressHUD.showSuccess("请求成功")
            guard let dict = responseObject as? [String: Any],
                let dic = dict["data"] as? [String: Any],
                let url = dic["url"] as? String,
                let URL = NSURL(string: url) else {
                print(#function, "接口返回数据错误")
                return
            }
            self.fileUrl = URL
            self.delegate?.fileUpload?(self, url: url)
            self.block?(self, url)
            
        }) { (task, error) in
            NNProgressHUD.showError(error.localizedDescription)
        }
    }

    /// AFN 下载文件
    func requestDownload(_ URL: URL) {
        NNProgressHUD.showLoading("载入中...")
        
        let config = URLSessionConfiguration.default
        let manager = AFHTTPSessionManager(sessionConfiguration: config)
        
        let request = URLRequest(url: URL)
        let task = manager.downloadTask(with: request, progress: { (progress) in
            let current = progress.completedUnitCount/progress.totalUnitCount
            DDLog("current:\(current)")
            
        }, destination: { (url, response) -> URL in
            let documentsDirectoryURL = try? FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let docURL: URL = (documentsDirectoryURL?.appendingPathComponent(response.suggestedFilename!))!
            return docURL
        }) { (response, url, error) in
            DDLog("File downloaded to:\(url?.path ?? "地址错误")")
            self.localFileUrl = url as NSURL?
//            self.previewVC.reloadData()
            
            if let error = error {
                NNProgressHUD.showError(error.localizedDescription)
            } else {
                NNProgressHUD.dismiss()
            }
        }
        task.resume()
    }
    
    func download(_ urlString: String) {
        let videoImageUrl = "https://lanhu-cdn.oss-cn-shenzhen.aliyuncs.com/material/video/46FDAC5BC0C5C22DC220BE82EE1ED63C.mp4"
        DispatchQueue.global(qos: .background).async {
            if let url = URL(string: urlString),
                let urlData = NSData(contentsOf: url) {
                let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
                let filePath = "\(documentsPath)/tempFile.mp4"
                DispatchQueue.main.async {
//                    urlData.write(toFile: filePath, atomically: true)
                    
                    PHPhotoLibrary.shared().performChanges({
                        PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: URL(fileURLWithPath: filePath))
                    }) { completed, error in
                        if completed {
                            print("Video is saved!")
                        }
                    }
                }
            }
        }
    }
}


extension IOPFileUploadController: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if #available(iOS 11, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        }
        guard let url = urls.first else {
            return
        }
        localFileUrl = url as NSURL
    }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        if #available(iOS 11, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        }
        localFileUrl = url as NSURL
    }
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        if #available(iOS 11, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        }
    }
}

extension IOPFileUploadController: QLPreviewControllerDataSource, QLPreviewControllerDelegate{
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        guard localFileUrl != nil else { return 0 }
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return localFileUrl!
    }
    
    func previewController(_ controller: QLPreviewController, frameFor item: QLPreviewItem, inSourceView view: AutoreleasingUnsafeMutablePointer<UIView?>) -> CGRect {
        return self.view.bounds
    }
    
    func previewControllerWillDismiss(_ controller: QLPreviewController) {
        
    }
    
}


extension IOPFileUploadController: UIDocumentInteractionControllerDelegate{
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController{
        return self
    }
    
    func documentInteractionControllerRectForPreview(_ controller: UIDocumentInteractionController) -> CGRect{
        return self.view!.frame
    }

    func documentInteractionControllerViewForPreview(_ controller: UIDocumentInteractionController) -> UIView?{
        return self.view!
    }

    
    // Preview presented/dismissed on document.  Use to set up any HI underneath.
    func documentInteractionControllerWillBeginPreview(_ controller: UIDocumentInteractionController){
        
    }

    func documentInteractionControllerDidEndPreview(_ controller: UIDocumentInteractionController){
        
    }
    
    // Options menu presented/dismissed on document.  Use to set up any HI underneath.
    func documentInteractionControllerWillPresentOptionsMenu(_ controller: UIDocumentInteractionController){
        
    }

    func documentInteractionControllerDidDismissOptionsMenu(_ controller: UIDocumentInteractionController){
        
    }

    
    // Open in menu presented/dismissed on document.  Use to set up any HI underneath.
    func documentInteractionControllerWillPresentOpenInMenu(_ controller: UIDocumentInteractionController){
        
    }

    func documentInteractionControllerDidDismissOpenInMenu(_ controller: UIDocumentInteractionController){
        
    }

    func documentInteractionController(_ controller: UIDocumentInteractionController, willBeginSendingToApplication application: String?){
        
    }

    func documentInteractionController(_ controller: UIDocumentInteractionController, didEndSendingToApplication application: String?){
        
    }
    
}

extension IOPFileUploadController{
    static let docTypes = ["com.microsoft.word.doc",
        "com.microsoft.excel.xls",
        "com.microsoft.powerpoint.ppt",
        "com.adobe.pdf",
    //    "public.item",
        "public.image",
//        "public.content",
    //    "public.composite-content",
    //    "public.archive",
        "public.audio",
        "public.movie",
        "public.text",
    //    "public.data",
        ]
//    static let docTypes = ["com.microsoft.word.doc",
//        "com.microsoft.excel.xls",
//        "com.microsoft.powerpoint.ppt",
//        "com.adobe.pdf",
//    //    "public.item",
//    //    "public.image",
////        "public.content",
//    //    "public.composite-content",
//    //    "public.archive",
//    //    "public.audio",
//    //    "public.movie",
//        "public.text",
//    //    "public.data",
//        ]
}


//class Downloader {
//    static func load(url: URL) {
//        var request = URLRequest(url:url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
//        request.httpMethod = "GET"
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard let data = data, error == nil else {
//                DDLog("error:\(error!)")
//                return
//            }
//            guard let dic = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves) else {
//                DDLog("字典不能为空")
//                return
//            }
//            
//            
//            // Success
//            let statusCode = (response as! HTTPURLResponse).statusCode
//            print("Success: \(statusCode)")
//
//            // This is your file-variable:
//            // data
//        }
//        task.resume()
//    }
//}
