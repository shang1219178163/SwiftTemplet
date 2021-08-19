//
//  ScanningDocumentsController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/2.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import Vision
import VisionKit

import SwiftExpand
import SnapKit

@available(iOS 13.0, *)
class ScanningDocumentsController: UIViewController {
    
    lazy var textRecognitionRequest: VNRecognizeTextRequest = {
        let request = VNRecognizeTextRequest(completionHandler: nil)
        request.recognitionLevel = .accurate  // .accurate と .fast が選択可能
//        request.recognitionLanguages = ["en-US", "zh-Hans", "zh-Hant"] // 言語を選ぶ
        request.recognitionLanguages = ["zh-Hans", ]
        request.usesLanguageCorrection = true //
        return request
    }()
    
    private let textRecognitionWorkQueue = DispatchQueue(label: "TextRecognitionQueue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    
    var fixedImage: UIImage!
    
    lazy var imageView: BoundingBoxImageView = {
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .secondarySystemBackground
        return $0
    }(BoundingBoxImageView())
    
    
    lazy var textView: UITextView = {
        $0.backgroundColor = .secondarySystemBackground
        return $0
    }(UITextView())
    
    lazy var progressView: UIProgressView = {
        $0.tintColor = .systemOrange

        return $0
    }(UIProgressView())
    
    lazy var scanButton: UIButton = {
        $0.setTitle("Scan", for: .normal)
        $0.setBackgroundColor(.systemOrange, for: .normal)
        $0.addActionHandler { (sender) in
            DDLog(sender.currentTitle ?? "")
        }
        return $0
    }(UIButton())
        

    // MARK: -lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "文档扫描"
        view.addSubview(imageView)
        view.addSubview(textView)
        view.addSubview(progressView)
        view.addSubview(scanButton)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "refresh", style: .plain, target: self, action: #selector(handleActionItem(_:)))
        scanButton.addTarget(self, action: #selector(scanDocument), for: .touchUpInside)
        
        setupVision()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if #available(iOS 14.0, *) {
            let supportLanguageArray = try? VNRecognizeTextRequest.supportedRecognitionLanguages(for: .accurate, revision: VNRecognizeTextRequestRevision2)
            print(supportLanguageArray as Any)
//            ["en-US", "fr-FR", "it-IT", "de-DE", "es-ES", "pt-BR", "zh-Hans", "zh-Hant"]
        }
    }
    
    @objc func handleActionItem(_ item: UIBarButtonItem) {
        guard let fixedImage = fixedImage else { return }
        processImage(fixedImage)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalToSuperview().multipliedBy(0.35)
        }
        
        scanButton.snp.makeConstraints { (make) in
            make.left.right.equalTo(imageView)
            make.bottom.equalToSuperview().offset(-15)
            make.height.equalTo(50)
        }
        
        progressView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.bottom.equalTo(scanButton.snp.top).offset(-10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(3)
        }
        
        textView.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.left.right.equalTo(imageView)
            make.bottom.equalTo(progressView.snp.top).offset(-20)
        }
    }

    
    /// Setup the Vision request as it can be reused
    private func setupVision() {
        textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            
            var detectedText = ""
            var boundingBoxes = [CGRect]()
            for observation in observations {
                guard let topCandidate = observation.topCandidates(1).first else { return }
                
                detectedText += topCandidate.string
                detectedText += "\n"
                
                do {
                    guard let rectangle = try topCandidate.boundingBox(for: topCandidate.string.startIndex..<topCandidate.string.endIndex) else { return }
                    boundingBoxes.append(rectangle.boundingBox)
                } catch {
                    // You should handle errors appropriately in your app
                    print(error)
                }
            }
            
            DispatchQueue.main.async {
                self.scanButton.isEnabled = true
                self.progressView.progress = 1
                
                self.textView.text = detectedText
                self.textView.flashScrollIndicators()
                
                self.imageView.load(boundingBoxes: boundingBoxes)
            }
        }
        
        // I have not yet been able to get the progressHandler working (to display the progress indicator progress normally) as it seems to have a bug that causes random crashes
//        textRecognitionRequest.progressHandler = { [weak self] (_, progress, _) in
//            DispatchQueue.main.async {
//                self.scanButton.isEnabled = progress == 1
//                self.progressIndicator.progress = Float(progress)
//            }
//        }
    }
    
    /// Shows a `VNDocumentCameraViewController` to let the user scan documents
    @objc func scanDocument() {
        let scannerVC = VNDocumentCameraViewController()
        scannerVC.delegate = self
        present(scannerVC, animated: true)
    }
    
    // MARK: - Scan Handling
    
    /// Processes the image by displaying it and extracting text which is shown to the user
    /// - Parameter image: A `UIImage` to process
    private func processImage(_ image: UIImage) {
        imageView.image = image
        imageView.removeExistingBoundingBoxes()
        
        recognizeTextInImage(image)
    }
    
    /// Recognizes and displays the text from the image
    /// - Parameter image: `UIImage` to process and perform OCR on
    private func recognizeTextInImage(_ image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        
        textView.text = ""
        scanButton.isEnabled = false
        progressView.progress = 0
        
        textRecognitionWorkQueue.async {
            let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            do {
                try requestHandler.perform([self.textRecognitionRequest])
            } catch {
                print(error)
            }
        }
    }
    
    
    func reloadedImage(_ originalImage: UIImage) -> UIImage {
        guard let imageData = originalImage.jpegData(compressionQuality: 1),
            let reloadedImage = UIImage(data: imageData) else {
                return originalImage
        }
        return reloadedImage
    }
}


