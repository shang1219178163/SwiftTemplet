//
//  BNPageModel.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2019/4/30.
//  Copyright © 2019 BN. All rights reserved.
//

import UIKit

class BNPageModel: NSObject {

    var currPage: NSInteger = 1;
    var firstPage: NSInteger = 1{
        didSet{
            assert(oldValue >= 1)
            currPage = oldValue
        }
    }
    ///  每页数量限制
    var limit: NSInteger = 30
    var hasNextPage: Bool = true
    
    var hasPrePage: Bool {
        return currPage > firstPage;
    }
    
    func turnToFirstPage(_ page: NSInteger) -> Void {
        currPage = firstPage;
    }
    
    func turnToPrePage(_ page: NSInteger) -> Void {
        currPage -= 1;
    }
    
    func turnToNextPage(_ page: NSInteger) -> Void {
        currPage += 1;
    }
    
    func hasNextPageWithItems(_ items: NSArray) -> Bool {
        hasNextPage = items.count >= limit;
        return hasNextPage;
    }
    
}
