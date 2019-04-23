//
//  UITableView+Helper.swift
//  SwiftExpand
//
//  Created by Bin Shang on 2019/1/9.
//

import UIKit

extension UITableView{
    
    func reloadRowList(_ rowList: NSArray, section: Int, rowAnimation: UITableViewRowAnimation = .fade) -> Void {
        assert(section <= numberOfSections)
        let rowMax = rowList.value(forKeyPath: kArr_max_inter) as! Int
        assert(rowMax < numberOfRows(inSection: section))
        
        var marr: [IndexPath] = []
        for e in rowList.enumerated() {
            if let row = e.element as? NSNumber {
                marr.append(IndexPath(row: row.intValue , section: section))

            }
        }
        beginUpdates()
        reloadRows(at: marr, with: rowAnimation)
        endUpdates()
    }
    
    func insertRowList(_ rowList: NSArray, section: NSInteger, rowAnimation: UITableViewRowAnimation = .fade) -> Void {
        var marr: [IndexPath] = []
        for e in rowList.enumerated() {
            if let row = e.element as? NSNumber {
                marr.append(IndexPath(row: row.intValue , section: section))
                
            }
        }
        beginUpdates()
        insertRows(at: marr, with: rowAnimation)
        endUpdates()
    }
    
    func deleteRowList(_ rowList: NSArray, section: NSInteger, rowAnimation: UITableViewRowAnimation = .fade) -> Void {
        assert(section <= numberOfSections)
        let rowMax = rowList.value(forKeyPath: kArr_max_inter) as! Int
        assert(rowMax < numberOfRows(inSection: section))
        
        if rowList.count == numberOfRows(inSection: section) && numberOfSections != 1 {
            beginUpdates()
            deleteSections(NSIndexSet(index: section) as IndexSet, with: rowAnimation)
            endUpdates()
        } else {
            var marr: [IndexPath] = []
            for e in rowList.enumerated() {
                if let row = e.element as? NSNumber {
                    marr.append(IndexPath(row: row.intValue , section: section))
                    
                }
            }
            beginUpdates()
            deleteRows(at: marr, with: rowAnimation)
            endUpdates()
        }
    }
}
