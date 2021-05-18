//
//  CKShareDemoController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/5/18.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import CloudKit

class CKShareDemoController: UIViewController, UICloudSharingControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "done", style: .plain, target: self, action: #selector(didTapCloudSharingButton))
    }

    @objc func didTapCloudSharingButton() {
        
        let cloudSharingController = UICloudSharingController(preparationHandler: { controller, preparationCompletionHandler in
            
            // Create image record
            let fileName = "titanium_mobile"
            let newRecord = CKRecord(recordType: "ImageRecord", recordID: CKRecord.ID(recordName: "test"))
            let image = UIImage(named: fileName)

            // Write to filesystem
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let imageFilePath = (documentDirectory as NSString).appendingPathComponent(fileName)
            let myUrl = URL(fileURLWithPath: imageFilePath)
            
            do {
                let data = image!.pngData()
                try data?.write(to: myUrl, options: .atomicWrite)
                let asset = CKAsset(fileURL: myUrl)
                
                newRecord["image"] = asset
            } catch {
                print("Could not write to filesystem")
            }
            
            // Initialize cloud sharing
            let share = CKShare(rootRecord: newRecord)
            share[CKShare.SystemFieldKey.title] = "\(fileName).png" as CKRecordValue
            share[CKShare.SystemFieldKey.shareType] = "com.appcelerator.CloudSharingExample" as CKRecordValue
            
            // Prepare records
            let modifyRecordsOperation = CKModifyRecordsOperation(recordsToSave: [newRecord, share], recordIDsToDelete: nil)
            
            modifyRecordsOperation.timeoutIntervalForRequest = 15
            modifyRecordsOperation.timeoutIntervalForResource = 15
            
            modifyRecordsOperation.modifyRecordsCompletionBlock = { records, recordIDs, error in
                if error != nil {
                    print("Error: \(String(describing: error?.localizedDescription))")
                }
                preparationCompletionHandler(share, CKContainer.default(), error)
            }
            
            OperationQueue().addOperation(modifyRecordsOperation)
        })
        
        // Set sharing delegate
        cloudSharingController.delegate = self
        
        // Set sharing permissions
        cloudSharingController.availablePermissions = [.allowPublic, .allowReadOnly]
        
        // Show cloud shareing dialog
        self.present(cloudSharingController, animated: true, completion: nil)
    }
    
    // MARK: CloudKit Delegates
    
    func itemTitle(for csc: UICloudSharingController) -> String? {
        return "titanium_mobile.png"
    }
    
    @available(iOS 10.0, *)
    func cloudSharingController(_ csc: UICloudSharingController, failedToSaveShareWithError error: Error) {
        print("failedToSaveShareWithError: \(error.localizedDescription)")
    }
    
    func cloudSharingControllerDidSaveShare(_ csc: UICloudSharingController) {
        print("cloudSharingControllerDidSaveShare")
    }
    
    func cloudSharingControllerDidStopSharing(_ csc: UICloudSharingController) {
        print("cloudSharingControllerDidStopSharing")
    }
}