@available(iOS 13.0, *)
extension ScanningDocumentsController: VNDocumentCameraViewControllerDelegate {
    
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        // Make sure the user scanned at least one page
        guard scan.pageCount >= 1 else {
            // You are responsible for dismissing the VNDocumentCameraViewController.
            controller.dismiss(animated: true)
            return
        }
        
        // This is a workaround for the VisionKit bug which breaks the `UIImage` returned from `VisionKit`
        // See the `Image Loading Hack` section below for more information.
        let originalImage = scan.imageOfPage(at: 0)
        let fixedImage = reloadedImage(originalImage)
        
        // You are responsible for dismissing the VNDocumentCameraViewController.
        controller.dismiss(animated: true)
        
        // Process the image
        self.fixedImage = fixedImage
        processImage(fixedImage)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        // The VNDocumentCameraViewController failed with an error.
        // For now, we'll print it, but you should handle it appropriately in your app.
        print(error)
        
        // You are responsible for dismissing the VNDocumentCameraViewController.
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        // You are responsible for dismissing the VNDocumentCameraViewController.
        controller.dismiss(animated: true)
    }
    
}


import Vision
import UIKit

/// Custom `UIImageView` subclass that adds support for displaying bounding boxes around detected text
@available(iOS 11.0, *)
class BoundingBoxImageView: UIImageView {
    
    /// The bounding boxes currently shown
    private var boundingBoxViews = [UIView]()
    
    func load(boundingBoxes: [CGRect]) {
        // Remove all the old bounding boxes before adding the new ones
        removeExistingBoundingBoxes()
        
        // Add each bounding box
        for box in boundingBoxes {
            load(boundingBox: box)
        }
    }
    
    /// Removes all existing bounding boxes
    func removeExistingBoundingBoxes() {
        for view in boundingBoxViews {
            view.removeFromSuperview()
        }
        boundingBoxViews.removeAll()
    }
    
    private func load(boundingBox: CGRect) {
        // Cache the image rectangle to avoid unneccessary work
        let imageRect = self.imageRect
        
        // Create a mutable copy of the bounding box
        var boundingBox = boundingBox
        
        // Flip the Y axis of the bounding box because Vision uses a different coordinate system to that of UIKit
        boundingBox.origin.y = 1 - boundingBox.origin.y
        
        // Convert the bounding box rect based on the image rectangle
        var convertedBoundingBox = VNImageRectForNormalizedRect(boundingBox, Int(imageRect.width), Int(imageRect.height))
        
        // Adjust the bounding box based on the position of the image inside the UIImageView
        // Note that we only adjust the axis that is not the same in both--because we're using `scaleAspectFit`, one of the axis will always be equal
        if frame.width - imageRect.width != 0 {
            convertedBoundingBox.origin.x += imageRect.origin.x
            convertedBoundingBox.origin.y -= convertedBoundingBox.height
        } else if frame.height - imageRect.height != 0 {
            convertedBoundingBox.origin.y += imageRect.origin.y
            convertedBoundingBox.origin.y -= convertedBoundingBox.height
        }
        
        // Enlarge the bounding box to make it contain the text neatly
        let enlargementAmount = CGFloat(2.2)
        convertedBoundingBox.origin.x    -= enlargementAmount
        convertedBoundingBox.origin.y    -= enlargementAmount
        convertedBoundingBox.size.width  += enlargementAmount * 2
        convertedBoundingBox.size.height += enlargementAmount * 2
        
        // Create a view with a narrow border and transparent background as the bounding box
        let view = UIView(frame: convertedBoundingBox)
        view.layer.opacity = 1
        view.layer.borderColor = UIColor.orange.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 2
        view.layer.masksToBounds = true
        view.backgroundColor = .clear
        
        addSubview(view)
        boundingBoxViews.append(view)
    }
}

extension UIImageView {
    /// Calculates the rect of an image displayed in a `UIImageView` with the `scaleAspectFit` `contentMode`
    var imageRect: CGRect {
        guard let image = image else { return bounds }
        guard contentMode == .scaleAspectFit else { return bounds }
        guard image.size.width > 0 && image.size.height > 0 else { return bounds }
        
        let scale: CGFloat
        if image.size.width > image.size.height {
            scale = bounds.width / image.size.width
        } else {
            scale = bounds.height / image.size.height
        }
        
        let size = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        let x = (bounds.width - size.width) / 2.0
        let y = (bounds.height - size.height) / 2.0
        
        return CGRect(x: x, y: y, width: size.width, height: size.height)
    }
}
