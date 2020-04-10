//
//  IOPFileUploadController.swift
//  IntelligentOfParking
//
//  Created by Bin Shang on 2020/3/2.
//  Copyright © 2020 Xi'an iRain IoT. Technology Service CO., Ltd. . All rights reserved.
//

import UIKit
import QuickLook

import AFNetworking
import SwiftExpand

@objc protocol IOPFileUploadControllerDelegate{
    @objc optional func fileUpload(_ url: String, forKey key: String)
    @objc optional func fileShare(_ url: String, forKey key: String)
}

/// 文件上传,下载,分享
class IOPFileUploadController: UIViewController {
    
    weak var delegate: IOPFileUploadControllerDelegate?

    /// 文件最大尺寸(M)
    var fileMaxSize: Double = 10
    
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

    var isFromPickerVC: Bool = false
    var resetFileUrl: Bool = false{
        willSet{
            if newValue == false {
                return
            }
            fileUrl = nil
        }
    }
    
    lazy var chooseItem = UIBarButtonItem.create("选择", style: .plain, target: self, action: #selector(handleActionFile(_:)))
    lazy var uploadItem = UIBarButtonItem.create("上传", style: .plain, target: self, action: #selector(handleActionFile(_:)))
    lazy var shareItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(handleActionFile(_:)))
    /// 预览视图
    lazy var previewVC: QLPreviewController = {
        let controller = QLPreviewController()
        controller.edgesForExtendedLayout = []
        controller.dataSource = self
        controller.delegate = self
        controller.currentPreviewItemIndex = 0
        
        return controller
    }()
    
    /// 文件选择器
    lazy var docPickVC: UIDocumentPickerViewController = {
        let controller = UIDocumentPickerViewController(documentTypes: IOPFileUploadController.docTypes, in: .import)
        controller.modalPresentationStyle = .fullScreen
        controller.delegate = self
        return controller
    }()
    
    /// 文件分享弹窗
    lazy var docShareVC: UIDocumentInteractionController = {
        let controller = UIDocumentInteractionController()
        controller.delegate = self;
        controller.presentPreview(animated: true)
        return controller
    }()

    var key: String = ""
    
    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        edgesForExtendedLayout = []
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.

        previewVC.view.frame = self.view.bounds
        self.addChild(previewVC)
        previewVC.didMove(toParent: self)
        self.view.addSubview(previewVC.view)
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
        docPickVC.setupContentInsetAdjustmentBehavior(true)
        present(docPickVC, animated: true, completion: nil)
//        let documentPickVC = UIDocumentPickerViewController(documentTypes: IOPFileUploadController.docTypes, in: .import)
//        documentPickVC.modalPresentationStyle = .fullScreen
//        documentPickVC.delegate = self
//        self.present(documentPickVC, animated: true, completion: nil)
    }
    
    func presentOptionsMenu() {
        guard let url = localFileUrl as URL? else {
            NNProgressHUD.showText("文件链接不能为空")
            return
        }
        delegate?.fileShare?(url.path, forKey: key)

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
        
        manager.post(urlString, parameters: parameters, constructingBodyWith: { (formData) in
            for (key, value) in parameters {
                switch value {
                case is String:
                    if let data = (value as! String).data(using: .utf8) {
                        formData.appendPart(withForm: data, name: key)
                    }
                    
                case is Data:
                    formData.appendPart(withForm: value as! Data, name: key)
                    
                case is URL, is NSURL:
                    do{
                        try formData.appendPart(withFileURL: value as! URL, name: key)
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
            guard let dict = responseObject as? [String: Any], let dic = dict["data"] as? [String: Any] else { return }
//            let dic = (responseObject as! [String: Any])["data"] as! [String: Any]
            self.delegate?.fileUpload?(dic["url"] as! String, forKey: self.key)
            
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
            let documentsDirectoryURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let docURL: URL = (documentsDirectoryURL?.appendingPathComponent(response.suggestedFilename!))!
            return docURL
        }) { (response, url, error) in
            DDLog("File downloaded to:\(url?.path ?? "地址错误")")
            self.localFileUrl = url as NSURL?
//            self.previewVC.reloadData()
            
            if error != nil {
                NNProgressHUD.showError(error?.localizedDescription)
            } else {
                NNProgressHUD.dismiss()
            }
        }
        task.resume()
    }
}


extension IOPFileUploadController: UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        localFileUrl = url as NSURL
    }
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        setupContentInsetAdjustmentBehavior(false)
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
    //    "public.image",
//        "public.content",
    //    "public.composite-content",
    //    "public.archive",
    //    "public.audio",
    //    "public.movie",
        "public.text",
    //    "public.data",
        ]
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
