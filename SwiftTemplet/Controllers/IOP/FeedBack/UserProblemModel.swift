//
//  UserProblemModel.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/8/18.
//  Copyright © 2021 BN. All rights reserved.
//

import UIKit
import IGListKit

class Feed: NSObject {

    var feedId: UInt = 0
    var avatar: String = ""
    var userName: String = ""
    var content: String = ""
    var isFavor: Bool = false
    var favor: UInt = 0
    var images: [String]! = []
    var comments: [Comment]?
}

extension Feed: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return feedId as NSObjectProtocol
    }
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard self !== object else { return true }
        guard let object = object as? Feed else { return false }
        return feedId == object.feedId
    }
}



class Comment: Codable {
    var comment: String = ""
    var person: String = ""
}

extension Comment: Equatable {
    static func == (lhs: Comment, rhs: Comment) -> Bool {
        return (lhs.comment == rhs.comment) && (lhs.person == rhs.person)
    }
}
